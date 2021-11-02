import { Beach } from "./beach";
import { Location } from "./location"

export class User {
  id: number;
  email: string;
  username: string;
  password: string;
  enabled: boolean;
  role: string;
  profileImage: string;
  location: Location;
  favorites: Beach[];


  constructor(
    id: number = 0,
    email: string = '',
    username: string = '',
    password: string = '',
    enabled: boolean = true,
    role: string = '',
    profileImage: string = '',
    location: Location = new Location(),
    favorites: Beach[] = []
  ){
    this.id = id;
    this.email = email;
    this.username = username;
    this.password = password;
    this.enabled = enabled;
    this.role = role;
    this.profileImage = profileImage;
    this.location = location;
    this.favorites = favorites;
  }
}
