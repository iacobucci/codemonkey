import { Component } from '@angular/core';
import { ThemeService } from '../theme.service';

@Component({
  selector: 'app-theme-switcher',
  templateUrl: './theme-switcher.component.html'
})
export class ThemeSwitcherComponent {
  constructor(private themeService: ThemeService) {}

  isDark(): boolean {
    return this.themeService.isDark();
  }

  toggleTheme() {
    this.themeService.toggleTheme();
  }
}
