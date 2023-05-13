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
  @Input() rating: number | null = null;
  maxRating = 5;

  get filledStars(): number {
    if (this.rating == null)
      return 0;
    return Math.floor(this.rating);
  }

  get hasHalfStar(): boolean {
    if (this.rating == null)
      return false;
    return this.rating % 1 >= 0.5;
  }

  get emptyStars(): number {
    return this.maxRating - this.filledStars - (this.hasHalfStar ? 1 : 0);
  }
}
