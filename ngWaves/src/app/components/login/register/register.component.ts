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
    this.checkIsRegistered(this.user);
    this.authService.register(this.user).subscribe(
      data => {
        console.log('RegisterComponent.register(): user registered.');
        if(data != null){
          this.registered = true;
        }
      },
      fail => {
        this.existed = true;
        console.error('RegisterComponent.register(): Error registering');
        console.error(fail);
      }
    );

  }

  checkIsRegistered(user: User){
    this.authService.checkRegister(user.username).subscribe(
      data => {
        this.existed = data;
        console.log(this.existed+ 'exitsted');
      },
      fail => {
        console.error('RegisterComponent.checkIsRegistered(): error checking if registered');
        console.log(fail);
      }
    );
  }


}
