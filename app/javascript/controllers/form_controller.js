import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["step1", "step2", "step3", "step4", "step5", "step2FormLanguage", "step2FormSkill", "step3Form", "step4Form"]

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
  showStep2FormLanguage() {
    this.step2FormLanguageTarget.classList.remove("d-none")
  }
  showStep2FormSkill() {
    this.step2FormSkillTarget.classList.remove("d-none")
  }
  showStep3Form() {
    this.step3FormTarget.classList.remove("d-none")
  }
  showStep4Form() {
    this.step4FormTarget.classList.remove("d-none")
  }
}
