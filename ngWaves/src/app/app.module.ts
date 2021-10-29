import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
//import { MatSliderModule } from '@angular/material/slider';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { RegisterComponent } from './components/register/register.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { BeachHomeComponent } from './components/beach-home/beach-home.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomeComponent } from './components/home/home.component';
import { ShowBeachComponent } from './components/home/show-beach/show-beach.component';
import { ShowReportsComponent } from './components/home/show-reports/show-reports.component';
import { CreateComponent } from './components/create/create.component';
import { CreateReportComponent } from './components/create/create-report/create-report.component';
import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';

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
    CreateWeatherComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    //MatSliderModule,
    BrowserAnimationsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
