import { DatePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Report } from '../models/report';
import { AuthService } from './auth.service';
import { BeachService } from './beach.service';

@Injectable({
  providedIn: 'root'
})
export class ReportService {
  private url = environment.baseUrl + 'api/reports';

  constructor(
private http: HttpClient,
private beachService: BeachService,
private router: Router,
private auth: AuthService,
// private dataPipe: DatePipe
  ) { }

  index(): Observable<Report[]> {
    return this.http.get<Report[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'ReportService.index(): Error retrieving Report list'
        );
      })
    );
  }
  show(reportId: number): Observable<Report> {
    return this.http
      .get<Report>(this.url + '/' + reportId, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('ReportService.show(): Error retrieving todo');
        })
      );
  }
  create(report: Report): Observable<Report> {

    return this.http
      .post<Report>(this.url+'/'+ report.beach.id, report, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'ReportService.create(): Error creating list: reportservice.ts'
          );
        })
      );
  }
  update(report: Report) {
    return this.http
      .get(`${this.url}/${report.id}`, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('ReportService.index(): Error updating todo');
        })
      );
  }
  destroy(id: number) {
    return this.http.delete(`${this.url}/${id}`, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'ReportService.index(): Error deleting report with id'
        );
      })
    );
  }
  getHttpOptions() {
    let credentials = this.auth.getCredentials();
    let options = {
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
       Authorization: `Basic ${credentials}`,
      },
    };
    return options;
  }
}
