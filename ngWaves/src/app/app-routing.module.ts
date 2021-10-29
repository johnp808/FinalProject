import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './components/home/home.component';
import { ShowBeachComponent } from './components/home/show-beach/show-beach.component';
import { ShowReportsComponent } from './components/home/show-reports/show-reports.component';
import { CreateComponent } from './components/create/create.component';
import { CreateReportComponent } from './components/create/create-report/create-report.component';
import { CreateWeatherComponent } from './components/create/create-weather/create-weather.component';

const routes: Routes = [
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
    {path:'createreport', component:CreateReportComponent},
    {path:'**', component:CreateReportComponent},
   ]
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
