import { Component, Input } from '@angular/core';
import { UserCardComponent } from "../user-card.component"
import { HttpClient } from '@angular/common/http';

import { Codemonkey } from 'src/app/interfaces/codemonkey.interface';

@Component({
  selector: 'app-codemonkey-card',
  templateUrl: './../user-card.component.html',
  styleUrls: ['./../../card.component.scss']
})

export class CodemonkeyCardComponent extends UserCardComponent {
  constructor(http: HttpClient) {
    super(http);
  }

  private _codemonkey: Codemonkey | null = null;

  @Input()
  get codemonkey(): Codemonkey | null {
    return this._codemonkey;
  }

  set codemonkey(value: Codemonkey | null) {
    this._codemonkey = value;

    if (value) {
      this.user = value;
      this.hasRating = true;
      this.rating = value.rating ?? null;
      this.technologies = value.technologies ?? null;
      this.bio = value.bio ?? null;
      this.name = `${value.first_name} ${value.last_name}`;
    }
  }
}
