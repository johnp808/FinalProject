import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { ShowBeachComponent } from './components/home/show-beach/show-beach.component';
import { ShowReportsComponent } from './components/home/show-reports/show-reports.component';
import { CreateComponent } from './components/create/create.component';
import { CreateReportComponent } from './components/create/create-report/create-report.component';
import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';
import { ReportCommentComponent } from './components/report-comment/report-comment.component';
import { FilloutComponent } from './components/login/fillout/fillout.component';

const routes: Routes = [
  {path:'login', component:LoginComponent,
   children: [
     {path:'fillout', component:FilloutComponent}
    ]
  },

  {path:'logout', component:LogoutComponent},

  {path:'home', component:HomeComponent,
   children:[
    {path:'showbeach', component:ShowBeachComponent},
    {path:'showreport', component:ShowReportsComponent},
    {path:'**', component:ShowBeachComponent},
   ]
  },

  {
   path:'create', component:CreateComponent,
   children:[
    {path:'createweather', component:CreateWeatherComponent},
    {path:'createreport', component:ReportCommentComponent},
    {path:'**', component:CreateReportComponent},
   ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
