import { Component } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient } from '@angular/common/http';
import { ActivatedRoute, Router } from '@angular/router';
import { MatDialog } from '@angular/material/dialog';
import { LoginPopupComponent } from '../login-popup/login-popup.component';
import { OnInit } from '@angular/core';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})

export class LoginComponent implements OnInit {
  authenticationService: AuthenticationService;

  constructor(private http: HttpClient, private router: Router, public dialog: MatDialog, private route: ActivatedRoute) {
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
        //add 500ms delay to simulate server api call
        
        console.log("Login response", user);
        const returnUrl = this.authenticationService.redirectUrl;
        this.authenticationService.redirectUrl = null;
        this.router.navigate([returnUrl || '/feed']);
      },
      (error) => {
        this.dialog.open(LoginPopupComponent, {
          data: { value: error.error },
        },);
      },

    );
  }

  ngOnInit() {
    // ottieni l'URL di ritorno dai parametri di query della rotta oppure imposta un valore predefinito
    this.authenticationService.redirectUrl = this.route.snapshot.queryParams['returnUrl'] || '/feed';
  }
}
