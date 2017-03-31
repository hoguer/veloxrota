package models

import play.api.db._
import play.api.Play.current
import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.{ProvenShape, ForeignKeyQuery}

class TeamMembers(tag: Tag) 
  extends Table[(Int, Int, String, String, String, Double, Int)](tag, "team_member") 
{
  def id = column[Int]("id", O PrimaryKey, O AutoInc)
  def year = column[Int]("year", O NotNull)
  def name = column[String]("name", O NotNull)
  def role = column[String]("role", O NotNull)
  def link = column[String]("link", O NotNull)
  def amountRaised = column[Double]("amount_raised")
  def pos = column[Int]("pos")
  def * = (id, year, name, role, link, amountRaised, pos)
}

object TeamMembers {
  val table = TableQuery[TeamMembers]

  def findAllForYear(year: Int)(implicit s: Session) =
    table.filter(_.year === year).sortBy(_.pos).list

  def findAllForYearAndEventId(year: Int, event_id: Int)(implicit s: Session) =
    table.filter(_.year === year).sortBy(_.pos).list

  def findLinkByName(name: String, year: Int)(implicit s: Session) =
    table.filter(_.year === year).filter(_.name like name).map(_.link).firstOption

  def findIdByYearAndLink(year: Int, link: String)(implicit s: Session) =
    table.filter(_.year === year).filter(_.link === link).map(_.id).firstOption

  def add(year: Int, name: String, role: String, link: String, amountRaised: Double, pos: Int)(implicit s: Session) =
    table.insert((0, year, name, role, link, amountRaised, pos))

  def update(id: Int, pos: Int, amountRaised: Double)(implicit s: Session) =
    table.filter(_.id === id).map(t => (t.pos, t.amountRaised)).update((pos, amountRaised))

  def deleteById(id: Int)(implicit s: Session) =
    table.filter(_.id === id).delete
}

case class TeamMember(id: Long, name: String, role: String, link: String, image: String, raised: String)
