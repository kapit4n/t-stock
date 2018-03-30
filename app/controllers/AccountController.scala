package controllers

import scala.concurrent.duration._
import play.api._
import play.api.mvc._
import play.api.i18n._
import play.api.data.Form
import play.api.data.Forms._
import play.api.data.validation.Constraints._
import play.api.libs.json.Json
import models._
import dal._

import scala.concurrent.{ExecutionContext, Future, Await}

import javax.inject._
import it.innove.play.pdf.PdfGenerator
import be.objectify.deadbolt.scala.DeadboltActions
import security.MyDeadboltHandler

class AccountController @Inject()(repo: AccountRepository, repoDetails: TransactionDetailRepository, val messagesApi: MessagesApi)(implicit ec: ExecutionContext) extends Controller with I18nSupport {

  val yes_no = scala.collection.immutable.Map[String, String]("NO" -> "NO", "SI" -> "SI")
  val account_type = scala.collection.immutable.Map[String, String]("ACTIVO" -> "ACTIVO", "PASIVO" -> "PASIVO", "PATRIMONIO" -> "PATRIMONIO", "OUTCOME" -> "OUTCOME", "INCOME" -> "INCOME")
  var udpatedRow: Account = _

  val newForm: Form[CreateAccountForm] = Form {
    mapping(
      "code" -> nonEmptyText,
      "name" -> nonEmptyText,
      "type_1" -> nonEmptyText,
      "negativo" -> nonEmptyText,
      "parent" -> longNumber,
      "description" -> text)(CreateAccountForm.apply)(CreateAccountForm.unapply)
  }

  def index = LanguageAction.async { implicit request =>
    repo.list().map { res =>
      accounts = res
      Ok(views.html.account.account_index(new MyDeadboltHandler, searchAccountForm, accounts))
    }
  }

  def addGet = LanguageAction { implicit request =>
    parentAccounts = getAccountNamesMap()
    Ok(views.html.account.account_add(new MyDeadboltHandler, searchAccountForm, newForm, yes_no, account_type, parentAccounts))
  }

  var parentAccounts: Map[String, String] = _
  var accounts: Seq[Account] = _

  def add = LanguageAction.async { implicit request =>
    newForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.account.account_add(new MyDeadboltHandler, searchAccountForm, errorForm, yes_no, account_type, parentAccounts)))
      },
      res => {
        repo.create(res.code, res.name, res.type_1, res.negativo,
          res.parent, res.description,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { resNew =>
          Redirect(routes.AccountController.show(resNew.id))
        }
      })
  }

  def getAccounts = LanguageAction.async {
    repo.list().map { res =>
      Ok(Json.toJson(res))
    }
  }

  def getAccountsReport = LanguageAction.async {
    repo.list().map { res =>
      Ok(Json.toJson(res))
    }
  }

  // update required
  val updateForm: Form[UpdateAccountForm] = Form {
    mapping(
      "id" -> longNumber,
      "code" -> nonEmptyText,
      "name" -> nonEmptyText,
      "type_1" -> nonEmptyText,
      "negativo" -> nonEmptyText,
      "parent" -> longNumber,
      "description" -> text)(UpdateAccountForm.apply)(UpdateAccountForm.unapply)
  }

  def accountChildrenSeq(id: Long): Seq[Account] = {
    Await.result(repo.getByParent(id).map { res =>
      res
    }, 2000.millis)
  }

  def accountDetailsSeq(id: Long): Seq[TransactionDetail] = {
    Await.result(repoDetails.listByAccount(id).map { res =>
      res
    }, 2000.millis)
  }

  // to copy
  def show(id: Long) = LanguageAction.async { implicit request =>
    val children: Seq[Account] = accountChildrenSeq(id)
    val details = accountDetailsSeq(id)
    repo.getById(id).map { res =>
      Ok(views.html.account.account_show(new MyDeadboltHandler, res(0), children, details))
    }
  }

  // update required
  def getUpdate(id: Long) = LanguageAction.async { implicit request =>
    repo.getById(id).map { res =>
      udpatedRow = res(0)
      val anyData = Map(
        "id" -> id.toString().toString(), "code" -> udpatedRow.code,
        "name" -> udpatedRow.name.toString(),
        "negativo" -> udpatedRow.negativo.toString(),
        "parent" -> udpatedRow.parent.toString(),
        "type_1" -> udpatedRow.type_1.toString(),
        "negativo" -> udpatedRow.negativo.toString(),
        "parent" -> udpatedRow.parent.toString(),
        "description" -> udpatedRow.description)
      Ok(views.html.account.account_update(new MyDeadboltHandler, udpatedRow, updateForm.bind(anyData), yes_no, account_type, getAccountNamesMap()))
    }
  }

  // delete required
  def delete(id: Long) = LanguageAction.async {
    repo.delete(id).map { res =>
      Redirect(routes.AccountController.index)
    }
  }

  // to copy
  def getById(id: Long) = LanguageAction.async {
    repo.getById(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  // to copy
  def accountChildren(id: Long) = LanguageAction.async {
    repo.getByParent(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  // update required
  def updatePost = LanguageAction.async { implicit request =>
    updateForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.account.account_update(new MyDeadboltHandler, udpatedRow, errorForm, yes_no, account_type, getAccountNamesMap())))
      },
      res => {
        repo.update(res.id, res.code, res.name, res.type_1, res.negativo,
          res.parent, res.description,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { _ =>
          Redirect(routes.AccountController.show(res.id))
        }
      })
  }

  def getAccountNamesMap(): Map[String, String] = {
    val cache = collection.mutable.Map[String, String]()
    cache put("0", "--- Ninguno ---")
    Await.result(
      repo.getListObjs().map { accountResult =>
        accountResult.foreach {
          account =>
            cache put(account.id.toString, account.code + " ------------- " + account.name)
        }
      }, 1000.millis)
    cache.toMap
  }

  val searchAccountForm: Form[SearchAccountForm] = Form {
    mapping(
      "search" -> text)(SearchAccountForm.apply)(SearchAccountForm.unapply)
  }

  def searchParentAccountPost = LanguageAction.async { implicit request =>
    searchAccountForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.account.account_add(new MyDeadboltHandler, searchAccountForm, newForm, yes_no, account_type, parentAccounts)))
      },
      res => {
        repo.searchAccount(res.search).map { resAccounts =>
          val cache = collection.mutable.Map[String, String]()
          resAccounts.map { account =>
            cache put(account.id.toString(), account.code.toString + ": " + account.name.toString)
          }
          parentAccounts = cache.toMap
          Ok(views.html.account.account_add(new MyDeadboltHandler, searchAccountForm, newForm, yes_no, account_type, parentAccounts))
        }
      })
  }

  def searchAccountPost = LanguageAction.async { implicit request =>
    searchAccountForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.account.account_index(new MyDeadboltHandler, searchAccountForm, accounts)))
      },
      res => {
        repo.searchAccount(res.search).map { resAccounts =>
          accounts = resAccounts
          Ok(views.html.account.account_index(new MyDeadboltHandler, searchAccountForm, accounts))
        }
      })
  }

}

case class SearchAccountForm(search: String)

case class CreateAccountForm(code: String, name: String, type_1: String, negativo: String, parent: Long, description: String)

// Update required
case class UpdateAccountForm(id: Long, code: String, name: String, type_1: String, negativo: String, parent: Long, description: String)
