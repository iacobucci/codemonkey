import { Component } from '@angular/core';
import { AuthenticationService } from '../authentication.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { MatListSubheaderCssMatStyler } from '@angular/material/list';
import { MatButton } from '@angular/material/button';

@Component({
  selector: 'app-feed',
  templateUrl: './feed.component.html',
  styleUrls: ['./feed.component.scss']
})
export class FeedComponent {

  constructor(private http: HttpClient, private authenticationService: AuthenticationService, private dialog: MatDialog) { }

  hello(): void {
    const url = '/api/rails';
    const jwtToken = localStorage.getItem('currentUser');
    // const headers = new HttpHeaders().set('Authorization', `Bearer ${jwtToken}`);
    console.log(jwtToken, url);

    // this.http.get(url, { headers, responseType: "text" }).pipe(
    this.http.get(url, { responseType: "text" }).pipe(
      catchError(error => {
        console.error('Error:', error);
        return throwError(error);
      })
    ).subscribe(data => {
      // console.log(data);
      alert(data);
      // this.dialog.open(MatButton, { data: {}});
    });
  }
}
