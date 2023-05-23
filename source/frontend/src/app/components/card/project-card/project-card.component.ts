import { Component, Input, OnInit } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';

import { Project } from "../../../model/project.interface"

import { ElementRef, ViewChild } from '@angular/core';

@Component({
  selector: 'app-project-card',
  templateUrl: './project-card.component.html',
  styleUrls: ['../card.component.scss']
})


export class ProjectCardComponent {
  constructor(private http: HttpClient) { }

  @Input() project: Project | null = null;

  @ViewChild('profilePicCodemonkey') profilePicCodemonkey!: ElementRef;
  @ViewChild('profilePicCompany') profilePicCompany!: ElementRef;


  ngOnInit(): void {
    this.fetchPropic();
  }


  fetchPropic(): void {
    this.http.post("/api/user/propic/download", { propic_download: { username: this.project?.codemonkey } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/jpeg' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicCodemonkey.nativeElement.setAttribute("src", url);
    });

    this.http.post("/api/user/propic/download", { propic_download: { username: this.project?.company } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/jpeg' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicCompany.nativeElement.setAttribute("src", url);
    });
  }

  visitUrl(type: string, username: string | null | undefined): string {
    if (username == null || username == undefined)
      return "";
    return "/" + type.toLowerCase() + "/" + username.toLowerCase();
  }


}
