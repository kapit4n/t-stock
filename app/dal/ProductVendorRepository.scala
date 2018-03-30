package dal

import scala.concurrent.duration._
import javax.inject.{Inject, Singleton}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import models.ProductVendor
import models.Roles

import scala.concurrent.{Future, ExecutionContext, Await}

/**
  * A repository for people.
  *
  * @param dbConfigProvider The Play db config provider. Play will inject this for you.
  */
@Singleton
class ProductVendorRepository @Inject()(dbConfigProvider: DatabaseConfigProvider,
                                        repoLog: LogEntryRepository)(implicit ec: ExecutionContext) {
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  private class ProductVendorsTable(tag: Tag) extends Table[ProductVendor](tag, "productVendor") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

    def productId = column[Long]("productId")

    def vendorId = column[Long]("vendorId")

    def cost = column[Double]("cost")

    def * = (id, productId, vendorId, cost) <> ((ProductVendor.apply _).tupled, ProductVendor.unapply)
  }

  private val tableProductVendor = TableQuery[ProductVendorsTable]

  def createProductVendor(productId: Long, vendorId: Long): Future[ProductVendor] = db.run {
    (tableProductVendor.map(p => (p.productId, p.vendorId, p.cost))
      returning tableProductVendor.map(_.id)
      into ((nameAge, id) => ProductVendor(id, nameAge._1, nameAge._2, nameAge._3))) += (productId, vendorId, 0)
  }

  def getVendorsIds(id: Long): Seq[Long] = {
    Await.result(listVendorsIdsByProductId(id).map { res =>
      res
    }, 3000.millis)
  }

  def listVendorsIdsByProductId(productId: Long): Future[Seq[Long]] = db.run {
    tableProductVendor.filter(_.productId === productId).map(s => s.vendorId).result
  }

  def listVendorsByProductId(productId: Long): Future[Seq[ProductVendor]] = db.run {
    tableProductVendor.filter(_.productId === productId).result
  }

  // to cpy
  def getProductVendorById(productId: Long, vendorId: Long): Future[Seq[ProductVendor]] = db.run {
    tableProductVendor.filter(p => p.productId === productId && p.vendorId === vendorId).result
  }

  // delete required
  def deleteProductVendor(productId: Long, vendorId: Long): Future[Seq[ProductVendor]] = db.run {
    val q = tableProductVendor.filter(p => p.productId === productId && p.vendorId === vendorId)
    val action = q.delete
    val affectedRowsCount: Future[Int] = db.run(action)

    tableProductVendor.result
  }

  def update(id: Long, cost: Double, userId: Long, userName: String): Future[Seq[ProductVendor]] = db.run {
    repoLog.createLogEntry(repoLog.UPDATE, repoLog.PRODUCT_VENDOR, userId, userName, cost.toString())

    val q = for {c <- tableProductVendor if c.id === id} yield c.cost
    db.run(q.update(cost))
    tableProductVendor.filter(_.id === id).result
  }

}
