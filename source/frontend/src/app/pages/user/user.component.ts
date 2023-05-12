import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { ElementRef, ViewChild } from '@angular/core';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.scss']
})
export class UserComponent {
  
  @ViewChild('profilePicLargeRef') profilePicLargeRef!: ElementRef;
  username: string | null="";
  
  type: string = "User";
  
  constructor(private route: ActivatedRoute, private http: HttpClient) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.username = params.get('username');
      this.fetchUserProfile(this.username);
    });
    this.fetchData(this.username!);
  }

  fetchUserProfile(username: string | null): void {
    const apiUrl = '/api/user/index';
    this.http.post(apiUrl, { index: { username: username } }).subscribe(
      response => {
        console.log(response);
        // Gestisci i dati ricevuti dal server qui
      },
      error => {
        // Gestisci eventuali errori qui
      }
    );
  }

  fetchData(username: string): void {
    this.http.post("/api/user/propic/download", { propic_download: { username: username } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/webp' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicLargeRef.nativeElement.setAttribute("src", url);
    });
  }

}
