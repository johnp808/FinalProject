import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { Weather } from '../models/weather';
import { catchError } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { AuthService } from './auth.service';
import { DatePipe } from '@angular/common';
import { environment } from 'src/environments/environment';
import { Beach } from '../models/beach';
import { BeachService } from './beach.service';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class WeatherService {
  //private baseUrl = environment.baseUrl;
  private url = environment.baseUrl + 'api/weather/';

  constructor(
    private http: HttpClient,
    // private datePipe: DatePipe,
    private beachService: BeachService,
    private router: Router,
    private auth: AuthService
  ) {}

  index(): Observable<Weather[]> {
    return this.http.get<Weather[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'WeatherService.index(): Error retrieving Weather list'
        );
      })
    );
  }
  show(weatherId: number): Observable<Weather> {
    return this.http
      .get<Weather>(this.url + '/' + weatherId, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('WeatherService.show(): Error retrieving todo');
        })
      );
  }
  create(weather: Weather): Observable<Weather> {
    // weather.weatherType = '';
    // weather.description = '';
    // weather.temperatureCelsius = 0;
    // weather.waveSize = '';

    return this.http
      .post<Weather>(this.url, weather+'/', this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'WeatherService.create(): Error creating list: weatherservice.ts'
          );
        })
      );
  }

  update(weather: Weather) {
    return this.http
      .get(`${this.url}/${weather.id}`, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('WeatherService.index(): Error updating todo');
        })
      );
  }
  destroy(id: number) {
    return this.http.delete(`${this.url}/${id}`, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'WeatherService.index(): Error deleting weather with id'
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
