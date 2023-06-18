import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProponiPopupComponent } from './proponi-popup.component';

describe('ProponiPopupComponent', () => {
  let component: ProponiPopupComponent;
  let fixture: ComponentFixture<ProponiPopupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ProponiPopupComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ProponiPopupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
