import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateWeatherComponent } from './create-weather.component';

describe('CreateWeatherComponent', () => {
  let component: CreateWeatherComponent;
  let fixture: ComponentFixture<CreateWeatherComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateWeatherComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CreateWeatherComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
