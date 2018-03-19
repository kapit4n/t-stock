package models

import play.api.libs.json._

case class Category(name: String, description: String)

object Category {
  implicit val categoryFormat = Json.format[Category]
}