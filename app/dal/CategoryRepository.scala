package dal

import scala.concurrent.duration._
import javax.inject.{Inject, Singleton}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import models.Category

import scala.concurrent.{Future, ExecutionContext, Await}

/**
  * A repository for categories.
  *
  * @param dbConfigProvider The Play db config provider. Play will inject this for you.
  */
@Singleton
class CategoryRepository @Inject()(dbConfigProvider: DatabaseConfigProvider)(implicit ec: ExecutionContext) {
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  private val tableQ = TableQuery[CategoriesTable]

  private class CategoriesTable(tag: Tag) extends Table[Category](tag, "category") {
    def name = column[String]("name")

    def description = column[String]("description")

    def * = (name, description) <> ((Category.apply _).tupled, Category.unapply)
  }

  def list(): Future[Seq[Category]] = db.run {
    tableQ.result
  }

  def getByName(name: String): Future[Seq[Category]] = db.run {
    tableQ.filter(_.name === name).result
  }

}
