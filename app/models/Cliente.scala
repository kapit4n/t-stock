package models

import play.api.libs.json._

/* Deprecated */
case class Cliente(id: Long, name: String, carnet: Int, id_company: Int)

object Cliente {
  implicit val clienteFormat = Json.format[Cliente]
}