import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    open(event) {
        event.preventDefault()
        const videoId = event.currentTarget.dataset.youtubeVideoId

        const modalContent = `
      <div class="modal fade show d-block" tabindex="-1" style="background: rgba(0,0,0,0.5);" data-controller="modal">
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="ratio ratio-16x9">
              <iframe
                src="https://www.youtube.com/embed/${videoId}"
                frameborder="0"
                allowfullscreen
              ></iframe>
            </div>
            <button type="button" class="btn-close position-absolute top-0 end-0 m-3" data-action="click->modal#close"></button>
          </div>
        </div>
      </div>
    `

        document.getElementById("modal").innerHTML = modalContent
    }
}
