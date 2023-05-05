import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject, Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})

export class AuthenticationService {
  private currentUserSubject: BehaviorSubject<any>;
  public currentUser: Observable<any>;

  public redirectUrl: string | null = "";

  constructor(private http: HttpClient) {
    var cu = localStorage.getItem('jwt');

    this.currentUserSubject = new BehaviorSubject<any>(cu);

    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): any {
    return this.currentUserSubject.value;
  }

  login(username: string, password: string, totp: string) {
    const headers = new HttpHeaders({ 'Content-Type': 'application/json' });
    return this.http.post<any>('/api/auth', { username, password, totp }, { headers })
      .pipe(map(user => {
        if (user) {
          localStorage.setItem('jwt', user.jwt);
          localStorage.setItem('username', user.username);
          this.currentUserSubject.next(user);
        }
        return user;
      }));
  }

  logout() {
    localStorage.removeItem('jwt');
    localStorage.removeItem('username');
    this.currentUserSubject.next(null);
  }

  isLoggedIn(): boolean {
    if (this.currentUserValue == null) {
      return false;
    }
    else if (this.currentUserValue != null) {
      return true;
    }
    return false;
  }
}
