import { Beach } from "./beach";
import { User } from "./user";

export class Report {
  id: number;
  comment: string;
  image: string;
  rating: number;
  created: string;
  enabled: boolean;
  user: User;
  beach: Beach;

  constructor(
    id: number = 0,
    comment: string = '',
    image: string = '',
    rating: number = 0,
    created: string = '',
    enabled: boolean = false,
    user: User = new User(),
    beach: Beach = new Beach()
  ){
    this.id = id;
    this.comment = comment;
    this.image = image;
    this.rating = rating;
    this.created = created;
    this.enabled = enabled;
    this.user = user;
    this.beach = beach;
  }
}
