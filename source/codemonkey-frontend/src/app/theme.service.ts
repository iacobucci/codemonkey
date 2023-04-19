import { Injectable } from '@angular/core';
import { OverlayContainer } from '@angular/cdk/overlay';

@Injectable({
  providedIn: 'root'
})
export class ThemeService {
  private isDarkTheme = false;

  constructor(private overlayContainer: OverlayContainer) { }

  toggleTheme(): void {
    this.isDarkTheme = !this.isDarkTheme;
    if (this.isDarkTheme) {
      document.body.classList.add('dark-theme');
      this.overlayContainer.getContainerElement().classList.add('dark-theme');
    } else {
      document.body.classList.remove('dark-theme');
      this.overlayContainer.getContainerElement().classList.remove('dark-theme');
    }
  }

  isDark(): boolean {
    return this.isDarkTheme;
  }
}
