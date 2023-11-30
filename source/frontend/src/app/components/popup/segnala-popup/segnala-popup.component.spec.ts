import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SegnalaPopupComponent } from './segnala-popup.component';

describe('SegnalaPopupComponent', () => {
  let component: SegnalaPopupComponent;
  let fixture: ComponentFixture<SegnalaPopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SegnalaPopupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(SegnalaPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
