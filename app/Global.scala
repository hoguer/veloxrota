import play.api._
import java.util.{Timer, TimerTask}

object Global extends GlobalSettings {
  val timer = new Timer(true)
  val fetchTask = new TimerTask() {
  	def run() = FetchData.run()
  }

  override def onStart(app: Application) {
    Logger.info("Application has started")
    timer.schedule(fetchTask, 3000, 60 * 60000)
  }

  override def onStop(app: Application) {
    Logger.info("Application shutdown...")
    fetchTask.cancel()
  }
}
