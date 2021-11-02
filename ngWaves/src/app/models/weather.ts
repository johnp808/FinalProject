import { Beach } from "./beach";
import { User } from "./user";

export class Weather {
  id: number;
  weatherType: string;
  description: string;
  temperatureCelsius: string;
  created: string;
  enabled: boolean;
  waveSize: string;
  user: User;
  beach: Beach;

  constructor(
    id: number = 0,
    weatherType: string = '',
    description: string = '',
    temperatureCelsius: string = "",
    created: string = '',
    enabled: boolean = false,
    waveSize: string = '',
    user: User = new User(),
    beach: Beach = new Beach()
  ){
    this.id = id;
    this.weatherType = weatherType;
    this.description = description;
    this.temperatureCelsius = temperatureCelsius;
    this.created = created;
    this.enabled = enabled;
    this.waveSize = waveSize;
    this.user = user;
    this.beach = beach;
  }

}
