import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { Weather } from '../models/weather';
import { catchError } from 'rxjs/operators';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class WeatherService {
  private baseUrl = 'https://localhost:9090/';
  private url ='api/beaches'

  getWeather() {
    throw new Error('Method not implemented.');
  }

  constructor(private http: HttpClient,
    private datePipe: DatePipe,
    private auth: AuthService) { }

    index(): Observable<Weather[]> {
      return this.http.get<Weather[]>(this.url, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'WeatherService.index(): Error retrieving todo list'
          );
        })
      )
    }
    show(weatherId: number): Observable<Weather> {
      return this.http.get<Weather>(this.url +'/' + weatherId, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'WeatherService.show(): Error retrieving todo'
          );
        })
      );
    }
  create(weather: Weather) {
    weather.weatherType = '';
    weather.description = '';
    weather.temperatureCelsius = 0;
    weather.waveSize = '';

    return this.http.post<Weather>(this.url, weather, this.getHttpOptions()).pipe(catchError((err: any) => {
      console.log(err);
      return throwError(
        'TodoService.create(): Error creating list'
      );
    })
  );
}

  // update(weather: Weather) {
  //   if(weather.completed){
  //     weather.completeDate= this.datePipe.transform(Date.now(), 'shortDate'); // 8/24/1999
  //   }
  //   else{
  //     weather.completeDate = '';
  //   }
  //   return this.http.get(`${this.url}/${todo.id}`, this.getHttpOptions()).pipe(
  //     catchError((err: any) => {
  //       console.log(err);
  //       return throwError(
  //         'TodoService.index(): Error updating todo'
  //       );
  //     })
  //   );
  // }
  destroy(id: number) {
    return this.http.delete(`${this.url}/${id}`, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'TodoService.index(): Error deleting weather with id'
        );
      })
    );
  }
  getHttpOptions(){
    let credentials = this.auth.getCredentials();
    let options ={
      headers:{
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization': `Basic ${credentials}`
      }
    };
    return options;
  }
}

