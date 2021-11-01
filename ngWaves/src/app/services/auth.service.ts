import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { catchError, tap } from 'rxjs/operators';
import { Observable, throwError } from 'rxjs';
import { User } from '../models/user';
import { Beach } from '../models/beach';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private baseUrl = environment.baseUrl;
  public currUser:User = new User();

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
    this.currUser = new User();
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

  getUserByUsername(username: string):Observable<User>{
    return this.http.get<User>(this.baseUrl + 'api/users/username/' +username)
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
  //("auth/users/checkusername/{username}")
  checkRegister(username: string):Observable<User>{
    return this.http.get<User>(this.baseUrl + 'api/users/checkusername/' +username)
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

  //"auth/users"
  index(): Observable<User[]>{
    return this.http.get<User[]>(this.baseUrl+'api/users').pipe(
      catchError((err: any) => {
        console.error(err);
        return throwError('userService.index(): Error retrieving user list');
      })
    );
  }


  //"auth/update/{userId}"
  reverse(user: User): Observable<User>{
    user.enabled = !user.enabled;
    return this.http.put<User>(this.baseUrl+`api/auth/update/${user.id}`, user, this.getHttpOptions()).pipe(
      catchError((err : any) => {
        console.error(err);
        return throwError('UserService.update(): Error updating user');
      })
    );
  }

  //("auth/beaches/{bid}")
  reverseBeach(beach: Beach): Observable<Beach>{
    beach.enabled = !beach.enabled;
    return this.http.put<Beach>(this.baseUrl+`api/auth/beaches/${beach.id}`, beach, this.getHttpOptions()).pipe(
      catchError((err : any) => {
        console.error(err);
        return throwError('BeachService.update(): Error updating beach');
      })
    );
  }

  //("auth/beaches/location")
  createBeach(beach: Beach):  Observable<Beach>{
    console.log(beach);
    return this.http.post<Beach>(this.baseUrl+'api/auth/beaches/location', beach, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.log(err);
        return throwError('Beach create err!');
      })
    );
  }

  getHttpOptions(){
    let credentials = this.getCredentials();
    let options = {
      headers: {
        'X-Requested-With': 'XMLHttpRequest',
        'Authorization':`Basic ${credentials}`
      }
    };
    return options;
  }

}
