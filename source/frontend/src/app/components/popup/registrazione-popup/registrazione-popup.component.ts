import { Component, Inject } from '@angular/core';

import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-registrazione-popup',
  templateUrl: './registrazione-popup.component.html',
  styleUrls: ['./registrazione-popup.component.scss']
})
export class RegistrazionePopupComponent {

  // @Input() value: string = "";
  value: string = "";
  constructor(@Inject(MAT_DIALOG_DATA) public data: any) {
    this.value = data.value;
  }
}
