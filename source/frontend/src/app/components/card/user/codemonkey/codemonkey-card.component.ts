import { Component, Input, OnInit } from '@angular/core';
import { UserCardComponent } from "../user-card.component"
import { HttpClient } from '@angular/common/http';

import { Codemonkey } from 'src/app/model/codemonkey.interface';
import { Technology } from 'src/app/model/technology.interface';

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
  
  override ngOnInit(): void {
      super.ngOnInit();
      this.fetchRatingByTechnologies();
  }

  @Input()
  get codemonkey(): Codemonkey | null {
    return this._codemonkey;
  }
  
  @Input() selectedTechnologies: Technology[] = [];

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

  fetchRatingByTechnologies() {
    const url = '/api/user/rating_by_technologies';
    this.http.post<any>(url, {rating_by_technologies :{ technologies: this.selectedTechnologies, username: this.user?.username }}).subscribe((data) => {
      // this.rating = data.rating;
      console.log("rating by technologies", data);

    });
  }
}
