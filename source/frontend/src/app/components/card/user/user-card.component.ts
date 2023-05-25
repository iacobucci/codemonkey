import { Component} from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Technology } from "../../../model/interfaces/technology.interface"
import { User } from "../../../model/interfaces/user.interface"

import { SimpleChanges } from '@angular/core';
import { ElementRef, ViewChild } from '@angular/core';

@Component({
  selector: 'app-user-card',
  templateUrl: './user-card.component.html',
  styleUrls: ['../card.component.scss'],
})

export class UserCardComponent {

  @ViewChild('profilePicSmallRef') profilePicSmallRef!: ElementRef;
  @ViewChild('profilePicLargeRef') profilePicLargeRef!: ElementRef;

  user: User | null = null;

  name: string | null = null;
  rating: number | null = null;
  bio: string | null = null;
  technologies: Technology[] | null = null;

  hasRating: boolean = false;

  constructor(protected http: HttpClient) { }

  ngOnInit(): void {
    if (this.user)
      this.fetchData(this?.user.username);
  }

  ngOnChanges(changes: SimpleChanges): void {
    if (changes["user"] && changes["user"].currentValue) {
      const username = changes["user"].currentValue.username;
      this.fetchData(username);
    }
  }

  fetchData(username: string | undefined): void {
    // Se l'username è indefinito, termina l'esecuzione del metodo
    if (!username) return;

    this.http.post("/api/user/propic/download", { propic_download: { username: username } }, { responseType: 'blob' }).subscribe((data: any) => {
      const blob = new Blob([data], { type: 'image/webp' });
      const url = window.URL.createObjectURL(blob);

      this.profilePicSmallRef.nativeElement.setAttribute("src", url);
      this.profilePicLargeRef.nativeElement.setAttribute("src", url);
    });
  }


  mail(): void {
    window.location.href = `mailto:${this.user?.email}`;
  }


  visitUrl(): string {
    return "/" + this.user?.type.toLowerCase() + "/" + this.user?.username;
  }

  technology(name: string) {
    return "/" + this.user?.type.toLowerCase() + "/" + this.user?.username + "?technology=" + name;
  }


}
