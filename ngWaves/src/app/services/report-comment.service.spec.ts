import { TestBed } from '@angular/core/testing';

import { ReportCommentService } from './report-comment.service';

describe('ReportCommentService', () => {
  let service: ReportCommentService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ReportCommentService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
