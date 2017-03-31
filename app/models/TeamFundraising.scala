package models

import play.api.db._
import play.api.Play.current
import scala.slick.driver.MySQLDriver.simple._
import scala.slick.lifted.{ProvenShape, ForeignKeyQuery}

class TeamFundraising(tag: Tag) extends Table[(Int, Int, Double, Double)](tag, "team_fundraising") {
  def year = column[Int]("year", O.NotNull)
  def event_id = column[Int]("event_id", O.NotNull)
  def goal = column[Double]("goal", O.NotNull)
  def raised = column[Double]("raised", O.NotNull)

  def * : ProvenShape[(Int, Int, Double, Double)] = 
    (year, event_id, goal, raised)
}

object TeamFundraising {
  val teamFundraising = TableQuery[TeamFundraising]

  def findByYearAndEvent(year: Int, event_id: Int)(implicit s: Session) =
    teamFundraising.filter(x => (x.year === year && x.event_id === event_id)).list.headOption

  def update(year: Int, event_id: Int, goal: Double, raised: Double)(implicit s: Session) =
    teamFundraising.filter( x => (x.year === year && x.event_id === event_id)).update((year, event_id, goal, raised))
}