import { Component } from '@angular/core';
import { AuthenticationService } from '../../authentication.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-logout',
  templateUrl: './logout.component.html',
  styleUrls: ['./logout.component.scss']
})
export class LogoutComponent {

  constructor(private http: HttpClient, private router: Router, public dialog: MatDialog, private authenticationService: AuthenticationService) {
  }

  loggedIn: boolean = false;
  username: string = "";


  logout(): void {
    this.authenticationService.logout();
    this.router.navigate(['/']);
  }

  ngOnInit() {
    this.authenticationService.currentUser.subscribe(user => {this.loggedIn = !!user; this.username = localStorage.getItem("username") || "";} );
  }

}
