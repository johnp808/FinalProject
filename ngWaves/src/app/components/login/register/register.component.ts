import { Component, OnInit } from '@angular/core';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {
  user: User = new User();
  registered: boolean = false;
  existed: boolean = false;

  constructor(
    private authService: AuthService
  ) { }

  ngOnInit(): void {
  }

  register(){
    this.authService.register(this.user).subscribe(
      data => {
        console.log('RegisterComponent.register(): user registered.');
        this.registered = true;
      },
      fail => {
        console.error('RegisterComponent.register(): Error registering');
        console.error(fail);
      }
    );
  }

  checkIsRegistered(user: User){
    this.authService.  checkRegister
    (user.username).subscribe(
      data => {
        if(data != null){
          this.existed = true;
        }
      },
      fail => {
        console.error('RegisterComponent.checkIsRegistered(): error checking if registered');
        console.log(fail);
      }
    );
  }


}
