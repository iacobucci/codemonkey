import { Component } from '@angular/core';
import { ThemeService } from './theme.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {

  title = 'Codemonkey';

  constructor(public themeService: ThemeService) {}

  isDark(): boolean {
    return this.themeService.isDarkMode();
  }
}