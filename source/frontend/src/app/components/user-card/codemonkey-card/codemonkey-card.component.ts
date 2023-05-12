import { Component, Input } from '@angular/core';
import { UserCardComponent } from "../user-card.component"
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-codemonkey-card',
  templateUrl: './../user-card.component.html',
  styleUrls: ['./../user-card.component.scss']
})
export class CodemonkeyCardComponent extends UserCardComponent {
  constructor(http: HttpClient) {
    super(http);
    this.hasRating = true;
    this.type = "Codemonkey";
  }

  @Input() firstName: string = '';
  @Input() lastName: string = '';
  
  override getName(): string {
    return this.firstName + " " + this.lastName;
  }
}
