package dal
import javax.inject.{Inject, Singleton}

import models.inventory.ProductInv
import models.inventory.Product
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import scala.concurrent.ExecutionContext

@Singleton
class FIFOInventoryUpdate @Inject()(dbConfigProvider: DatabaseConfigProvider,
  repoLog: LogEntryRepository)(implicit ec: ExecutionContext) extends InventoryUpdateStrategy {

  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  private class ProductsTable(tag: Tag) extends Table[Product](tag, "product") {
    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

    def cost = column[Double]("cost")

    def price = column[Double]("price")

    def * = (id, cost, price) <> ((Product.apply _).tupled, Product.unapply)
  }

  private val productsTable = TableQuery[ProductsTable]

  private class ProductInvsTable(tag: Tag) extends Table[ProductInv](tag, "productInv") {

    def id = column[Long]("id", O.PrimaryKey, O.AutoInc)

    def productId = column[Long]("productId")

    def vendorId = column[Long]("vendorId")

    def measureId = column[Long]("measureId")

    def amount = column[Int]("amount")

    def amountLeft = column[Int]("amountLeft")

    def * = (id, productId, vendorId, measureId, amount, amountLeft) <> ((ProductInv.apply _).tupled, ProductInv.unapply)
  }

  private val productInvsTable = TableQuery[ProductInvsTable]

  override def updateInventory(productId: Long, quantity: Int): Unit = {
    "Inventory Updated"
  }
}
