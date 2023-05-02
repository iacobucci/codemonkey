import { Component, Inject } from '@angular/core';

import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-login-popup',
  templateUrl: './login-popup.component.html',
  styleUrls: ['./login-popup.component.scss']
})

export class LoginPopupComponent {

  // @Input() value: string = "";
  value: string = "";
  constructor(@Inject(MAT_DIALOG_DATA) public data: any) {
    this.value = data.value;
  }
}
