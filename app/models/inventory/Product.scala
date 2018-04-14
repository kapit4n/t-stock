package models.inventory

import play.api.libs.json._

case class Product(
                    id: Long, cost: Double,
                    price: Double)

object Product {
  implicit val productFormat = Json.format[Product]
}