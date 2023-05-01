import { Component } from '@angular/core';
import { MatDialog, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { RegistrazioneComponent } from '../registrazione/registrazione.component';

@Component({
  selector: 'app-page1',
  templateUrl: './page1.component.html',
  styleUrls: ['./page1.component.scss']
})

export class Page1Component {

  constructor(public dialog: MatDialog){}

  async getAppName(): Promise<void> {
    try {
      const response = await fetch('/api/getappname', { "method": "POST" });
      if (!response.ok) {
        throw new Error('Error fetching data');
      }

      const data = await response.json();
      alert(data.name);
    } catch (err) {
      console.error(err);
      alert('Error fetching data');
    }
  }

  async searchUsername(): Promise<void> {
    const passwordCard = document.getElementById("passwordCard");
    try {
      //get the username from the input field usernameInput
      var username = (<HTMLInputElement>document.getElementById("usernameInput")).value;
      console.log("searching username: " + username);

      var options = {
        "method": "POST",
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },

        body: JSON.stringify({ username: username })
      };

      console.log(options);
      const response = await fetch('/api/showpassword', options);
      if (!response.ok) {
        throw new Error('Error fetching data');
      }

      const data = await response.json();


      if (passwordCard)
        passwordCard.innerText = data.password;

    } catch (err) {
      console.error(err);

      if (passwordCard)
        passwordCard.innerText = "error!";
    }
  }

  async showQr(): Promise<void> {
    this.dialog.open(RegistrazioneComponent);
  }
}
