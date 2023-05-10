import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot } from '@angular/router';
import { AuthenticationService } from './authentication.service';

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authenticationService: AuthenticationService, private router: Router) {}

  canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean {
    const currentUser = this.authenticationService.currentUserValue;
    if (this.authenticationService.isLoggedIn()) {
      return true;
    }

    // User is not logged in. Redirect to login page.
    this.authenticationService.redirectUrl = state.url; 

    this.router.navigate(['/login'], { queryParams: { returnUrl: state.url } });
    return false;
  }
}
