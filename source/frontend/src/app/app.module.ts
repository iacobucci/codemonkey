//base
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

//misc
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { RangePipe } from './range.pipe';
import { AuthGuard } from './auth.guard';
import { TokenInterceptor } from './token.interceptor';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

//angular material
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatTableModule } from '@angular/material/table';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatCardModule } from '@angular/material/card';
import { MatListModule } from '@angular/material/list';
import { MatInputModule } from '@angular/material/input';
import { MatDialogModule } from '@angular/material/dialog';
import { MatRippleModule } from '@angular/material/core';
import { MatRadioModule } from '@angular/material/radio';
import {MatSelectModule} from '@angular/material/select';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { MatProgressBarModule } from '@angular/material/progress-bar';

//packages
import { QRCodeModule } from "angularx-qrcode"

//pages
import { FeedComponent } from './pages/feed/feed.component';
import { HomeComponent } from './pages/home/home.component';
import { LoginComponent } from './pages/login/login.component'
import { SignupComponent } from './pages/signup/signup.component';

//components
import { ThemeSwitcherComponent } from './components/theme-switcher/theme-switcher.component';
import { ValutazioneComponent } from './components/valutazione/valutazione.component';
import { RegistrazionePopupComponent } from './components/popup/registrazione-popup/registrazione-popup.component';
import { ProponiPopupComponent } from './components/popup/proponi-popup/proponi-popup.component';
import { LoginPopupComponent } from './components/popup/login-popup/login-popup.component';
import { LogoutComponent } from './components/logout/logout.component';
import { ImageUploaderComponent } from './components/image-uploader/image-uploader.component';

import { UserCardComponent } from './components/card/user/user-card.component';
import { CodemonkeyCardComponent } from './components/card/user/codemonkey/codemonkey-card.component';
import { CompanyCardComponent } from './components/card/user/company/company-card.component';
import { ProjectCardComponent } from './components/card/project-card/project-card.component';

import { UserComponent } from './pages/user/user.component';
import { CompanyComponent } from './pages/user/company/company.component'
import { CodemonkeyComponent } from './pages/user/codemonkey/codemonkey.component';
import { SettingsComponent } from './pages/settings/settings.component';


@NgModule({
  declarations: [
    AppComponent,

    FeedComponent,
    HomeComponent,
    LoginComponent,
    SignupComponent,

    ThemeSwitcherComponent,
    ValutazioneComponent,
    RegistrazionePopupComponent,
    ProponiPopupComponent,
    LoginPopupComponent,
    LogoutComponent,
    ImageUploaderComponent,
    UserCardComponent,

    RangePipe,
    CodemonkeyCardComponent,
    CompanyCardComponent,
    CodemonkeyComponent,
    UserComponent,
    CompanyComponent,
    ProjectCardComponent,
    SettingsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatIconModule,
    MatFormFieldModule,
    MatInputModule,
    MatTableModule,
    MatToolbarModule,
    MatCardModule,
    MatListModule,
    QRCodeModule,
    MatDialogModule,
    MatRadioModule,
    MatRippleModule,
    MatProgressBarModule,
    MatSelectModule,
    ReactiveFormsModule,
    FormsModule,
    HttpClientModule,
    RouterModule.forRoot([
      { path: '', component: FeedComponent },
      { path: 'login', component: LoginComponent },
      { path: 'registrazione', component: SignupComponent },
      { path: 'start', component: HomeComponent },

      { path: 'settings', component: SettingsComponent, canActivate: [AuthGuard] },

      { path: "codemonkey/:username", component: CodemonkeyComponent },
      { path: "company/:username", component: CompanyComponent },
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
