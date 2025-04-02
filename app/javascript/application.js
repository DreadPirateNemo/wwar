// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
// import "/controllers/phone_input_formatter"
document.addEventListener("turbo:frame-render", (event) => {
    const toastContainer = event.target.querySelector(".toast-container")
    if (!toastContainer) return

    const toastEls = toastContainer.querySelectorAll(".toast")
    toastEls.forEach((el) => {
        const toast = new bootstrap.Toast(el)
        toast.show()
    })
})
