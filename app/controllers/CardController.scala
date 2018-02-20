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
import scala.concurrent.{ ExecutionContext, Future, Await }
import scala.collection.mutable.ListBuffer
import java.util.LinkedHashMap
import collection.mutable
import scala.collection.mutable.ArrayBuffer

import javax.inject._
import be.objectify.deadbolt.scala.DeadboltActions
import security.MyDeadboltHandler

class CardController @Inject() (repo: ProductRequestRepository, repoProducts: ProductRepository,
  repoRow: RequestRowRepository, repoVete: UserRepository,
  repoSto: UserRepository, repoInsUser: UserRepository,
  val messagesApi: MessagesApi)(implicit ec: ExecutionContext) extends Controller with I18nSupport {

  val newForm: Form[CreateProductRequestForm] = Form {
    mapping(
      "date" -> text,
      "employee" -> longNumber,
      "storekeeper" -> longNumber,
      "status" -> text,
      "detail" -> text)(CreateProductRequestForm.apply)(CreateProductRequestForm.unapply)
  }

  val addCardForm: Form[AddCardForm] = Form {
    mapping(
      "id" -> nonEmptyText)(AddCardForm.apply)(AddCardForm.unapply)
  }

  var employeesNames = getEmployeeListNamesMap()
  var storeNames = getStorekeepersNamesMap()
  var products = getProducts()

  def index = LanguageAction.async { implicit request =>
    repo.list().map { res =>
      Ok(views.html.order.productRequest_index(new MyDeadboltHandler, res))
    }
  }

  def addGet = LanguageAction { implicit request =>
    if (request.session.get("role").getOrElse("0").toLowerCase == "employee") {
      employeesNames = getEmployeeNamesMap(request.session.get("userId").getOrElse("0").toLong)
    } else {
      employeesNames = getEmployeeListNamesMap()
    }
    storeNames = getStorekeepersNamesMap()
    Ok(views.html.order.productRequest_add(new MyDeadboltHandler, newForm, employeesNames, storeNames))
  }

  def add = LanguageAction.async { implicit request =>
    newForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.order.productRequest_add(new MyDeadboltHandler, errorForm, employeesNames, storeNames)))
      },
      res => {
        repo.create(
          res.date, res.employee, employeesNames(res.employee.toString),
          res.storekeeper, storeNames(res.storekeeper.toString),
          res.status, res.detail, "veterinaria",
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { resNew =>
            Redirect(routes.ProductRequestController.show(resNew.id))
          }
      })
  }

  def getProductRequestsByEmployee(id: Long) = LanguageAction.async {
    repo.listByEmployee(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  def getProductRequestsByStorekeeper(id: Long) = LanguageAction.async {
    repo.listByStorekeeper(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  def getProductRequestsByInsumoUser(id: Long) = LanguageAction.async {
    repo.listByInsumoUser(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  def getProductRequests = LanguageAction.async {
    repo.list().map { res =>
      Ok(Json.toJson(res))
    }
  }

  // update required
  val updateForm: Form[UpdateProductRequestForm] = Form {
    mapping(
      "id" -> longNumber,
      "date" -> text,
      "employee" -> longNumber,
      "storekeeper" -> longNumber,
      "status" -> text,
      "detail" -> text)(UpdateProductRequestForm.apply)(UpdateProductRequestForm.unapply)
  }

  def getChildren(productRequestId: Long): Seq[RequestRow] = {
    Await.result(repoRow.listByParent(productRequestId).map { res =>
      res
    }, 3000.millis)
  }

  // to copy
  def show(id: Long) = LanguageAction.async { implicit request =>
    val requestRows = getChildren(id)
    products = getProducts()
    repo.getById(id).map { res =>
      Ok(views.html.card_show(new MyDeadboltHandler, res(0), requestRows, addCardForm, products))
    }
  }

  var updatedId: Long = 0
  // update required
  def getUpdate(id: Long) = LanguageAction.async { implicit request =>
    updatedId = id;
    repo.getById(id).map {
      case (res) =>
        val anyData = Map("id" -> id.toString().toString(), "date" -> res.toList(0).date.toString(), "employee" -> res.toList(0).employee.toString(), "storekeeper" -> res.toList(0).storekeeper.toString(), "status" -> res.toList(0).status.toString(), "detail" -> res.toList(0).detail.toString())
        if (request.session.get("role").getOrElse("0").toLowerCase == "employee") {
          employeesNames = getEmployeeNamesMap(request.session.get("userId").getOrElse("0").toLong)
        } else {
          employeesNames = getEmployeeListNamesMap()
        }
        storeNames = getStorekeepersNamesMap()
        Ok(views.html.order.productRequest_update(new MyDeadboltHandler, updatedId, updateForm.bind(anyData), employeesNames, storeNames))
    }
  }

  // update required
  def getSend(id: Long) = LanguageAction.async { implicit request =>
    repo.sendById(id).map {
      case (res) =>
        Redirect(routes.ProductRequestController.index())
    }
  }

  // update required
  def getFinish(id: Long) = LanguageAction.async { implicit request =>
    repo.finishById(id).map {
      case (res) =>
        Redirect(routes.ProductRequestController.index())
    }
  }

  def getEmployeeNamesMap(id: Long): Map[String, String] = {
    Await.result(repoVete.getById(id).map {
      case (res1) =>
        val cache = collection.mutable.Map[String, String]()
        res1.foreach { user =>
          cache put (user.id.toString, user.name)
        }

        cache.toMap
    }, 3000.millis)
  }

  def getEmployeeListNamesMap(): Map[String, String] = {
    Await.result(repoVete.listEmployees().map {
      case (res1) =>
        val cache = collection.mutable.Map[String, String]()
        res1.foreach { user =>
          cache put (user.id.toString, user.name)
        }

        cache.toMap
    }, 3000.millis)
  }

  def getInsumoUserNamesMap(): Map[String, String] = {
    Await.result(repoInsUser.listInsumoUsers().map {
      case (res1) =>
        val cache = collection.mutable.Map[String, String]()
        res1.foreach { user =>
          cache put (user.id.toString, user.name)
        }

        cache.toMap
    }, 3000.millis)
  }

  def getStorekeepersNamesMap(): Map[String, String] = {
    Await.result(repoSto.listStorekeepers().map {
      case (res1) =>
        val cache = collection.mutable.Map[String, String]()
        res1.foreach { user =>
          cache put (user.id.toString, user.name)
        }

        cache.toMap
    }, 3000.millis)
  }

  def getProducts(): Seq[Product] = {
    Await.result(repoProducts.list().map {
      case (res1) =>
        res1
    }, 3000.millis)
  }

  // delete required
  def delete(id: Long) = LanguageAction.async {
    val requestRows = getChildren(id)
    requestRows.foreach { req =>
      repoRow.delete(req.id)
    }
    repo.delete(id).map { res =>
      Redirect(routes.ProductRequestController.index)
    }
  }

  // to copy
  def getById(id: Long) = LanguageAction.async {
    repo.getById(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  def addCardPost = LanguageAction.async { implicit request =>
    addCardForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Redirect(routes.CardController.show(1)))
      },
      res => {
        // Create the order detail here with res.id and currentCardId with 1 default quantity
        Future.successful(Redirect(routes.CardController.show(1)))
      })
  }


  // update required
  def updatePost = LanguageAction.async { implicit request =>
    updateForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.order.productRequest_update(new MyDeadboltHandler, updatedId, errorForm, Map[String, String](), Map[String, String]())))
      },
      res => {
        repo.update(
          res.id, res.date, res.employee, employeesNames(res.employee.toString),
          res.storekeeper, storeNames(res.storekeeper.toString), res.status, res.detail, "insumo",
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { _ =>
            Redirect(routes.ProductRequestController.show(res.id))
          }
      })
  }
}

case class AddCardForm(id: String)

//case class CreateProductRequestForm(date: String, employee: Long, storekeeper: Long, status: String, detail: String)

//case class UpdateProductRequestForm(id: Long, date: String, employee: Long, storekeeper: Long, status: String, detail: String)