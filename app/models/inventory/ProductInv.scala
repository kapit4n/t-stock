package models.inventory

import play.api.libs.json._

case class ProductInv(id: Long, productId: Long, vendorId: Long, measureId: Long, amount: Int, amountLeft: Int)

object ProductInv {
  implicit val productInvFormat = Json.format[ProductInv]
}