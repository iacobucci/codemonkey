import { Injectable } from '@angular/core';
import { OverlayContainer } from '@angular/cdk/overlay';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ThemeService {
  private darkTheme = new BehaviorSubject<boolean>(false);
  isDarkTheme = this.darkTheme.asObservable();

  constructor() {}

  toggleTheme(): void {
    this.darkTheme.next(!this.darkTheme.value);
  }
  
  public isDark(): boolean {
    return this.darkTheme.value;
  }
}
