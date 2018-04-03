package dal

import scala.concurrent.duration._
import javax.inject.{Inject, Singleton}
import play.api.db.slick.DatabaseConfigProvider
import slick.driver.JdbcProfile

import models.Category

import scala.concurrent.{Future, ExecutionContext, Await}

/**
  * Category repository
  *
  * @param dbConfigProvider
  * @param repoLog
  * @param ec
  */
@Singleton
class CategoryRepository @Inject()(dbConfigProvider: DatabaseConfigProvider, repoLog: LogEntryRepository)(implicit ec: ExecutionContext) {
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  import dbConfig._
  import driver.api._

  private val tableCat = TableQuery[CategoriesTable]

  private class CategoriesTable(tag: Tag) extends Table[Category](tag, "category") {
    def name = column[String]("name")

    def description = column[String]("description")

    def * = (name, description) <> ((Category.apply _).tupled, Category.unapply)
  }

  /**
    * Creates a new category
    * @param name
    * @param description
    * @param userId
    * @param userName
    * @return
    */
  def create(
              name: String, description: String,
              userId: Long, userName: String): Future[Category] = db.run {
    repoLog.createLogEntry(repoLog.CREATE, repoLog.VENDOR_CONTRACT, userId, userName, name);
    (tableCat.map(p => (p.name, p.description))
      returning tableCat.map(_.name)
      into ((nameAge, name) => Category(name, nameAge._1))) += (name, description)
  }

  /**
    * Updates a category
    * @param name
    * @param description
    * @param userId
    * @param userName
    * @return
    */
  def update(name: String, description: String,
             userId: Long, userName: String): Future[Seq[Category]] = db.run {
    repoLog.createLogEntry(repoLog.UPDATE, repoLog.VENDOR_CONTRACT, userId, userName, name);
    val q2 = for {c <- tableCat if c.name === name} yield c.description
    db.run(q2.update(description))
    tableCat.filter(_.name === name).result
  }

  /**
    * Returns a list of categories
    * @return
    */
  def list(): Future[Seq[Category]] = db.run {
    tableCat.result
  }

  /**
    * Returns a category by name
    * @param name
    * @return
    */
  def getByName(name: String): Future[Seq[Category]] = db.run {
    tableCat.filter(_.name === name).result
  }

  /**
    * Deletes a category by name
    * @param name
    * @return
    */
  def delete(name: String): Future[Seq[Category]] = db.run {
    val q = tableCat.filter(_.name === name)
    val action = q.delete
    val affectedRowsCount: Future[Int] = db.run(action)

    tableCat.result
  }

}
