import { Injectable } from '@angular/core';
import { HttpInterceptor, HttpHandler, HttpRequest } from '@angular/common/http';
import { AuthenticationService } from '../authentication.service';

@Injectable()
export class TokenInterceptor implements HttpInterceptor {
  constructor(private authService: AuthenticationService) {}

  intercept(req: HttpRequest<any>, next: HttpHandler) {
    // Verifica se la richiesta è verso /api/auth o /api/register e non aggiunge il token JWT.
    if (req.url.includes('/api/auth') || req.url.includes('/api/register')) {
      return next.handle(req);
    }

    // Aggiungi il token JWT alle richieste protette.
    const authToken = localStorage.getItem("jwt");
    if (authToken) {
      const authReq = req.clone({
        headers: req.headers.set('Authorization', `Bearer ${authToken}`)
      });
      return next.handle(authReq);
    }

    return next.handle(req);
  }
}