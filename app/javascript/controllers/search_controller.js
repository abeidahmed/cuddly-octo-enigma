import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["result"];
  static values = { url: String };

  fetchSuggestions(event) {
    if (this.timerId) {
      clearTimeout(this.timerId);
    }

    this.timerId = setTimeout(async () => {
      const res = await fetch(`${this.urlValue}?query=${event.target.value}`);
      const data = await res.text();
      this.resultTarget.innerHTML = data;
    }, 700);
  }
}
