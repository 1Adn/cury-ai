import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="refresh-show-cv"
export default class extends Controller {
  static targets = ["cv"]

  connect() {
    console.log('connected');
    this.refreshPageUntilCVExists(); // Appel de la fonction de rafraîchissement lors de la connexion du contrôleur
  }

  refreshPageUntilCVExists() {
    console.log("Entered the in the method");
    if (this.hasCvTarget) {
      console.log("La div avec l'attribut 'data-refresh-show-cv-target=\"cv\"' a été trouvée !");
      clearInterval(this.intervalId); // Arrêter l'intervalle une fois que la div est trouvée
    } else {
      this.intervalId = setInterval(() => {
        console.log("Rafraîchissement de la page...");
        window.location.reload(); // Rafraîchir la page
      }, 5000); // Rafraîchir toutes les 5 secondes (5000 millisecondes)
    }
  }
}
