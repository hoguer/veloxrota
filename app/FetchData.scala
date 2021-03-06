import scala.io.Source
import scala.collection.mutable.HashSet
import java.net.URL
import models._
import play.{Logger => log}
import play.api.db.slick._
import play.api.Play.current

object FetchData {
  import controllers.Application.year

  val url = new URL("http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents?team_id=533570&pg=team&fr_id=29299")
  val memberRegex = """<a href=\"(http://main.nationalmssociety.org/site/TR/Bike/MAMBikeEvents\?px=[^\"]*)\">([\w\s\'\-]+)</a>\s*</div>\s*<div class="team-roster-participant-raised">\$([\d\,\.]+)""".r
  val goalRegex = """Goal\s+\$([\d\,\.]+)""".r
  val achievedRegex = """Achieved\s+\$([\d\,\.]+)""".r

  def run() {
    DB.withSession { implicit s =>
      log.info("fetching data from " + url)
      val in = Source.fromInputStream(url.openStream, "ISO-8859-1")
      var memberCount = 0
      var goal = 0f
      var raised = 0f
      val memberLinks = new HashSet[String]
      val text = in.getLines().mkString("\n")

      for (memberRegex(url, name, amt) <- memberRegex findAllIn text) {
        val amount = amt.replace(",", "").toFloat
        addOrUpdateMember(url, name, amount, memberCount)
        memberCount += 1
        memberLinks += url
      }

      goalRegex.findFirstMatchIn(text).foreach { md =>
        goal = md.group(1).replace(",", "").toFloat
      }

      achievedRegex.findFirstMatchIn(text).foreach { md =>
        raised = md.group(1).replace(",", "").toFloat
      }

      TeamFundraising.update(year, 1, goal, raised)
      log.info("goal=" + goal + ", raised=" + raised)

      if (!memberLinks.isEmpty) {
        removeDroppedMembers(memberLinks)
      }
    }
  }

  def addOrUpdateMember(link: String, name: String, amountRaised: Float, pos: Int)(implicit s: Session) {
    TeamMembers.findIdByYearAndLink(year, link) match {
      case Some(id) =>
        TeamMembers.update(id, pos, amountRaised)
        log.info("updated #" + id + ": " + name + ", $" + amountRaised)

      case None =>
        TeamMembers.add(
          year = year,
          name = name,
          role = "Rider",
          link = link,
          amountRaised = amountRaised,
          pos = pos)
        log.info("inserted " + name + ", $" + amountRaised)
    }
  }

  def removeDroppedMembers(links: HashSet[String])(implicit s: Session) {
    TeamMembers.findAllForYear(year) foreach {
      case (id, _, name, _, link, _, _) =>
        if (!links.contains(link)) {
          log.info("dropping " + name)
          TeamMembers.deleteById(id)
        }
    }
  }
}
