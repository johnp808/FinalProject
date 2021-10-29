import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ShowBeachComponent } from './show-beach.component';

describe('ShowBeachComponent', () => {
  let component: ShowBeachComponent;
  let fixture: ComponentFixture<ShowBeachComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ShowBeachComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ShowBeachComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
