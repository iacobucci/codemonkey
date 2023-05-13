import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../authentication.service';
import { HttpClient } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';

import {User} from "../../interfaces/user.interface"
import {Codemonkey} from "../../interfaces/codemonkey.interface"
import {Company} from "../../interfaces/company.interface"


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
  
  isCodemonkey(user: User): user is Codemonkey {
    return user.type === 'Codemonkey';
  }

  isCompany(user: User): user is Company {
    return user.type === 'Company';
  }

  feed(): void {
    const url = '/api/feed/home';

    this.http.post<any>(url, { home: { type: "All", technologies: [], seen: this.seen } }).pipe(
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
