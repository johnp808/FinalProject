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
  beach: Beach = new Beach();

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

  reverse(beach: Beach){
    this.authService.reverseBeach(beach).subscribe(
      users => {
        this.reloadBeaches();
      },
      fail => {
        console.error('UserComponent.reverse(): error reversing enabled');
        console.log(fail);
      }
    );
  }

  // create(){
  //   this.authService.createBeach(this.beach).subscribe(
  //     data => {
  //       console.log('BeachOpComponent.create(): Created beach');
  //       console.error(data);
  //       this.reloadBeaches();
  //       this.beach = data;
  //     },
  //     fail => {
  //       console.error('BeachOpComponent.create(): error creating beach');
  //       console.log(fail);
  //     }
  //   );
  // }
}
