const bootstrap = window.bootstrap
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        console.log("🟢 toast controller connected", this.element)

        const toastElList = this.element.querySelectorAll(".toast")
        toastElList.forEach((toastEl) => {
            console.log("👀 initializing toast for:", toastEl)
            const toast = new bootstrap.Toast(toastEl)
            toast.show()
        })
    }
}
