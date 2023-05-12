import { Component, Input, OnInit } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

import { ElementRef, ViewChild } from '@angular/core';

@Component({
  selector: 'app-user-card',
  templateUrl: './user-card.component.html',
  styleUrls: ['./user-card.component.scss']
})
export class UserCardComponent {
  constructor(private http: HttpClient) { }

  @Input() username: string = '';

  @ViewChild('profilePicSmallRef') profilePicSmallRef!: ElementRef;
  @ViewChild('profilePicLargeRef') profilePicLargeRef!: ElementRef;

  type: string = 'User';
  firstName: string = '';
  lastName: string = '';
  email: string = '';
  rating: number = 0;
  bio: string = '';
  technologies: object[] = [];

  ngOnInit(): void {
    this.fetchData(this.username);
  }

  mail(): void {
    window.location.href = `mailto:${this.email}`;
  }

  fetchData(username: string): void {
    this.http.post('/api/user/index', { index: { username: username } }).subscribe((data: any) => {

      this.type = data.type;
      this.firstName = data.first_name;
      this.lastName = data.last_name;
      this.rating = data.rating;
      this.bio = data.bio;
      this.email = data.email;
      this.technologies = data.technologies.map((tech: any) => { return tech.name });
    }
    );

    this.http.post("/api/user/propic/download", { propic_download: { username: username } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/webp' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicSmallRef.nativeElement.setAttribute("src", url);
      this.profilePicLargeRef.nativeElement.setAttribute("src", url);
    });
  }

}
