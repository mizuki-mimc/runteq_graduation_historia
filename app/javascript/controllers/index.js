import { application } from "./application"

// このディレクトリにある "なんとか_controller.js" という名前のファイルを全て探し出して読み込みます
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)
