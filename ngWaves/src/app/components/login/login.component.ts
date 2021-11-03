import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  isLogin: boolean = false;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit() {
    this.checkLogin();
  }
  checkLogin(){
    this.isLogin = this.authService.checkLogin();
  }

  loggedIn(): boolean{
    return this.authService.checkLogin();
  }
}
