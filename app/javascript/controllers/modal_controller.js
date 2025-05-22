import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["background"]

    connect() {
        this.focusFirstInput()
        window.addEventListener("keydown", this.handleKeydown)
    }

    disconnect() {
        window.removeEventListener("keydown", this.handleKeydown)
    }

    close(event) {
        if (event.target === this.backgroundTarget || event.target.closest(".btn-close")) {
            this.element.remove()
        }
    }

    handleKeydown = (event) => {
        if (event.key === "Escape") {
            this.element.remove()
        }
    }

    focusFirstInput() {
        const input = this.element.querySelector("input, textarea, select")
        if (input) input.focus()
    }
}
