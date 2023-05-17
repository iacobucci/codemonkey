import { Component } from '@angular/core';

import { UserComponent } from '../user.component';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-codemonkey',
  templateUrl: './../user.component.html',
  styleUrls: ['./../user.component.scss']
})
export class CodemonkeyComponent extends UserComponent {
  constructor(route: ActivatedRoute, http: HttpClient) {
    super(route,http);
    this.type = "Codemonkey";
    this.hasRating = true;
  }
}
