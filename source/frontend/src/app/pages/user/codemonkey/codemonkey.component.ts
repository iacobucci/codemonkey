import { Component } from '@angular/core';

import { UserComponent } from '../user.component';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-codemonkey',
  templateUrl: './../user.component.html',
  styleUrls: ['./../user.component.scss']
})
export class CodemonkeyComponent extends UserComponent {

  constructor(route: ActivatedRoute, http: HttpClient, dialog: MatDialog) {
    super(route, http, dialog);
    this.type = "Codemonkey";
    this.hasRating = true;
  }

}
