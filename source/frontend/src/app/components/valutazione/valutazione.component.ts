import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-valutazione',
  templateUrl: './valutazione.component.html',
  styleUrls: ['./valutazione.component.scss'],
})
export class ValutazioneComponent {
  constructor(){
    this.rating = 0;
  }
  @Input() rating: number;
  maxRating = 5;

  get filledStars(): number {
    return Math.floor(this.rating);
  }

  get hasHalfStar(): boolean {
    return this.rating % 1 >= 0.5;
  }

  get emptyStars(): number {
    return this.maxRating - this.filledStars - (this.hasHalfStar ? 1 : 0);
  }
}
