package models

import play.api.db._
import play.api.Play.current
import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.{ProvenShape, ForeignKeyQuery}

class Events(tag: Tag) 
  extends Table[(Int, String, String, String, String, String, Int)](tag, "events") 
{
  def id = column[Int]("id", O PrimaryKey, O AutoInc)
  def name = column[String]("name", O NotNull)
  def location = column[String]("location", O NotNull)
  def date = column[String]("date", O NotNull)
  def link = column[String]("link", O NotNull)
  def description = column[String]("description", O NotNull)
  def type_id = column[Int]("type_id")
  def * = (id, name, location, date, link, description, type_id)
}

object Events {
  val table = TableQuery[Events]

  def findAllForType(type_id: Int)(implicit s: Session) =
    table.filter(_.type_id === type_id).list
}

case class Event(id: Int, name: String, location: String, date: String, link: String, description: String, type_id: Int)