import { Component, Input } from '@angular/core';
import { UserCardComponent } from "../user-card.component"

import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-company-card',
  templateUrl: './../user-card.component.html',
  styleUrls: ['./../user-card.component.scss']
})
export class CompanyCardComponent extends UserCardComponent {
  constructor(http: HttpClient) {
    super(http);
    this.type = "Company";
  }

  @Input() name: string = '';
  
  override getName(): string {
    return this.name;
  }
}
