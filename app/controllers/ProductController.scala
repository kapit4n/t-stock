package controllers

import play.api.mvc._
import play.api.i18n._
import play.api.data.Form
import play.api.data.Forms._
import play.api.libs.json.Json
import play.api.data.format.Formats._
import scala.concurrent.duration._
import scala.concurrent.{ExecutionContext, Future, Await}
import javax.inject._
import security.MyDeadboltHandler
import models._
import dal._

/** Product controller to handler product routes and operations on it */
class ProductController @Inject()(repo: ProductRepository, repoVendor: VendorRepository,
                                  repoProductVendor: ProductVendorRepository, repoProdInv: ProductInvRepository,
                                  repoUnit: MeasureRepository, val messagesApi: MessagesApi)
                                 (implicit ec: ExecutionContext) extends Controller with I18nSupport {

  /** Form to create a new Product */
  val newForm: Form[CreateProductForm] = Form {
    mapping(
      "name" -> nonEmptyText,
      "cost" -> of[Double],
      "percent" -> of[Double],
      "description" -> text,
      "measureId" -> longNumber,
      "currentAmount" -> number,
      "stockLimit" -> number,
      "category" -> text)(CreateProductForm.apply)(CreateProductForm.unapply)
  }

  val searchForm: Form[SearchProductForm] = Form {
    mapping(
      "search" -> nonEmptyText)(SearchProductForm.apply)(SearchProductForm.unapply)
  }

  var measures = getMeasureMap()
  var productsList: Seq[(Product, Measure)] = _
  var products_1: Seq[(Product, Measure)] = _
  var vendors: Seq[Vendor] = _
  var vendorsAssigned: Seq[Vendor] = _
  var productId: Long = _
  var children: Seq[ProductInv] = _
  val categories = scala.collection.immutable.Map[String, String]("MILK" -> "MILK", "GADGET" -> "GADGET")
  var updatedRow: Product = _
  var updatedProductVendorRow: ProductVendor = _

  /** Gets measure form the database and return a map with id and name of them */
  def getMeasureMap(): Map[String, String] = {
    Await.result(repoUnit.getListNames().map {
      case (res1) =>
        val cache = collection.mutable.Map[String, String]()
        res1.foreach {
          case (key: Long, value: String) =>
            cache put(key.toString(), value)
        }

        cache.toMap
    }, 3000.millis)
  }

  /** Renders the product create page */
  def addGet = LanguageAction { implicit request =>
    measures = getMeasureMap()
    Ok(views.html.product.product_add(new MyDeadboltHandler, newForm, measures, categories))
  }

  /** Assign vendor to product and return to product show page */
  def assignVendor(productId: Long, vendorId: Long) = LanguageAction.async { implicit request =>
    repoProductVendor.createProductVendor(productId, vendorId).map(res =>
      Redirect(routes.ProductController.show(res.productId)))
  }

  /** Remove relation between vendor and product, and redirect to product show page */
  def removeVendor(id: Long, vendorId: Long) = LanguageAction.async { implicit request =>
    repoProductVendor.deleteProductVendor(id, vendorId).map(res =>
      Redirect(routes.ProductController.show(productId)))
  }

  /** Goes to product product list page */
  def index = LanguageAction.async { implicit request =>
    repo.joinExample()
    repo.listComplex().map { res =>
      productsList = res
      Ok(views.html.product.product_list(new MyDeadboltHandler, searchForm, productsList))
    }
  }

  /** Goes to product product list page */
  def cashier_index = LanguageAction.async { implicit request =>
    repo.joinExample()
    repo.listComplex().map { res =>
      productsList = res
      Ok(views.html.product.cashier.product_list(new MyDeadboltHandler, searchForm, productsList))
    }
  }

  /** Goes to product product list page */
  def index1 = LanguageAction.async { implicit request =>
    repo.joinExample()
    repo.listComplex().map { res =>
      products_1 = res
      Ok(views.html.product.product_list1(new MyDeadboltHandler, searchForm, products_1))
    }
  }

  /** Get the product that are on the minimum quantity to reorder */
  def reorder_index = LanguageAction.async { implicit request =>
    repo.reorder_listComplex().map { res =>
      productsList = res
      Ok(views.html.product.product_list(new MyDeadboltHandler, searchForm, productsList))
    }
  }

  /** List page */
  def list = LanguageAction { implicit request =>


    Ok(views.html.product.product_list(new MyDeadboltHandler, searchForm, productsList))
  }

  /** Saves a new product to the database */
  def addProduct = LanguageAction.async { implicit request =>
    newForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.product.product_add(new MyDeadboltHandler, errorForm, measures, categories)))
      },
      res => {
        repo.create(
          res.name, res.cost, res.percent, res.cost + res.cost * res.percent, res.description,
          res.measureId, measures(res.measureId.toString),
          res.currentAmount,
          res.stockLimit,
          res.category,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { resNew =>
          Redirect(routes.ProductController.show(resNew.id))
        }
      })
  }

  /** Return a list of products that match with seach param */
  def searchProduct(search: String): Seq[(Product, Measure)] = {
    Await.result(repo.searchProductComplex(search).map { res =>
      res
    }, 1000.millis)
  }

  /** Get total count of products */
  def getTotal(): Int = {
    Await.result(repo.getTotal().map {
      case (res1) =>
        res1
    }, 3000.millis)
  }

  /** Applies the search criteria to the list shown in the list page */
  def searchProductPost = LanguageAction.async { implicit request =>
    var total = getTotal()
    var currentPage = 1
    searchForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.product.product_list(new MyDeadboltHandler, searchForm, productsList)))
      },
      res => {
        productsList = searchProduct(res.search)
        Future(Ok(views.html.product.product_list(new MyDeadboltHandler, searchForm, productsList)))
      })
  }

  /** Get the list of products on json format.*/
  def getProducts = LanguageAction.async {
    repo.list().map { products =>
      Ok(Json.toJson(products))
    }
  }

  /** Form to work with update product page */
  val updateForm: Form[UpdateProductForm] = Form {
    mapping(
      "id" -> longNumber,
      "name" -> nonEmptyText,
      "cost" -> of[Double],
      "percent" -> of[Double],
      "price" -> of[Double],
      "description" -> text,
      "measureId" -> longNumber,
      "currentAmount" -> number,
      "stockLimit" -> number,
      "category" -> text)(UpdateProductForm.apply)(UpdateProductForm.unapply)
  }

  /** Form to work with product vendor relation */
  val updateProductVendorForm: Form[UpdateProductVendorForm] = Form {
    mapping(
      "id" -> longNumber,
      "productId" -> longNumber,
      "vendorId" -> longNumber,
      "cost" -> of[Double]
    )(UpdateProductVendorForm.apply)(UpdateProductVendorForm.unapply)
  }

  /** Get Products that has been bought */
  def getChildren(id: Long): Seq[ProductInv] = {
    Await.result(repoProdInv.listByProductId(id).map { res =>
      res
    }, 3000.millis)
  }

  /** Get list of vendors availables on the system */
  def getVendors(): Seq[Vendor] = {
    Await.result(repoVendor.list().map { res =>
      res
    }, 3000.millis)
  }

  /** Get vendor by Id */
  def getVendorsByIds(vendorIds: Seq[Long]): Seq[Vendor] = {
    Await.result(repoVendor.getListByIds(vendorIds).map { res =>
      res
    }, 3000.millis)
  }

  /** Get vendor list that are related to the current product */
  def getVendorsByProduct(): Seq[ProductVendor] = {
    Await.result(repoProductVendor.listVendorsByProductId(productId).map { res =>
      res
    }, 3000.millis)
  }

  /** Reload children, vendors, and assigned vendors rows */
  def reloadData() = {
    children = getChildren(productId)
    vendors = getVendors()
    var vendorIds = repoProductVendor.getVendorsIds(productId)
    vendorsAssigned = getVendorsByIds(vendorIds)
  }

  /** Renders product show page */
  def show(id: Long) = LanguageAction.async { implicit request =>
    productId = id
    reloadData()
    repo.getById(id).map { res =>
      Ok(views.html.product.product_show(new MyDeadboltHandler, res(0), children, vendors, vendorsAssigned))
    }
  }

  /** Render the product update page */
  def getUpdate(id: Long) = LanguageAction.async { implicit request =>
    repo.getById(id).map { res =>
      updatedRow = res(0)
      val productData = Map(
        "id" -> id.toString().toString(),
        "name" -> updatedRow.name,
        "cost" -> updatedRow.cost.toString(),
        "percent" -> updatedRow.percent.toString(),
        "price" -> updatedRow.price.toString(),
        "description" -> updatedRow.description,
        "measureId" -> updatedRow.measureId.toString(),
        "measureName" -> updatedRow.measureName.toString(),
        "currentAmount" -> updatedRow.currentAmount.toString(),
        "stockLimit" -> updatedRow.stockLimit.toString(),
        "category" -> updatedRow.category.toString())

      Ok(views.html.product.product_update(new MyDeadboltHandler, updatedRow, updateForm.bind(productData), measures, categories))
    }
  }

  /** Renders the product vendor relation to set the cost of the product for that vendor */
  def getProductVendorUpdate(productId: Long, vendorId: Long) = LanguageAction.async { implicit request =>
    repoProductVendor.getProductVendorById(productId, vendorId).map { res =>
      updatedProductVendorRow = res(0)
      val productVendorData = Map(
        "id" -> updatedProductVendorRow.id.toString().toString(),
        "cost" -> updatedProductVendorRow.cost.toString(),
        "productId" -> updatedProductVendorRow.productId.toString(),
        "vendorId" -> updatedProductVendorRow.vendorId.toString())

      Ok(views.html.product.productVendor_update(new MyDeadboltHandler, updatedProductVendorRow, updateProductVendorForm.bind(productVendorData)))
    }
  }

  /** Deletes the product by id */
  def delete(id: Long) = LanguageAction.async {
    repo.delete(id).map { res =>
      Redirect(routes.ProductController.index)
    }
  }

  /** Gets product by id on json format */
  def getById(id: Long) = LanguageAction.async {
    repo.getById(id).map { res =>
      Ok(Json.toJson(res))
    }
  }

  /** Updates the product information */
  def updatePost = LanguageAction.async { implicit request =>
    updateForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.product.product_update(new MyDeadboltHandler, updatedRow, errorForm, measures, categories)))
      },
      res => {
        repo.update(
          res.id, res.name, res.cost, res.percent, res.price,
          res.description, res.measureId, measures(res.measureId.toString),
          res.currentAmount, res.stockLimit, res.category,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { _ =>
          Redirect(routes.ProductController.show(res.id))
        }
      })
  }

  /** Updated the product vendor relation */
  def updateProductVendorPost = LanguageAction.async { implicit request =>
    updateProductVendorForm.bindFromRequest.fold(
      errorForm => {
        Future.successful(Ok(views.html.product.productVendor_update(new MyDeadboltHandler, updatedProductVendorRow, errorForm)))
      },
      res => {
        repoProductVendor.update(
          res.productId, res.cost,
          request.session.get("userId").get.toLong,
          request.session.get("userName").get.toString).map { _ =>
          Redirect(routes.ProductController.show(res.productId))
        }
      })
  }

  /** Uploads the product image */
  def upload(id: Long) = LanguageAction(parse.multipartFormData) { request =>
    request.body.file("picture").map { picture =>
      import java.io.File
      val filename = picture.filename;
      val type1 = filename.substring(filename.length - 4);
      val contentType = picture.contentType
      val fileNewName = id.toString() + "_product" + type1
      val path_1 = "/home/larce/projects/t-stock/app/assets/images/"
      //val path_1 = "/home/larce/projects/t-stock/public/images/"
      //val path_1 = "public/images/"
      try {
        new File(s"$path_1$fileNewName").delete()
      } catch {
        case e: Exception => println(e)
      }
      picture.ref.moveTo(new File(s"$path_1$fileNewName"))
      Redirect(routes.ProductController.show(id))
    }.getOrElse {
      Redirect(routes.ProductController.show(id)).flashing(
        "error" -> "Missing file")
    }
  }

}

/** class for search from */
case class SearchProductForm(search: String)

/** class for create form */
case class CreateProductForm(
                              name: String, cost: Double, percent: Double,
                              description: String, measureId: Long, currentAmount: Int, stockLimit: Int, category: String)

/** class for update form */
case class UpdateProductForm(
                              id: Long, name: String, cost: Double,
                              percent: Double, price: Double, description: String,
                              measureId: Long, currentAmount: Int, stockLimit: Int, category: String)

/** class for product vendor relation form */
case class UpdateProductVendorForm(
                                    id: Long, productId: Long, vendorId: Long, cost: Double)
