import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["step1", "step2", "step3", "step4", "step5", "step2Form", "step3FormSkill", "step3FormLanguage", "step4Form"]

  connect() {
    console.log("Connected")
  }
  goStep2() {
    this.step1Target.classList.add("d-none");
    this.step2Target.classList.remove("d-none");
  }
  goStep3() {
    this.step2Target.classList.add("d-none");
    this.step3Target.classList.remove("d-none");
  }
  goStep4() {
    this.step3Target.classList.add("d-none");
    this.step4Target.classList.remove("d-none");
  }
  showStep2Form() {
    this.step2FormTarget.classList.remove("d-none")
  }
  showStep3FormSkill() {
    this.step2FormSkillTarget.classList.remove("d-none")
  }
  showStep3FormLanguage() {
    this.step3FormLanguageTarget.classList.remove("d-none")
  }
  showStep4Form() {
    this.step4FormTarget.classList.remove("d-none")
  }
}
