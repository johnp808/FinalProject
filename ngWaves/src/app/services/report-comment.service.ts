import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { ReportComment } from '../models/report-comment';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';


@Injectable({
  providedIn: 'root'
})
export class ReportCommentService {
  private baseUrl = environment.baseUrl;
  private url = this.baseUrl + 'api/auth/report/comment/{reportId}';
  constructor(private http: HttpClient) { }

  index(): Observable<ReportComment[]> {
    return this.http.get<ReportComment[]>(this.url + '?sorted=true').pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('ReportCommentService.index(): Error retrieving Pokemon');
      })
    );
  }

  create(rComment: ReportComment) {
    return this.http.post(this.url, rComment).pipe(
    catchError((err: any) => {
      console.log(err);
      return throwError('ReportCommentService.index(): Error creating Report Comment');
    })
  );
  }
}
