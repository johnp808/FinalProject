import { Weather } from "./weather";

export class WeatherComment {
  id: number;
  comment: string;
  commentDate: string;
  // user: User;
  weather: Weather;

  constructor(
    id: number = 0,
    comment: string = '',
    commentDate: string = '',
    // user: User = new user(),
    weather: Weather = new Weather()
  ){
    this.id = id;
    this.comment = comment;
    this.commentDate = commentDate;
    // this.user = user;
    this.weather = weather;
  }
}
