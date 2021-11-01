import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { WeatherService } from 'src/app/services/weather.service';
import { Weather } from 'src/app/models/weather';
import { BeachService } from 'src/app/services/beach.service';
import { Beach } from 'src/app/models/beach';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-create-weather',
  templateUrl: './create-weather.component.html',
  styleUrls: ['./create-weather.component.css']
})
export class CreateWeatherComponent implements OnInit {
title = 'Post a weather Comment';
posts: Weather[] = [];
  beaches: Beach[]= [];
  newWeather: Weather = new Weather();
  editWeather: Weather | null = null;
  selected: Weather | null = null;
  showComplete = false;
  setEditWeather() {
    this.editWeather = Object.assign({}, this.selected);
  }


  constructor(
    private weatherService: WeatherService,
    private route: ActivatedRoute,
    private router: Router,
    private beachService: BeachService,
    private authService: AuthService


    ) { }
    displayTable() {
      this.selected = null;
    }
    getWeatherCount(): number {
      return this.posts.length;
      // return this.incompletePipe.transform(this.todos).length;
    }
    displayWeather(weather: Weather) {
      this.selected = weather;
    }

    ngOnInit(): void {

      // let weatherIdString = this.route.snapshot.paramMap.get('id');
      // if (weatherIdString) {
      //   let weatherId = Number.parseInt(weatherIdString);
      //   if (!isNaN(weatherId)) {
      //     this.weatherService.show(weatherId).subscribe(
      //       (weather) => {
      //         this.reloadPosts();
      //         this.selected = weather;
      //       },
      //       (problem) => {
      //         console.error('Invalid Todo ID ' + weatherId);
      //         this.router.navigateByUrl('notfound');
      //       }
      //     );
      //   } else {
      //     console.error('Invalid Weather ID ' + weatherIdString);
      //     this.router.navigateByUrl('notfound');
      //   }
      // }
      this.reloadPosts();
      this.isLogin = this.authService.checkLogin();
    }
    reloadPosts(): void {
      this.weatherService.index().subscribe(
        (weatherList) => {
          this.posts = weatherList;
        },
        (fail) => {
          console.error('Component.reloadWeather(): error getting Weather posts');
          console.error(fail);
        }
      );
    }

    deleteWeather(id: number): void {
      this.weatherService.destroy(id).subscribe(
        (good) => {
          this.reloadPosts();
        },
        (evil) => {
          console.error('ListComponent.deleteWeather(); error deleting weather');
          console.error(evil);
        }
      );
    }
    updateWeather(weather: Weather, showWeather = true): void {
      this.weatherService.update(weather).subscribe(
        (updated) => {
          this.reloadPosts();
          this.editWeather = null;
          // this.selected = updated;
        },
        (fail) => {
          console.error('Error updating Weather Post');
          console.error(fail);
        }
      );
    }
    addWeather(weather: Weather) {
      console.log('Adding Weather'+this.newWeather);
      console.log(JSON.stringify(this.newWeather));
      this.weatherService.create(this.newWeather).subscribe(
        (newTo): void => {

          this.reloadPosts();
          this.newWeather= weather;
        },
        (nojoy) => {
          console.error('Error creating Weather Post');
          console.error(nojoy);
        }
      );
    }
  isLogin: boolean = false;

  }
