import { Beach } from "./beach";
import { User } from "./user";

export class Location {
  id: number;
  street: string;
  city: string;
  state: string;
  zip: string;

  constructor(
    id: number = 0,
    street: string = '',
    city: string = '',
    state: string = '',
    zip: string = ''
  ){
    this.id = id;
    this.street = street;
    this.city = city;
    this.state = state;
    this.zip = zip;
  }
}
