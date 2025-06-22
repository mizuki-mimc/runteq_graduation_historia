import "@hotwired/turbo-rails"

import { Application } from "@hotwired/stimulus"
const application = Application.start()

application.debug = false
window.Stimulus = application

import BeforeHomeAccordionController from "before_home_accordion_controller"
application.register("before-home-accordion", BeforeHomeAccordionController)

export { application }
