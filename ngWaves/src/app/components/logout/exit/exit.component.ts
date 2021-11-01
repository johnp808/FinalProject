import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-exit',
  templateUrl: './exit.component.html',
  styleUrls: ['./exit.component.css']
})
export class ExitComponent implements OnInit {
  isLogin: boolean = true;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {

  }

  logout(){
    this.authService.logout();
    this.isLogin = this.authService.checkLogin();
  }
}
