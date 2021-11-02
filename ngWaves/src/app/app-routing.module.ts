import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { ShowBeachComponent } from './components/home/show-beach/show-beach.component';
import { ShowReportsComponent } from './components/home/show-reports/show-reports.component';
import { CreateComponent } from './components/create/create.component';
import { CreateReportComponent } from './components/create/create-report/create-report.component';
// import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
//import { ReportCommentComponent } from './components/report-comment/report-comment.component';
import { FilloutComponent } from './components/login/fillout/fillout.component';
import { ExitComponent } from './components/logout/exit/exit.component';
import { RegisterComponent } from './components/login/register/register.component';
import { MaintainComponent } from './components/maintain/maintain.component';
import { UserOpComponent } from './components/maintain/user-op/user-op.component';
import { BeachOpComponent } from './components/maintain/beach-op/beach-op.component';
//import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';
import { SearchBeachComponent } from './components/home/search-beach/search-beach.component';
import { SearchRatingComponent } from './components/home/search-rating/search-rating.component';
import { SearchDistanceComponent } from './components/home/search-distance/search-distance.component';

const routes: Routes = [
  {path:'login', component:LoginComponent,
   children: [
     {path:'fillout', component:FilloutComponent},
     {path:'register', component:RegisterComponent},
     {path:'**', component:FilloutComponent}
    ]
  },

  {path:'logout', component:LogoutComponent,
   children: [
     {path:'exit', component:ExitComponent},
     {path:'**', component:ExitComponent}
   ]
  },

  {path:'home', component:HomeComponent,
   children:[
    {path:'showbeach', component:ShowBeachComponent},
    {path:'showreport', component:ShowReportsComponent},
    {path:'searchbeach', component:SearchBeachComponent},
    {path:'searchrating', component:SearchRatingComponent},
    {path:'searchdistance', component:SearchDistanceComponent},
    {path:'**', component:ShowReportsComponent},
   ]
  },

  {
   path:'create', component:CreateComponent,
   children:[
    //{path:'createweather', component:CreateWeatherComponent},
    {path:'createreport', component:CreateReportComponent},
    {path:'**', component:CreateReportComponent},
   ]
  },

  {
    path:'maintain', component:MaintainComponent,
    children:[
      {path:'userop', component:UserOpComponent},
      {path:'beachop', component:BeachOpComponent},
      {path:'**', component:UserOpComponent}
    ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, {useHash: true})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
