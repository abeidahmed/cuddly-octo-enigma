import { Controller } from "stimulus";
import { formErrorHandler } from "../utils";

export default class extends Controller {
  static targets = ["showError"];

  showErrors(event) {
    const [, , xhr] = event.detail;
    const { errors } = JSON.parse(xhr.response);

    this.showErrorTargets.forEach((errorTarget) => {
      const errorType = errorTarget.dataset.formError;

      const errorMsg = formErrorHandler({
        errors,
        type: errorType,
      });
      errorTarget.innerHTML = errorMsg || "";
    });
  }
}
