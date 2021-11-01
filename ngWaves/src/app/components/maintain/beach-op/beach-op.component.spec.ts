import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BeachOpComponent } from './beach-op.component';

describe('BeachOpComponent', () => {
  let component: BeachOpComponent;
  let fixture: ComponentFixture<BeachOpComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BeachOpComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BeachOpComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
