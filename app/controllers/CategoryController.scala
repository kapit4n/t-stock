package controllers

import play.api.mvc._
import play.api.i18n._
import play.api.data.Form
import play.api.data.Forms._
import play.api.libs.json.Json
import models._
import dal._

import scala.concurrent.{ExecutionContext, Future}

import javax.inject._
import security.MyDeadboltHandler

/**
  * Category controller
  * @param repo
  * @param messagesApi
  * @param ec
  */
class CategoryController @Inject()(repo: CategoryRepository, val messagesApi: MessagesApi)(implicit ec: ExecutionContext) extends Controller with I18nSupport {

  /**
    * Form to create a new category
    */
  val newForm: Form[CreateCategoryForm] = Form {
    mapping(
      "name" -> nonEmptyText,
      "description" -> text)(CreateCategoryForm.apply)(CreateCategoryForm.unapply)
  }

  // Category to be updated
  var currentCategory: Category = _

  /**
    * Show the category list
    * @return
    */
  def index = LanguageAction.async { implicit request =>
    repo.list().map { res =>
      Ok(views.html.category.category_index(new MyDeadboltHandler, res))
    }
  }

  /**
    * Renders the new category
    * @return
    */
  def addGet = LanguageAction { implicit request =>
    Ok(views.html.category.category_add(new MyDeadboltHandler, newForm))
  }

  /**
    * Creates a new category
    * @return
    */
  def add = LanguageAction.async { implicit request =>
    newForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.category.category_add(new MyDeadboltHandler, errorForm)))
      },
      category => {
        repo.create(
          category.name, category.description,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { resNew =>
          Redirect(routes.CategoryController.show(resNew.name))
        }
      })
  }

  /**
    * Updates a category info
    */
  val updateForm: Form[UpdateCategoryForm] = Form {
    mapping(
      "name" -> nonEmptyText,
      "description" -> nonEmptyText
    )(UpdateCategoryForm.apply)(UpdateCategoryForm.unapply)
  }

  /**
    * Renders a category information by name
    * @param name
    * @return
    */
  def show(name: String) = LanguageAction.async { implicit request =>
    repo.getByName(name).map { res =>
      Ok(views.html.category.category_show(new MyDeadboltHandler, res(0)))
    }
  }

  /**
    * Renders the page to update a category
    * @param name
    * @return
    */
  def getUpdate(name: String) = LanguageAction.async { implicit request =>
    repo.getByName(name).map { cat =>
      currentCategory = cat(0)
      val anyData = Map("name" -> currentCategory.name.toString().toString(), "description" -> currentCategory.description.toString())
      Ok(views.html.category.category_update(new MyDeadboltHandler, currentCategory, updateForm.bind(anyData)))
    }
  }

  /**
    * Deletes a category by name
    * @param name
    * @return
    */
  def delete(name: String) = LanguageAction.async { implicit request =>
    repo.delete(name).map { res =>
      Redirect(routes.CategoryController.index)
    }
  }

  /**
    * Gets a category
    * @param name
    * @return
    */
  def getByName(name: String) = LanguageAction.async {
    repo.getByName(name).map { res =>
      Ok(Json.toJson(res))
    }
  }

  /**
    * Updates a category
    * @return
    */
  def updatePost = LanguageAction.async { implicit request =>
    updateForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.category.category_update(new MyDeadboltHandler, currentCategory, errorForm)))
      },
      res => {
        repo.update(
          res.name, res.description,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { _ =>
          Redirect(routes.CategoryController.show(res.name))
        }
      })
  }
}

/**
  * Create category form
  * @param name
  * @param description
  */
case class CreateCategoryForm(name: String, description: String)

/**
  * Update category form
  * @param name
  * @param description
  */
case class UpdateCategoryForm(name: String, description: String)