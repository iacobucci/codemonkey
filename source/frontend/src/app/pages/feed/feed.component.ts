import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../authentication.service';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { HostListener } from '@angular/core';

interface User {
  type: string;
  username: string;
}


@Component({
  selector: 'app-feed',
  templateUrl: './feed.component.html',
  styleUrls: ['./feed.component.scss']
})

export class FeedComponent implements OnInit {

  constructor(private http: HttpClient, private authenticationService: AuthenticationService, private dialog: MatDialog) { }

  cards: User[] = [];
  seen: string[] = [];
  moreToLoad: boolean = true;

  ngOnInit(): void {
    this.feed();
  }

  hello(): void {
    const url = '/api/rails';
    const jwtToken = localStorage.getItem('currentUser');
    console.log(jwtToken, url);

    this.http.get(url, { responseType: "text" }).pipe(
      catchError(error => {
        console.error('Error:', error);
        return throwError(error);
      })
    ).subscribe(data => {
      alert(data);
    });
  }

  feed(): void {
    const url = '/api/feed/home';

    this.http.post<any>(url, { home: { type: "Codemonkey", technologies: [], seen: this.seen } }).pipe(
      catchError(error => {
        console.error('Error:', error);
        return throwError(error);
      }
      )
    ).subscribe(data => {
      if (data.length < 4)
        this.moreToLoad = false;

      this.cards.push(...data);
      this.seen.push(...this.cards.map((user: User) => { return user.username }));
    }
    );
  }
}
