import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CodemonkeyComponent } from './codemonkey.component';

describe('CodemonkeyComponent', () => {
  let component: CodemonkeyComponent;
  let fixture: ComponentFixture<CodemonkeyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CodemonkeyComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CodemonkeyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
