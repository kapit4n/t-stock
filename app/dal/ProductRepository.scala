package dal

import scala.concurrent.duration._
import javax.inject.{Inject, Singleton}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import models.Product
import models.Measure

import scala.concurrent.{Future, ExecutionContext, Await}

/**
  * A repository for Product.
  *
  * @param dbConfigProvider The Play db config provider. Play will inject this for you.
  */
@Singleton
class ProductRepository @Inject()(dbConfigProvider: DatabaseConfigProvider,
                                  repoLog: LogEntryRepository)(implicit ec: ExecutionContext) {
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._


  // Measure table
  private class MeasuresTable(tag: Tag) extends Table[Measure](tag, "measure") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

    def name = column[String]("name")

    def quantity = column[Double]("quantity")

    def description = column[String]("description")

    def measureId = column[Long]("measureId")

    def measureName = column[String]("measureName")

    def * = (id, name, quantity, description, measureId, measureName) <> ((Measure.apply _).tupled, Measure.unapply)
  }

  private val measuresTable = TableQuery[MeasuresTable]

  // Product Table
  private class ProductsTable(tag: Tag) extends Table[Product](tag, "product") {

    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

    def name = column[String]("name")

    def cost = column[Double]("cost")

    def percent = column[Double]("percent")

    def price = column[Double]("price")

    def description = column[String]("description")

    def measureId = column[Long]("measureId")

    def measure = foreignKey("SUP_FK", measureId, measuresTable)(_.id)

    def measureName = column[String]("measureName")

    def currentAmount = column[Int]("currentAmount")

    def stockLimit = column[Int]("stockLimit")

    def category = column[String]("category")

    def * = (id, name, cost, percent, price, description, measureId, measureName, currentAmount, stockLimit, category) <> ((Product.apply _).tupled, Product.unapply)
  }

  private val productsTable = TableQuery[ProductsTable]

  /**
    * Saves a new product on the database
    *
    * @param name
    * @param cost
    * @param percent
    * @param price
    * @param description
    * @param measureId
    * @param measureName
    * @param currentAmount
    * @param stockLimit
    * @param category
    * @param userId
    * @param userName
    * @return
    */
  def create(
              name: String, cost: Double, percent: Double, price: Double,
              description: String, measureId: Long, measureName: String,
              currentAmount: Int, stockLimit: Int, category: String, userId: Long, userName: String): Future[Product] = db.run {
    repoLog.createLogEntry(repoLog.CREATE, repoLog.PRODUCT, userId, userName, name);
    (productsTable.map(
      p => (
        p.name, p.cost, p.percent, p.price, p.description,
        p.measureId, p.measureName, p.currentAmount, p.stockLimit, p.category)) returning productsTable.map(_.id) into (
      (nameAge, id) => Product(
        id, nameAge._1, nameAge._2, nameAge._3,
        nameAge._4, nameAge._5, nameAge._6,
        nameAge._7, nameAge._8, nameAge._9, nameAge._10))) += (name, cost, percent, cost + cost * percent, description, measureId, measureName, currentAmount, stockLimit, category)
  }

  /**
    * Return a list of products
    *
    * @return Future[Seq[Product]]
    **/
  def list(): Future[Seq[Product]] = db.run {
    productsTable.result
  }

  /**
    * Example of join of two tables
    *
    * @return
    */
  def joinExample() = {
    val implicitCrossJoin = for {
      p <- productsTable
      m <- measuresTable  if p.measureId === m.id
    } yield (p, m)

    db.run(implicitCrossJoin.result).map(data => println(data(0)))
  }

  /**
    * Get list of products that are passed the limit of request products
    *
    * @return
    */
  def reorder_list(): Future[Seq[Product]] = db.run {
    productsTable.filter(x => x.stockLimit > x.currentAmount).result
  }

  /**
    * Return a list of products by category
    *
    * @param category
    * @return
    */
  def listByCategory(category: String): Future[Seq[Product]] = db.run {
    productsTable.filter(x => x.category === category).result
  }

  /**
    * Gets the products name and id list
    *
    * @return
    */
  def getListNames(): Future[Seq[(Long, String)]] = db.run {
    productsTable.take(300).map(s => (s.id, s.name)).result
  }

  /**
    * Gets products name, and ids by Id
    *
    * @param id
    * @return
    */
  def getListNamesById(id: Long): Future[Seq[(Long, String)]] = db.run {
    productsTable.filter(_.id === id).map(s => (s.id, s.name)).result
  }

  /**
    * Gets a product by Id
    *
    * @param id
    * @return
    */
  def getById(id: Long): Future[Seq[Product]] = db.run {
    productsTable.filter(_.id === id).result
  }

  /**
    * Updates the product information and logs the operation
    *
    * @param id
    * @param name
    * @param cost
    * @param percent
    * @param price
    * @param description
    * @param measureId
    * @param measureName
    * @param currentAmount
    * @param stockLimit
    * @param category
    * @param userId
    * @param userName
    * @return
    */
  def update(id: Long, name: String, cost: Double, percent: Double, price: Double,
             description: String, measureId: Long, measureName: String,
             currentAmount: Int, stockLimit: Int, category: String, userId: Long, userName: String): Future[Seq[Product]] = db.run {
    repoLog.createLogEntry(repoLog.UPDATE, repoLog.PRODUCT, userId, userName, name)

    val q = for {c <- productsTable if c.id === id} yield c.name
    db.run(q.update(name))
    val q2 = for {c <- productsTable if c.id === id} yield c.percent
    db.run(q2.update(percent))
    val q3 = for {c <- productsTable if c.id === id} yield c.cost
    db.run(q3.update(cost))
    val q31 = for {c <- productsTable if c.id === id} yield c.price
    db.run(q31.update(cost + cost * percent))
    val q4 = for {c <- productsTable if c.id === id} yield c.description
    db.run(q4.update(description))
    val q5 = for {c <- productsTable if c.id === id} yield c.measureId
    db.run(q5.update(measureId))
    val q51 = for {c <- productsTable if c.id === id} yield c.measureName
    db.run(q51.update(measureName))
    val q6 = for {c <- productsTable if c.id === id} yield c.currentAmount
    db.run(q6.update(currentAmount))
    val q7 = for {c <- productsTable if c.id === id} yield c.stockLimit
    db.run(q7.update(stockLimit))
    val q8 = for {c <- productsTable if c.id === id} yield c.category
    db.run(q8.update(category))
    productsTable.filter(_.id === id).result
  }

  /**
    * Delete a product by Id
    *
    * @param id
    * @return
    */
  def delete(id: Long): Future[Seq[Product]] = db.run {
    val q = productsTable.filter(_.id === id)
    val action = q.delete
    val affectedRowsCount: Future[Int] = db.run(action)
    productsTable.result
  }

  /**
    * Updates the amount of a product by Id
    *
    * @param insumoId
    * @param amount
    * @return
    */
  def updateAmount(insumoId: Long, amount: Int) = {
    val q = for {c <- productsTable if c.id === insumoId} yield c.currentAmount
    db.run(productsTable.filter(_.id === insumoId).result).map(s => s.map(insumoObj =>
      db.run(q.update(amount + insumoObj.currentAmount))))
  }

  /**
    * Updates the inventory of the product
    *
    * @param insumoId
    * @param amount
    * @return
    */
  def updateInventary(insumoId: Long, amount: Int) = {
    val q = for {c <- productsTable if c.id === insumoId} yield c.currentAmount
    db.run(productsTable.filter(_.id === insumoId).result).map(s => s.map(insumoObj =>
      db.run(q.update(amount + insumoObj.currentAmount))))
  }

  /**
    * Verifies if the product can be delivered
    *
    * @param productId
    * @param amount
    * @return
    */
  def canDeliverAux(productId: Long, amount: Int): Future[Boolean] = {
    db.run(productsTable.filter(s => s.id === productId && s.currentAmount > amount).result).map(d => (d.length > 0))
  }

  /**
    * Verifies if the product can be delivered
    *
    * @param productId
    * @param amount
    * @return
    */
  def canDeliver(productId: Long, amount: Int): Boolean = {
    Await.result(canDeliverAux(productId, amount).map { result =>
      result
    }, 100.millis)
  }

  /**
    * Gets the total of products
    *
    * @return
    */
  def getTotal(): Future[Int] = db.run {
    productsTable.length.result
  }

  /**
    * Searches products by param
    *
    * @param searchCriteria
    * @return Future[Seq[Product]], returns the list of products that match the criteria
    **/
  def searchProduct(searchCriteria: String): Future[Seq[Product]] = db.run {
    if (!searchCriteria.isEmpty) {
      productsTable.filter(p => (p.name like "%" + searchCriteria + "%")).drop(0).take(100).result
    } else {
      productsTable.drop(0).take(100).result
    }
  }
}
