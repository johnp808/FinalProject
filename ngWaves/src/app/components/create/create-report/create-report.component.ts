import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';
import { Report } from 'src/app/models/report';
import { User } from 'src/app/models/user';
import { Weather } from 'src/app/models/weather';
import { AuthService } from 'src/app/services/auth.service';
import { BeachService } from 'src/app/services/beach.service';
import { ReportService } from 'src/app/services/report.service';
import { WeatherService } from 'src/app/services/weather.service';


@Component({
  selector: 'app-create-report',
  templateUrl: './create-report.component.html',
  styleUrls: ['./create-report.component.css']
})
export class CreateReportComponent implements OnInit {
  isLogin: boolean = false;
  user: User = new User();
  favorites: Beach[] = [];
  selected: Beach | null = null;
  isFavorite: boolean = false;
  thisBeachPosts: Weather [] = [];
  reports: Report[] = [];
  beaches: Beach[] = [];
  thisBeachReports: Report [] = [];
  newBeach: Beach | null = new Beach();
  editBeach: Beach | null = null;
  report: Report | null = null;
  newWeather: Weather = new Weather();
  editWeather: Weather | null = null;
  newReport: Report = new Report();
  editReport: Report | null = null;
  beachReport: Report | null = null;
  keyword:string = '';
  keywordSearched: boolean = false;
  ratingSearched: boolean = false;





  constructor(
    private beachService: BeachService,
    private authService: AuthService,
    private weatherService: WeatherService,
    private reportService: ReportService
  ) { }

  ngOnInit(): void {
    this.isLogin = this.authService.checkLogin();
    this.user = this.authService.currUser;
    this.loadFavorites();
    this.reloadReports();
  }
  toggleFavorite(beach: Beach): void {
    this.isFavorite = !this.isFavorite;
    if(!this.isFavorite){
      this.authService.destroyFavorites(beach.id).subscribe(
        deleteFav => {
          this.isFavorite= false;
          // this.reloadWeatherPosts();
        },
        fail => {
          console.error('Error deleting Favorite');
          console.log(fail);
        }

      );
    } else{
      this.authService.addFavorites(beach).subscribe(
        addFav => {
          this.isFavorite= true;
          // this.reloadWeatherPosts();
        },
        fail => {
          console.error('Error adding Favorite');
          console.log(fail);
        }

      );
    }
  }
loadFavorites(): void {
  this.authService.getFavorites().subscribe(
    beachList => {
      this.favorites = beachList;
    },
    fail => {
      console.log('Error loading favorites');
    }
  );
}
displayBeach(beach: Beach): void {
  if(this.authService.checkLogin()){
  this.authService.getFavorites().subscribe(
    beachList => {
      this.selected = beach;
      this.reloadWeatherPosts();
      this.reloadReports();
      console.log("this beach's id:" + this.selected.id);
      this.isFavorite = false;
      beachList.forEach(b => {
        if(b.id === this.selected?.id){
          this.isFavorite = true;
        }
      });
    },
    fail => {
      console.error('homeComponent.reloadBeachess(): error getting beach list');
      console.log(fail);
    }
  );
} else{
  this.selected = beach;
      this.reloadWeatherPosts();

}
}
reloadBeaches(): void {
  this.beachService.index().subscribe(
    beachList => {
      this.beaches = beachList;
      // this.reloadWeatherPosts();
    },
    fail => {
      console.error('homeComponent.reloadBeachess(): error getting beach list');
      console.log(fail);
    }
  );
}
reloadBeachByKeyword(): void {
  this.beachService.getBeachesByKeyword(this.keyword).subscribe(
    beachList => {
      this.beaches = beachList;
      // this.reloadWeatherPosts();
    },
    fail => {
      console.error('homeComponent.reloadBeachess(): error getting beach list');
      console.log(fail);
    }
  );
}

//getBeachesByRating()
reloadBeachByRating(): void {
  this.beachService.getBeachesByRating().subscribe(
    beachList => {
      this.beaches = beachList;
      // this.reloadWeatherPosts();
    },
    fail => {
      console.error('homeComponent.reloadBeaches(): error getting beach list');
      console.log(fail);
    }
  );
}
displayBeaches(){
  this.selected = null;
  this.thisBeachPosts = [];
}
// Location Section

getLocation(){
  if(this.selected){
    this.selected.location.id
  }
}
reloadWeatherPosts(): void {
  if(this.selected){
    this.weatherService.beachWeather(this.selected.id).subscribe(
      (weatherList) => {
        this.thisBeachPosts = weatherList;

      },
      (fail) => {
        console.error('Component.reloadWeather(): error getting Weather posts');
        console.error(fail);
      }
    );
  }
}
reloadReports(): void {
    if(this.selected){
      this.reportService.beachReport(this.selected.id).subscribe(
        (reportList) => {
          this.reports = reportList;
        },
        (fail) => {
          console.error('Component.reloadWeather(): error getting Report posts');
          console.error(fail);
        }
      );
    }
}
addWeather(weather: Weather) {
  if(this.selected){
  this.newWeather.beach = this.selected;
  console.log('Adding Weather'+this.newWeather);
  console.log(JSON.stringify(this.newWeather));
    this.weatherService.create(this.newWeather, this.selected.id).subscribe(
      (newTo): void => {

        this.reloadWeatherPosts();
        this.newWeather= weather;
      },
      (nojoy) => {
        console.error('Error creating Weather Post');
        console.error(nojoy);
      }
    );
  }
}

//Report Section

setEditReport() {
  this.editReport = Object.assign({}, this.beachReport);
}

displayTable() {
  this.beachReport = null;
}

getReportCount(): number {
  return this.reports.length;
  // return this.incompletePipe.transform(this.todos).length;
}

displayReport(reports : Report) {
  this.beachReport = reports;
}


addReport(report: Report) {
  if(this.selected){
    this.newReport.beach = this.selected;
    console.log('Adding Report'+this.newReport);
    console.log(JSON.stringify(this.newReport));
    this.reportService.create(this.newReport).subscribe(
      (newTo): void => {

        // this.newReport.created =
        this.reloadReports();
        this.newReport = new Report();
      },
      (nojoy) => {
        console.error('Error creating Report Post');
        console.error(nojoy);
      }
    );
  }
}

updateReport(report: Report, showReport = true): void {
  this.reportService.update(report).subscribe(
    (updated) => {
      this.reloadReports();
      this.editReport = null;
      // this.beachReports = updated;
    },
    (fail) => {
      console.error('Error updating Report Post');
      console.error(fail);
    }
  );
}

deleteReport(id: number): void {
  this.reportService.destroy(id).subscribe(
    (good) => {
      this.reloadReports();
    },
    (evil) => {
      console.error('ListComponent.deleteReport(); error deleting report');
      console.error(evil);
    }
  );
}

//getBeachesByKeyword


}
