import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-fillout',
  templateUrl: './fillout.component.html',
  styleUrls: ['./fillout.component.css']
})
export class FilloutComponent implements OnInit {
  user: User = new User();
  isLogin: boolean = false;
  existed: boolean = true;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {

  }

  login(){
    this.authService.login(this.user.username, this.user.password).subscribe(
      data => {
        this.user = data;
        if(this.user != null){
          this.checkLogin();
          this.existed = true;
        }
      },
      fail => {
        this.existed = false;
        console.error('filloutComponent.login(): Error login');
        console.log(fail);
      }
    );

  }

  checkLogin(){
    this.isLogin = this.authService.checkLogin();
  }



}
