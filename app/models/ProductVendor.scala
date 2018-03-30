package models

import play.api.libs.json._

case class ProductVendor(id: Long, productId: Long, vendorId: Long, cost: Double)

object ProductVendor {
  implicit val ProductVendorFormat = Json.format[ProductVendor]
}
