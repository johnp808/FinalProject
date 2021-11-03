import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-exit',
  templateUrl: './exit.component.html',
  styleUrls: ['./exit.component.css']
})
export class ExitComponent implements OnInit {
  isLogin: boolean = true;
  isLogout: boolean = false;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
  }

  logout(){
    this.authService.logout();
    this.isLogout = true;
  }
}
