import { Component, Input, OnInit } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

import { Technology } from "../../interfaces/technology.interface"

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

  @Input() email: string = '';
  @Input() rating: number = 0;
  @Input() bio: string = '';
  @Input() technologies: Technology[] = [];
  
  hasRating: boolean = false;
  type = "User";
  
  getName(): string{
    return "";
  }

  ngOnInit(): void {
    this.fetchData(this.username);
  }

  mail(): void {
    window.location.href = `mailto:${this.email}`;
  }
  
  
  fetchData(username: string): void {
    this.http.post("/api/user/propic/download", { propic_download: { username: username } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/webp' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicSmallRef.nativeElement.setAttribute("src", url);
      this.profilePicLargeRef.nativeElement.setAttribute("src", url);
    });
  }
  
  visitUrl(): string{
    return "/" + this.type.toLowerCase() + "/" + this.username;
  }

  technology(name: string){
    return "/" + this.type.toLowerCase() + "/" + this.username + "?technology=" + name;
  }


}
