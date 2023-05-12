import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistrazionePopupComponent } from './registrazione-popup.component';

describe('RegistrazionePopupComponent', () => {
  let component: RegistrazionePopupComponent;
  let fixture: ComponentFixture<RegistrazionePopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ RegistrazionePopupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(RegistrazionePopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
