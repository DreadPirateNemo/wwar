import { application } from "controllers/application"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

import ModalController from "./modal_controller"
import YoutubeController from "./youtube_controller"
import ToastController from "./toast_controller"

eagerLoadControllersFrom("controllers", application)

application.register("modal", ModalController)
application.register("youtube", YoutubeController)
application.register("toast", ToastController)
