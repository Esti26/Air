import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="rental-calculations"
export default class extends Controller {
  static targets = ["start", "end", "days", "price"]
  static values = {
    price: String
  }

  connect() {
    console.log(this.startTarget)
    console.log(this.endTarget)
  }
  daysRented() {
    const start = new Date(this.startTarget.value)
    const end = new Date(this.endTarget.value)
    const Difference_In_Time = end.getTime() - start.getTime();
    const rented_days = Difference_In_Time / (1000 * 3600 * 24);
    if (rented_days < 0)
      this.daysTarget.innerHTML = "start date is defore end date"
    else if(rented_days == 0)
      this.daysTarget.innerHTML = "you have to rent the wig at least for 24h"
    else if(!rented_days)
      this.daysTarget.innerHTML = "you have to choose both dates"
    else if (rented_days == 1) {
      this.daysTarget.innerHTML =  `You are renting the wig fordays <strong> ${rented_days} </strong> day`
      this.priceTarget.innerHTML =  `Total price is ${rented_days*this.priceValue} €`
    }

    else{
      this.daysTarget.innerHTML =  `You are renting the wig fordays <strong> ${rented_days} </strong> days`
      this.priceTarget.innerHTML =  `Total price is ${rented_days*this.priceValue} €`
    }

  }
}
