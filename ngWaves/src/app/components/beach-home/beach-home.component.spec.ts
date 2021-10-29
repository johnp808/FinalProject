import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BeachHomeComponent } from './beach-home.component';

describe('BeachHomeComponent', () => {
  let component: BeachHomeComponent;
  let fixture: ComponentFixture<BeachHomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BeachHomeComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BeachHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
