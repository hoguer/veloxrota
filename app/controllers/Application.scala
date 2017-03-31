package controllers

import java.text.DecimalFormat
import play.api._
import play.api.db.slick._
import play.api.mvc._
import play.api.Play.current
import models._
import scala.slick.driver.MySQLDriver.simple._
import play.api.libs.mailer._
import play.api.data._
import play.api.data.Forms._

object Application extends Controller {
  val year = 2016
  val defaultMugShotPath = "images/team/nophoto.png"
  private val currencyFormatter = new DecimalFormat("$#,##0")

  val sponsorForm = Form(
      mapping(
        "Sponsor Contact" -> text,
    	"Company Name" -> text,
	"Street Address" -> text,
	"Street Address 2" -> text,
	"City" -> text,
	"State" -> text,
	"Zip" -> text,
	"Phone Number" -> text,
	"Email Address" -> text,
	"Sponsorship Level" -> text
      )(SponsorData.apply)(SponsorData.unapply)
  )

  private def formatDollars(amt: Double) =
    currencyFormatter.synchronized {
      currencyFormatter.format(amt)
    }

  def index = DBAction { implicit rs =>
    val (_, goal, raised) = TeamFundraising.findByYear(year).getOrElse((0, 0.0, 0.0))
    val percent = 100d.min(raised * 100 / goal).round
    val goalStr = formatDollars(goal)
    val raisedStr = formatDollars(raised)
    Ok(views.html.index(raisedStr, goalStr, percent.toString))
  }

  def teamMain = DBAction { implicit rs =>
    val rows = TeamMembers.findAllForYear(year)
    val members = rows.map {
      case (id, year, name, role, link, raised, pos) =>
        val m = TeamMember(id, name, role, link, defaultMugShotPath, formatDollars(raised))
        val imgPath = "images/team/" + m.name.toLowerCase.replace(' ', '_').replace(".", "") + ".jpg"
        val url = current.resource("public/" + imgPath)
        val imgSrc = url.map(_ => imgPath).getOrElse(defaultMugShotPath)
        m.copy(
          link = "/team/" + m.name.replace(" ", "-").replace(".", ""),
          image = imgSrc)
    }
    Ok(views.html.team.teamMain(members))
  }

  def teamMember(name: String) = DBAction { implicit rs =>
    val namePattern = name.replaceAll("[_-]", "%") + "%"
    TeamMembers.findLinkByName(namePattern, year) match {
      case Some(link) =>
        Redirect(link)
      case None =>
        NotFound
    }
  }

  def training = Action { implicit request =>
    Ok(views.html.training())
  }

  def resources = Action { implicit request =>
    Ok(views.html.resources())
  }

  def sponsors = sponsors2017

  def sponsors2017 = Action { implicit request =>
      Ok(views.html.sponsors.y2017())
  }

  def sponsors2016 = Action { implicit request =>
    Ok(views.html.sponsors.y2016())
  }  

  def sponsors2005 = Action { implicit request =>
  	Ok(views.html.sponsors.y2005())
  }

  def become_a_sponsor = Action { implicit request =>
  	Ok(views.html.sponsors.become_a_sponsor(sponsorForm, false))
  }

  def team = board

  def board = Action { implicit request =>
  	Ok(views.html.team.board())
  }

  def champions = Action { implicit request =>
  	Ok(views.html.team.champions())
  }

  def event_teams = Action { implicit request =>
  	Ok(views.html.team.event_teams())
  }

  def why_i_ride = Action { implicit request =>
  	Ok(views.html.team.why_i_ride())
  }

  def bikems = Action { implicit request =>
    Ok(views.html.bikems())
  }

  def endurance_events = Action { implicit request =>
    Ok(views.html.endurance_events())
  }

  def fundraisers = Action { implicit request =>
    Ok(views.html.fundraisers())
  }

  private  def sendEmail(sponsorData: SponsorData) {
    val bodyTextStr = Some("Sponsor Contact:\t" + sponsorData.sponsorContact + "\n" +
    		           "Company Name:\t" + sponsorData.companyName + "\n" +
    		           "Street Address:\t" + sponsorData.streetAddress + "\n" +
    		           "Street Address 2:\t" + sponsorData.streetAddress2 + "\n" +
    		           "City:\t" + sponsorData.city + "\n" +
    		           "State:\t" + sponsorData.state + "\n" +
    		           "Zip:\t" + sponsorData.zip + "\n" +
    		           "Phone Number:\t" + sponsorData.phoneNumber + "\n" +
    		           "Email Address:\t" + sponsorData.emailAddress + "\n" +
    		           "Sponsorship Level:\t" + sponsorData.sponsorshipLevel
			  )
    val bodyHtmlStr = Some("<html><body><p>" +
			   "Sponsor Contact: " + sponsorData.sponsorContact + "<br>" +
    		           "Company Name: " + sponsorData.companyName + "<br>" +
			   "Street Address: " + sponsorData.streetAddress + "<br>" +
			   "Street Address 2: " + sponsorData.streetAddress2 + "<br>" +
			   "City: " + sponsorData.city + "<br>" +
			   "State: " + sponsorData.state + "<br>" +
			   "Zip: " + sponsorData.zip + "<br>" +
			   "Phone Number: " + sponsorData.phoneNumber + "<br>" +
			   "Email Address: " + sponsorData.emailAddress + "<br>" +
			   "Sponsorship Level: " + sponsorData.sponsorshipLevel + "<br>" +
			   "</p></body></html>"
			  )
    val email = Email(
    	"Sponsor Information",
    	"Sponsor Website Page <sponsorpage@veloxrota.org>",
    	Seq("Rachael Bubbs <rhbubbs@gmail.com>"),
    	bodyText = bodyTextStr,
    	bodyHtml = bodyHtmlStr
    )
    MailerPlugin.send(email)
  }

  def submit_sponsor_form = Action { implicit request =>
      val sponsorData = sponsorForm.bindFromRequest.get
      sendEmail(sponsorData)
      Ok(views.html.sponsors.become_a_sponsor(sponsorForm, true))
  }

  def active_wear = Action { implicit request =>
    Ok(views.html.team_gear.active_wear())
  }

  def kit = Action { implicit request =>
    Ok(views.html.team_gear.kit())
  }

}

case class SponsorData(sponsorContact: String, companyName: String, streetAddress: String, streetAddress2: String, city: String, state: String, zip: String, phoneNumber: String, emailAddress: String, sponsorshipLevel: String)