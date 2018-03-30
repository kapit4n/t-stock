package dal

import scala.concurrent.duration._
import javax.inject.{ Inject, Singleton }
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import models.Product
import models.Measure

import scala.concurrent.{ Future, ExecutionContext, Await }

/**
 * A repository for people.
 *
 * @param dbConfigProvider The Play db config provider. Play will inject this for you.
 */
@Singleton
class ProductRepository @Inject() (dbConfigProvider: DatabaseConfigProvider,
  repoLog: LogEntryRepository)(implicit ec: ExecutionContext) {
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._


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

  def list(): Future[Seq[Product]] = db.run {
    productsTable.result
  }

  def joinExample() =  {
    val implicitCrossJoin = for {
      p <- productsTable
      m <- measuresTable
    } yield (p, m)

    db.run(implicitCrossJoin.result).map(data => println(data(0)))
  }

  /*def list1(): Seq[(Product, Measure)] =  db.run {
    val products = for {
      (user, measure) <- productsTable.join(measuresTable).on(_.id === _.measureId)
    } yield(user, measure)
  }*/



  def reorder_list(): Future[Seq[Product]] = db.run {
    productsTable.filter(x => x.stockLimit > x.currentAmount).result
  }

  def listByCategory(category: String): Future[Seq[Product]] = db.run {
    productsTable.filter(x => x.category === category).result
  }

  def getListNames(): Future[Seq[(Long, String)]] = db.run {
    productsTable.take(300).map(s => (s.id, s.name)).result
  }

  def getListNamesById(id: Long): Future[Seq[(Long, String)]] = db.run {
    productsTable.filter(_.id === id).map(s => (s.id, s.name)).result
  }

  // to cpy
  def getById(id: Long): Future[Seq[Product]] = db.run {
    productsTable.filter(_.id === id).result
  }

  // update required to copy
  def update(id: Long, name: String, cost: Double, percent: Double, price: Double,
    description: String, measureId: Long, measureName: String,
    currentAmount: Int, stockLimit: Int, category: String, userId: Long, userName: String): Future[Seq[Product]] = db.run {
    repoLog.createLogEntry(repoLog.UPDATE, repoLog.PRODUCT, userId, userName, name)

    val q = for { c <- productsTable if c.id === id } yield c.name
    db.run(q.update(name))
    val q2 = for { c <- productsTable if c.id === id } yield c.percent
    db.run(q2.update(percent))
    val q3 = for { c <- productsTable if c.id === id } yield c.cost
    db.run(q3.update(cost))
    val q31 = for { c <- productsTable if c.id === id } yield c.price
    db.run(q31.update(cost + cost * percent))
    val q4 = for { c <- productsTable if c.id === id } yield c.description
    db.run(q4.update(description))
    val q5 = for { c <- productsTable if c.id === id } yield c.measureId
    db.run(q5.update(measureId))
    val q51 = for { c <- productsTable if c.id === id } yield c.measureName
    db.run(q51.update(measureName))
    val q6 = for { c <- productsTable if c.id === id } yield c.currentAmount
    db.run(q6.update(currentAmount))
    val q7 = for { c <- productsTable if c.id === id } yield c.stockLimit
    db.run(q7.update(stockLimit))
    val q8 = for { c <- productsTable if c.id === id } yield c.category
    db.run(q8.update(category))
    productsTable.filter(_.id === id).result
  }

  // delete required
  def delete(id: Long): Future[Seq[Product]] = db.run {
    val q = productsTable.filter(_.id === id)
    val action = q.delete
    val affectedRowsCount: Future[Int] = db.run(action)
    productsTable.result
  }

  def updateAmount(insumoId: Long, amount: Int) = {
    val q = for { c <- productsTable if c.id === insumoId } yield c.currentAmount
    db.run(productsTable.filter(_.id === insumoId).result).map(s => s.map(insumoObj =>
      db.run(q.update(amount + insumoObj.currentAmount))))
  }

  def updateInventary(insumoId: Long, amount: Int) = {
    val q = for { c <- productsTable if c.id === insumoId } yield c.currentAmount
    db.run(productsTable.filter(_.id === insumoId).result).map(s => s.map(insumoObj =>
    db.run(q.update(amount + insumoObj.currentAmount))))
  }

  def canDeliverAux(productId: Long, amount: Int): Future[Boolean] = {
    db.run(productsTable.filter(s => s.id === productId && s.currentAmount > amount).result).map( d => (d.length > 0))
  }

  def canDeliver(productId: Long, amount: Int): Boolean = {
    Await.result(canDeliverAux(productId, amount).map { result =>
          result
        }, 100.millis)
  }

  def getTotal(): Future[Int] = db.run {
    productsTable.length.result
  }

  def searchProduct(search: String): Future[Seq[Product]] = db.run {
    if (!search.isEmpty) {
      productsTable.filter(p => (p.name like "%" + search + "%")).drop(0).take(100).result
    } else {
      productsTable.drop(0).take(100).result
    }
  }
}
