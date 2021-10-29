import { Component, OnInit } from '@angular/core';
import { WeatherService } from 'src/app/services/weather.service';
import { FormBuilder } from '@angular/forms';

@Component({
  selector: 'app-create-weather',
  templateUrl: './create-weather.component.html',
  styleUrls: ['./create-weather.component.css']
})
export class CreateWeatherComponent implements OnInit {

  constructor(
    private weatherService: WeatherService,
    private formBuilder: FormBuilder,
    ) { }

  ngOnInit(): void {
  }

}
