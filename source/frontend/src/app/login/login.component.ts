import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

export class LoginComponent {
  authenticationService: AuthenticationService;

  constructor(private http: HttpClient, private router: Router) {
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
        this.router.navigate(['/']);
      },
      (error) => {
        console.log(error);
      }
    );
  }
}
