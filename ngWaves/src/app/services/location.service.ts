import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Location } from '../models/location';
import { AuthService } from './auth.service';
import { BeachService } from './beach.service';

@Injectable({
  providedIn: 'root'
})
export class LocationService {

  private url = environment.baseUrl + 'api/location';
  constructor(
    private http: HttpClient,
    private beachService: BeachService,
    private router: Router,
    private auth: AuthService,
    private location: Location
  ) { }

  index(): Observable<Location[]> {
    return this.http.get<Location[]>(this.url).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'LocationService.index(): Error retrieving Location list'
        );
      })
    );
  }

  beachLocation(beachId: Number): Observable<Location[]> {
    return this.http.get<Location[]>(this.url + '/' + beachId).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'LocationService.index(): Error retrieving Location list'
        );
      })
    );
  }

  show(locationId: number): Observable<Location> {
    return this.http
      .get<Location>(this.url + '/' + locationId, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('LocationService.show(): Error retrieving Location');
        })
      );
  }
  create(location: Location, beachId: Number): Observable<Location> {
    return this.http
      .post<Location>(this.url+'/'+ beachId, location, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError(
            'LocationService.create(): Error creating list: Locationservice.ts'
          );
        })
      );
  }

  update(location: Location) {
    return this.http
      .get(`${this.url}/${location.id}`, this.getHttpOptions())
      .pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('LocationService.index(): Error updating Location');
        })
      );
  }
  destroy(id: number) {
    return this.http.delete(`${this.url}/${id}`, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError(
          'LocationService.index(): Error deleting Location with id' + this.location.id
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
