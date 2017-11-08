package models

import play.api.libs.json._

case class ProductTransform(id: Long, productId: Long, productName: String, vendorId: Long,
	vendorName: String, measureId: Long, measureName: String, amount: Int, amountLeft: Int)

object ProductTransform {
  implicit val productTransformFormat = Json.format[ProductTransform]
}