import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CodemonkeyCardComponent } from './codemonkey-card.component';

describe('CodemonkeyCardComponent', () => {
  let component: CodemonkeyCardComponent;
  let fixture: ComponentFixture<CodemonkeyCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CodemonkeyCardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CodemonkeyCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
