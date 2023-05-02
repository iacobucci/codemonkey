import { Component } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material/dialog';
import { map } from 'rxjs/operators';
import { RegistrazionePopupComponent } from '../registrazione-popup/registrazione-popup.component';

interface responseData {
  user: string;
  otp_provisioning_uri: string;
}

@Component({
  selector: 'app-registrazione',
  templateUrl: './registrazione.component.html',
  styleUrls: ['./registrazione.component.scss']
})


export class RegistrazioneComponent {
  authenticationService: AuthenticationService;

  username: string = "";
  email: string = "";
  password: string = "";
  password_confirmation: string = "";


  constructor(private http: HttpClient, public dialog: MatDialog) {
    this.authenticationService = new AuthenticationService(http);
  }


  onSubmit() {

    const requestData = { user: { username: this.username, email: this.email, password: this.password, password_confirmation: this.password, } };
    console.log("Registrazione request", requestData);

    this.http.post<responseData>('api/registrations', requestData)
      .pipe(map(response => response as responseData))
      .subscribe(
        (response) => {
          console.log(response);

          this.dialog.open(RegistrazionePopupComponent, {
            data: { value: response.otp_provisioning_uri },
          },);
        },

        (error) => {
          console.log(error);
        }
      );

  }
}
