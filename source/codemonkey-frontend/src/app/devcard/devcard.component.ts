import { Component,Input } from '@angular/core';

@Component({
  selector: 'app-devcard',
  templateUrl: './devcard.component.html',
  styleUrls: ['./devcard.component.scss']
})
export class DevcardComponent {
  @Input() firstName: string = '';
  @Input() lastName: string = '';
  @Input() imageUrl: string = '';
  @Input() valutazione: number = 0;
  @Input() description: string = '';
  @Input() items: string[] = [];
}
