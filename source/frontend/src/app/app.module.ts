import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { RouterModule } from '@angular/router';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCardModule } from '@angular/material/card';
import { MatListModule } from '@angular/material/list';
import { MatInputModule } from '@angular/material/input';
import { MatDialogModule } from '@angular/material/dialog';
import { MatRippleModule } from '@angular/material/core';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';

import { NgxQRCodeModule } from 'ngx-qrcode2';

import { ThemeSwitcherComponent } from './theme-switcher/theme-switcher.component';
import { FeedComponent } from './feed/feed.component';
import { HomeComponent } from './home/home.component';
import { DevcardComponent } from './devcard/devcard.component';
import { ValutazioneComponent } from './valutazione/valutazione.component';
import { RangePipe } from './range.pipe';
import { RegistrazioneComponent } from './registrazione/registrazione.component';
import { LoginComponent } from './login/login.component'
import { AuthGuard } from './auth.guard';
import { RegistrazionePopupComponent } from './registrazione-popup/registrazione-popup.component';
import { LoginPopupComponent } from './login-popup/login-popup.component';

@NgModule({
  declarations: [
    AppComponent,
    ThemeSwitcherComponent,
    HomeComponent,
    DevcardComponent,
    ValutazioneComponent,
    RangePipe,
    RegistrazioneComponent,
    LoginComponent,
    RegistrazionePopupComponent,
    FeedComponent,
    LoginPopupComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatIconModule,
    MatFormFieldModule,
    MatInputModule,
    MatToolbarModule,
    MatCardModule,
    MatListModule,
    NgxQRCodeModule,
    MatDialogModule,
    MatRippleModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,

    RouterModule.forRoot([
      { path: '', component: HomeComponent },
      { path: 'login', component: LoginComponent },
      { path: 'registrazione', component: RegistrazioneComponent },
      { path: 'feed', component: FeedComponent, canActivate: [AuthGuard] },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
