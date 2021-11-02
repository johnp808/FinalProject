import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SearchBeachComponent } from './search-beach.component';

describe('SearchBeachComponent', () => {
  let component: SearchBeachComponent;
  let fixture: ComponentFixture<SearchBeachComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SearchBeachComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SearchBeachComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
