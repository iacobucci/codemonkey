import { Component } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { LoginPopupComponent } from '../login-popup/login-popup.component';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

export class LoginComponent {
  authenticationService: AuthenticationService;

  constructor(private http: HttpClient, private router: Router, public dialog: MatDialog) {
    this.authenticationService = new AuthenticationService(http);
  }

  username: string = "";
  password: string = "";
  totp: string = "";

  onSubmit() {

    const requestData = { username: this.username, password: this.password, totp: this.totp };
    console.log("Login request", requestData);

    this.authenticationService.login(this.username, this.password, this.totp).subscribe(
      (user) => {
        console.log("Login response", user);
        this.router.navigate(['/feed']);
      },
      (error) => {
        this.dialog.open(LoginPopupComponent, {
          data: { value: error.error },
          },);
      }
    );
  }
}
