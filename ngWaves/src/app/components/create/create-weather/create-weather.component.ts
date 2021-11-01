import { Component, OnInit } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-create-weather',
  templateUrl: './create-weather.component.html',
  styleUrls: ['./create-weather.component.css']
})
export class CreateWeatherComponent implements OnInit {
  isLogin: boolean = false;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
  }

}
