import { Component } from '@angular/core';

import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { UserComponent } from '../user.component';

@Component({
  selector: 'app-company',
  templateUrl: './../user.component.html',
  styleUrls: ['./../user.component.scss']
})
export class CompanyComponent extends UserComponent{
  constructor(route: ActivatedRoute, http: HttpClient) {
    super(route, http);
    this.type = "Company";
  }
}
