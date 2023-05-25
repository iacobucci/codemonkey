import { Component, OnInit, Input } from '@angular/core';
import { AuthenticationService } from '../../authentication.service';
import { HttpClient } from '@angular/common/http';
import { catchError } from 'rxjs/operators';
import { throwError } from 'rxjs';
import { MatDialog } from '@angular/material/dialog';
import { ElementRef, ViewChild } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { Tagged } from "../../model/tagged.abstract";

import { Project } from "src/app/model/interfaces/project.interface"
import { User } from "src/app/model/interfaces/user.interface"
import { Codemonkey } from 'src/app/model/interfaces/codemonkey.interface';
import { Company } from 'src/app/model/interfaces/company.interface';
import { Technology } from 'src/app/model/interfaces/technology.interface';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})

export class UserComponent extends Tagged implements OnInit {

  @ViewChild('profilePicLargeRef') profilePicLargeRef!: ElementRef;

  @Input() username: string | null = "";


  type: string = "User";
  user: Company | Codemonkey | null = null;
  name: string | null = null;
  hasRating = false;

  cards: Project[] = [];
  seen: number[] = [];
  moreToLoad: boolean = true;

  selectedTechnologies: Technology[] = [];

  constructor(private route: ActivatedRoute, http: HttpClient) {
    super(http);
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.username = params.get('username');
      this.fetchUser();
    });
    this.fetchPropic();
    this.feed();
    this.feedTechnologies();

  }

  onTechnologyUpdate() {
    this.cards = [];
    this.seen = [];
    this.feed();
  }

  feed(): void {
    const url = '/api/feed/user';

    this.http.post<any>(url, { user: { username: this.username, technologies: this.selectedTechnologies, seen: this.seen } }).pipe(
      catchError(error => {
        console.error('Error:', error);
        return throwError(error);
      }
      )
    ).subscribe(data => {
      if (data.length < 4)
        this.moreToLoad = false;

      this.cards.push(...data);
      this.seen.push(...this.cards.map((project: Project) => { return project.id }));
    }
    );
  }


  fetchPropic(): void {
    this.http.post("/api/user/propic/download", { propic_download: { username: this.username } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/webp' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicLargeRef.nativeElement.setAttribute("src", url);
    });
  }

  fetchUser(): void {
    this.http.post("/api/user/index", { index: { username: this.username } }).subscribe((data: any) => {

      console.log(data);

      if (data.type === "Codemonkey") {
        this.user = data as Codemonkey;
        this.name = this.user.first_name + " " + this.user.last_name;

      } else if (data.type === "Company") {
        this.user = data as Company;
        this.name = this.user.name;

      } else {
        console.error("Invalid user type received");
      }
    });
  }

}

