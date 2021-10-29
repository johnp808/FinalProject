import { TestBed } from '@angular/core/testing';

import { WeatherCommentService } from './weather-comment.service';

describe('WeatherCommentService', () => {
  let service: WeatherCommentService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(WeatherCommentService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
