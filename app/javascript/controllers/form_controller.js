import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = ["step1", "step2", "step3", "step4", "step5", "step2Box", "step2Form", "step3BoxSkill", "step3FormSkill", "step3BoxLanguage", "step3InfosLanguage", "step3FormLanguage", "step4Form", "step2Infos", "step2ButtonAddForm", "step3ButtonAddFormLanguage", "step3ButtonAddFormSkill", "step3InfosSkill", "step4Form", "step4Infos", "step4ButtonAddForm", "step4Box"]

  connect() {
    console.log("conected")
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
  goStep5() {
    this.step4Target.classList.add("d-none");
    this.step5Target.classList.remove("d-none");
  }
  showStep2Form() {
    this.step2BoxTarget.classList.remove("d-none");
    this.step2ButtonAddFormTarget.classList.add("d-none");
  }
  showStep3FormLanguage() {
    this.step3BoxLanguageTarget.classList.remove("d-none");
  }
  showStep3FormSkill() {
    this.step3BoxSkillTarget.classList.remove("d-none");
  }
  showStep4Form() {
    this.step4BoxTarget.classList.remove("d-none");
  }

  updateStep2Infos(event) {
    event.preventDefault();
    fetch(this.step2FormTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.step2FormTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.step2InfosTarget.innerHTML = data.inserted_item;
        this.step2ButtonAddFormTarget.classList.remove("d-none");
        this.step2BoxTarget.classList.add("d-none");
        this.step2FormTarget.reset();
      })
  }

  updateStep3InfosLanguage(event) {
    event.preventDefault();
    fetch(this.step3FormLanguageTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.step3FormLanguageTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.step3InfosLanguageTarget.innerHTML = data.inserted_item;
        this.step3ButtonAddFormLanguageTarget.classList.remove("d-none");
        this.step3BoxLanguageTarget.classList.add("d-none");
        this.step3FormLanguageTarget.reset();
      })
  }
  updateStep3InfosSkill(event) {
    event.preventDefault();
    fetch(this.step3FormSkillTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.step3FormSkillTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.step3InfosSkillTarget.innerHTML = data.inserted_item;
        this.step3ButtonAddFormSkillTarget.classList.remove("d-none");
        this.step3BoxSkillTarget.classList.add("d-none");
        this.step3FormSkillTarget.reset();
      })
  }

  updateStep4Infos(event) {
    event.preventDefault();
    fetch(this.step4FormTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json" },
      body: new FormData(this.step4FormTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        this.step4InfosTarget.innerHTML = data.inserted_item;
        this.step4ButtonAddFormTarget.classList.remove("d-none");
        this.step4BoxTarget.classList.add("d-none");
        this.step4FormTarget.reset();
      })
  }
}
