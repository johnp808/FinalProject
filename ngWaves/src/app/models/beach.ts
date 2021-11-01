import { Location } from "./location"

export class Beach {
  id: number;
  name: String;
  description: String;
  defaultImage: String;
  operational: boolean;
  petFriendly: String;
  parkingAvailable: String;
  priceOfAdmissions: String;
  hours: String;
  enabled: boolean;
  rating: number;
  location: Location;

  constructor(
    id: number = 0,
    name: String = '',
    description: String = '',
    defaultImage: String = '',
    operational: boolean = true,
    petFriendly: String = '',
    parkingAvailable: String = '',
    priceOfAdmissions: String = '',
    hours: String = '',
    enabled: boolean = true,
    rating: number = 0,
    location: Location = new Location()

  ){
    this.id = id;
    this.name = name;
    this.description = description;
    this.defaultImage = defaultImage;
    this.operational = operational;
    this.petFriendly = petFriendly;
    this.parkingAvailable = parkingAvailable;
    this.priceOfAdmissions = priceOfAdmissions;
    this.hours = hours;
    this.enabled = enabled;
    this.rating = rating;
    this.location = location;
  }
}
