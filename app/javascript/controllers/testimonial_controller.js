import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["testimonial"]

  initialize() {
    this.showTestimonial(0);
  }

  showTestimonial(index) {
    this.testimonialTargets.forEach((el, i) => {
      el.style.display = i === index ? 'block' : 'none';
    });
    this.currentTestimonialIndex = index;
  }

  next() {
    let index = this.currentTestimonialIndex + 1;
    index = index < this.testimonialTargets.length ? index : 0;
    this.showTestimonial(index);
  }

  previous() {
    let index = this.currentTestimonialIndex - 1;
    index = index >= 0 ? index : this.testimonialTargets.length - 1;
    this.showTestimonial(index);
  }
}


