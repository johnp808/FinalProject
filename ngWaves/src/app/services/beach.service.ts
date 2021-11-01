import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { HttpClient } from '@angular/common/http';
import { Beach } from '../models/beach';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class BeachService {

  private baseUrl = environment.baseUrl;
  private url = this.baseUrl + 'api/beaches';

  constructor(private http: HttpClient,
    private auth: AuthService) { }

    index(): Observable<Beach[]> {
      return this.http.get<Beach[]>(this.url, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('BeachService.index(): Error retrieving beach list');
        })
      );
    }

    show(beachId: number): Observable<Beach> {
      return this.http.get<Beach>(this.url + '/' + beachId, this.getHttpOptions()).pipe(
        catchError((err: any) => {
          console.log(err);
          return throwError('BeachService.show(): Error retrieving beach');
        })
      );
    }

    getHttpOptions(){
      let credentials = this.auth.getCredentials();
      let options = {
        headers: {
          'X-Requested-With': 'XMLHttpRequest',
          // 'Authorization':`Basic ${credentials}`
        }
      };
      return options;
    }
}

