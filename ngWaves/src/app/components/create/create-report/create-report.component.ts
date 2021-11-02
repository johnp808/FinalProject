import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';
import { User } from 'src/app/models/user';
// import { ActivatedRoute, Router } from '@angular/router';
// import { Beach } from 'src/app/models/beach';
// import { Report } from 'src/app/models/report';
import { AuthService } from 'src/app/services/auth.service';
// import { BeachService } from 'src/app/services/beach.service';
// import { ReportService } from 'src/app/services/report.service';


@Component({
  selector: 'app-create-report',
  templateUrl: './create-report.component.html',
  styleUrls: ['./create-report.component.css']
})
export class CreateReportComponent implements OnInit {
  isLogin: boolean = false;
  user: User = new User();
  favorites: Beach[] = [];
  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
    this.user = this.authService.currUser;
    this.loadFavorites();
  }

loadFavorites(): void {
  this.authService.getFavorites().subscribe(
    beachList => {
      this.favorites = beachList;
    },
    fail => {
      console.log('Error loading favorites');
    }
  );
}

}
