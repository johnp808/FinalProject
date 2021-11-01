import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';
import { AuthService } from 'src/app/services/auth.service';
import { BeachService } from 'src/app/services/beach.service';

@Component({
  selector: 'app-beach-op',
  templateUrl: './beach-op.component.html',
  styleUrls: ['./beach-op.component.css']
})
export class BeachOpComponent implements OnInit {
  isLogin: boolean = false;
  role: string = '';
  beachList: Beach[] = [];

  constructor(
    private authService: AuthService,
    private beachService: BeachService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
    if(this.isLogin){
      this.role = this.authService.currUser.role;
    }
  }

  reloadBeaches(): void{
    this.beachService.index().subscribe(
      beaches => {
        this.beachList = beaches;
        console.log(this.beachList);
      },
      fail => {
        console.error('BeachListComponent.reloadBeaches(): error getting beach list');
        console.log(fail);
      }
    );
  }

}
