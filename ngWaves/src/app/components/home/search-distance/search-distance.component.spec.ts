import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchDistanceComponent } from './search-distance.component';

describe('SearchDistanceComponent', () => {
  let component: SearchDistanceComponent;
  let fixture: ComponentFixture<SearchDistanceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SearchDistanceComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchDistanceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
