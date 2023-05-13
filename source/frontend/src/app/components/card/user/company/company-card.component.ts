import { Component, Input } from '@angular/core';
import { UserCardComponent } from "../user-card.component"

import { HttpClient } from '@angular/common/http';

import { Company } from 'src/app/interfaces/company.interface';

@Component({
  selector: 'app-company-card',
  templateUrl: './../user-card.component.html',
  styleUrls: ['./../../card.component.scss']
})

export class CompanyCardComponent extends UserCardComponent {
  constructor(http: HttpClient) {
    super(http);
  }

  private _company: Company | null = null;

  @Input()
  get company(): Company | null {
    return this._company;
  }

  set company(value: Company | null) {
    this._company = value;

    if (value) {
      this.user = value;
      this.hasRating = false;
      this.technologies = value.technologies ?? null;
      this.bio = value.bio ?? null;
      this.name = value.name + "";
    }
  }
}
