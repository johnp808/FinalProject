import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { BeachHomeComponent } from './components/beach-home/beach-home.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomeComponent } from './components/home/home.component';
import { ShowBeachComponent } from './components/home/show-beach/show-beach.component';
import { ShowReportsComponent } from './components/home/show-reports/show-reports.component';
import { CreateComponent } from './components/create/create.component';
import { CreateReportComponent } from './components/create/create-report/create-report.component';
import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';
import { FilloutComponent } from './components/login/fillout/fillout.component';
import { AuthService } from './services/auth.service';
import { FormsModule } from '@angular/forms';
import { ExitComponent } from './components/logout/exit/exit.component';
import { RegisterComponent } from './components/login/register/register.component';
import { MaintainComponent } from './components/maintain/maintain.component';
import { UserOpComponent } from './components/maintain/user-op/user-op.component';
import { BeachOpComponent } from './components/maintain/beach-op/beach-op.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    LogoutComponent,
    RegisterComponent,
    NavigationComponent,
    BeachHomeComponent,
    HomeComponent,
    ShowBeachComponent,
    ShowReportsComponent,
    CreateComponent,
    CreateReportComponent,
    CreateWeatherComponent,
    FilloutComponent,
    ExitComponent,
    RegisterComponent,
    MaintainComponent,
    UserOpComponent,
    BeachOpComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    BrowserAnimationsModule,
    HttpClientModule
  ],
  providers: [
    AuthService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
