import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

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
import { MatRadioModule } from '@angular/material/radio';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { MatProgressBarModule } from '@angular/material/progress-bar';

import { QRCodeModule } from "angularx-qrcode"

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
import { LogoutComponent } from './logout/logout.component';
import { TokenInterceptor } from './interceptors/token.interceptor';
import { ImageUploaderComponent } from './image-uploader/image-uploader.component';
import { UserCardComponent } from './user-card/user-card.component'

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
    LoginPopupComponent,
    LogoutComponent,
    ImageUploaderComponent,
    UserCardComponent
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
    QRCodeModule,
    MatDialogModule,
    MatRadioModule,
    MatRippleModule,
    MatProgressBarModule,
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
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
