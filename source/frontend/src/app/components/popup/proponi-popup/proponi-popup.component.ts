
import { MAT_DIALOG_DATA } from '@angular/material/dialog';

import { Component, Inject } from '@angular/core';
import { AuthenticationService } from '../../../authentication.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-proponi-popup',
  templateUrl: './proponi-popup.component.html',
  styleUrls: ['./proponi-popup.component.scss']
})
export class ProponiPopupComponent {

  // @Input() value: string = "";

  // constructor(@Inject(MAT_DIALOG_DATA) public data: any) {
  //   // this.value = data.value;
  // }

  constructor(private http: HttpClient, private router: Router, public dialog: MatDialog, private authenticationService: AuthenticationService) {
  }

  loggedIn: boolean = false;
  username: string = "";


  logout(): void {
    this.authenticationService.logout();
    this.router.navigate(['/']);
  }

  ngOnInit() {
    this.authenticationService.currentUser.subscribe(user => { this.loggedIn = !!user; this.username = localStorage.getItem("username") || ""; });
  }
}


