import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material/dialog';
import { map } from 'rxjs/operators';
import { RegistrazionePopupComponent } from '../registrazione-popup/registrazione-popup.component';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';

interface responseData {
  user: string;
  otp_provisioning_uri: string;
}

@Component({
  selector: 'app-registrazione',
  templateUrl: './registrazione.component.html',
  styleUrls: ['./registrazione.component.scss']
})


export class RegistrazioneComponent implements OnInit {
  authenticationService: AuthenticationService;

  username: string = "";
  email: string = "";
  password: string = "";
  password_confirmation: string = "";
  tipo: string = "";
  registerForm: FormGroup;

  constructor(private http: HttpClient, public dialog: MatDialog, private formBuilder: FormBuilder) {
    this.authenticationService = new AuthenticationService(http);
    this.registerForm = new FormGroup({});
  }

  ngOnInit(): void {
    this.registerForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      password_confirmation: ['', [Validators.required]],
      tipo: ['', [Validators.required]],
    }, { validator: this.passwordMatchValidator });
  }

  passwordMatchValidator(formGroup: FormGroup) {
    const password = formGroup.get('password')?.value;
    const confirmPassword = formGroup.get('password_confirmation')?.value;

    if (password !== confirmPassword) {
      formGroup.controls['password_confirmation'].setErrors({ mismatch: true });
    } else {
      formGroup.controls['password_confirmation'].setErrors(null);
    }
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
