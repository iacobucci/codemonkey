import { Injectable, Renderer2, RendererFactory2 } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class ThemeService {
  private renderer: Renderer2;
  private colorTheme: string = 'light-mode';
  
  constructor(rendererFactory: RendererFactory2) {
    this.renderer = rendererFactory.createRenderer(null, null);
    if (localStorage.getItem('user-theme')) {
      if (localStorage.getItem('user-theme') === 'dark-mode') {
        this.colorTheme = 'dark-mode';
        this.update('dark-mode');
      }
      else {
        this.colorTheme = 'light-mode';
        this.update('light-mode');
      }
    }
    else {
      this.colorTheme = 'light-mode';
      this.update('light-mode');
    }
  }

  initTheme() {
    this.getColorTheme();
    this.renderer.addClass(document.body, this.colorTheme);
  }

  update(theme: 'dark-mode' | 'light-mode') {
    this.setColorTheme(theme);
    const previousColorTheme =
      theme === 'dark-mode' ? 'light-mode' : 'dark-mode';
    this.renderer.removeClass(document.body, previousColorTheme);
    this.renderer.addClass(document.body, theme);
  }

  isDarkMode() {
    return this.colorTheme === 'dark-mode';
  }

  private setColorTheme(theme: 'dark-mode' | 'light-mode') {
    this.colorTheme = theme;
    localStorage.setItem('user-theme', theme);
  }

  private getColorTheme() {
    if (localStorage.getItem('user-theme')) {
      if (localStorage.getItem('user-theme') === 'dark-mode') {
        this.colorTheme = 'dark-mode';
      }
      else {
        this.colorTheme = 'light-mode';
      }
    } else {
      this.colorTheme = 'light-mode';
    }
  }
}