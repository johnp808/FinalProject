import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-user-op',
  templateUrl: './user-op.component.html',
  styleUrls: ['./user-op.component.css']
})
export class UserOpComponent implements OnInit {
  isLogin: boolean = false;
  role: string = '';
  userList: User[] = [];

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
    if(this.isLogin){
      this.role = this.authService.currUser.role;
    }
  }

  reloadUsers(): void{
    this.authService.index().subscribe(
      users => {
        this.userList = users;
        console.log(this.userList);
      },
      fail => {
        console.error('UserListComponent.reloadUsers(): error getting user list');
        console.log(fail);
      }
    );
  }

  reverse(user: User){
    this.authService.reverse(user).subscribe(
      users => {
        this.reloadUsers();
      },
      fail => {
        console.error('UserListComponent.reverse(): error reversing enabled');
        console.log(fail);
      }
    );
  }

}
