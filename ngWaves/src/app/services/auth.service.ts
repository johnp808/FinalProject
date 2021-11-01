import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError, tap } from 'rxjs/operators';
import { Observable, throwError } from 'rxjs';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private baseUrl = environment.baseUrl;
  private currUser:User = new User();

  constructor(
    private http: HttpClient
  ) { }

  login(username:string, password:string):Observable<User> {
    const credentials = this.generateBasicAuthCredentials(username, password);

    const httpOptions = {
      headers: new HttpHeaders({
        'Authorization': `Basic ${credentials}`,
        'X-Requested-With': 'XMLHttpRequest'
      })
    };

    return this.http.get<User>(this.baseUrl + 'authenticate', httpOptions)
               .pipe(
                tap((res) => {
                  localStorage.setItem('credentials' , credentials);
                  this.currUser = res;
                  return res;
                }),
                catchError((err: any) => {
                  console.log(err);
                  return throwError('AuthService.login(): Error logging in.');
                })
               );

  }

  register(user: User):Observable<User>{
    return this.http.post<User>(this.baseUrl + 'register', user)
    .pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('AuthService.register(): error registering user.');
      })
    );
  }

  logout(){
    localStorage.removeItem('credentials');
  }

  checkLogin(){
    if(localStorage.getItem('credentials')){
      return true;
    }
    return false;
  }

  generateBasicAuthCredentials(username:string, password:string) {
    return btoa(`${username}:${password}`);
  }

  getCredentials() {
    return localStorage.getItem('credentials');
  }

   //http://localhost:9090/api/auth/users/username/yanyan
   //baseUrl: 'http://localhost:9090/'
  getUserByUsername(username: string):Observable<User>{
    return this.http.get<User>(this.baseUrl + 'api/auth/users/username/' +username)
               .pipe(
                tap((res) => {
                  return res;
                }),
                catchError((err: any) => {
                  console.log(err);
                  return throwError('AuthService.getUserByUsername(): Error getting user in.');
                })
               );
  }

}
