import { Component, Inject } from '@angular/core';

import { MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
  selector: 'app-proponi-popup',
  templateUrl: './proponi-popup.component.html',
  styleUrls: ['./proponi-popup.component.scss']
})
export class ProponiPopupComponent {

  // @Input() value: string = "";
    
  constructor(@Inject(MAT_DIALOG_DATA) public data: any) {
    // this.value = data.value;
  }
}
