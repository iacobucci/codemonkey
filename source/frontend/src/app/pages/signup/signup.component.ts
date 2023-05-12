import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../authentication.service';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material/dialog';
import { map } from 'rxjs/operators';
import { RegistrazionePopupComponent } from '../../components/popup/registrazione-popup/registrazione-popup.component';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';

interface responseData {
  user: string;
  otp_provisioning_uri: string;
}

@Component({
  selector: 'app-signup',
  templateUrl: './signup.component.html',
  styleUrls: ['./signup.component.scss']
})


export class SignupComponent implements OnInit {
  authenticationService: AuthenticationService;

  signupForm: FormGroup;

  constructor(private http: HttpClient, public dialog: MatDialog, private formBuilder: FormBuilder) {
    this.authenticationService = new AuthenticationService(http);
    this.signupForm = new FormGroup({});
  }

  ngOnInit(): void {
    this.signupForm = this.formBuilder.group({
      username: ['', [Validators.required]],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required]],
      password_confirmation: ['', [Validators.required]],
      type: ['', [Validators.required]],
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

    const requestData = {
      signup: {
        username: this.signupForm.get('username')?.value,
        email: this.signupForm.get('email')?.value,
        password: this.signupForm.get('password')?.value,
        type: this.signupForm.get('type')?.value,
      }
    };

    this.http.post<responseData>('api/user/signup', requestData)
      .pipe(map(response => response as responseData))
      .subscribe(
        (response) => {
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
