import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';

import { AuthenticationService } from 'src/app/authentication.service';

import {Tagged} from 'src/app/model/tagged.abstract'

import { User } from "src/app//model/interfaces/user.interface"
import { Codemonkey } from "src/app/model/interfaces/codemonkey.interface"
import { Company } from "src/app/model/interfaces/company.interface"
import { Technology } from 'src/app/model/interfaces/technology.interface';


@Component({
  selector: 'app-feed',
  templateUrl: './feed.component.html',
  styleUrls: ['./feed.component.scss']
})

export class FeedComponent extends Tagged implements OnInit  {

  constructor(http: HttpClient, private authenticationService: AuthenticationService, private dialog: MatDialog) {
    super(http);
   }

  cards: User[] = [];
  seen: string[] = [];
  moreToLoad: boolean = true;

  selectedTechnologies: Technology[] = [];

  ngOnInit(): void {
    this.feed();
    this.feedTechnologies();
  }

  isCodemonkey(user: User): user is Codemonkey {
    return user.type === 'Codemonkey';
  }

  isCompany(user: User): user is Company {
    return user.type === 'Company';
  }
  
  onTechnologyUpdate() {
    this.cards = [];
    this.seen = [];
    this.feed();
  }
    

  feed(): void {
    const url = '/api/feed/home';

    this.http.post<any>(url, { home: { type: "Codemonkey", technologies: this.selectedTechnologies, seen: this.seen } }).pipe(
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
