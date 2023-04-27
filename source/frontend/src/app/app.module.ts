import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

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

import { ThemeSwitcherComponent } from './theme-switcher/theme-switcher.component';
import { Page1Component } from './page1/page1.component';
import { Page2Component } from './page2/page2.component';
import { HomeComponent } from './home/home.component';
import { DevcardComponent } from './devcard/devcard.component';

import { ValutazioneComponent } from './valutazione/valutazione.component';
import { RangePipe } from './range.pipe';

@NgModule({
  declarations: [
    AppComponent,
    ThemeSwitcherComponent,
    Page1Component,
    Page2Component,
    HomeComponent,
    DevcardComponent,
    ValutazioneComponent,
    RangePipe
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

    RouterModule.forRoot([
      { path: '', component: HomeComponent },
      { path: 'page1', component: Page1Component },
      { path: 'page2', component: Page2Component },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
