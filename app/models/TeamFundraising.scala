package models

import play.api.db._
import play.api.Play.current
import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.{ProvenShape, ForeignKeyQuery}

class TeamFundraising(tag: Tag) extends Table[(Int, Double, Double)](tag, "team_fundraising") {
  def id = column[Int]("id", O.PrimaryKey, O.AutoInc)
  def goal = column[Double]("goal", O.NotNull)
  def raised = column[Double]("raised", O.NotNull)

  def * : ProvenShape[(Int, Double, Double)] = 
    (id, goal, raised)
}

object TeamFundraising {
  val teamFundraising = TableQuery[TeamFundraising]

  def findByYear(year: Int)(implicit s: Session) =
    teamFundraising.filter(_.id === year).list.headOption

  def update(year: Int, goal: Double, raised: Double)(implicit s: Session) =
    teamFundraising.filter(_.id === year).update((year, goal, raised))
}