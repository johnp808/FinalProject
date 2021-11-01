
export class Beach {
  id: number;
  name: String;
  description: String;
  defaultImage: String;
  locationId: number;
  operational: boolean;
  petFriendly: String;
  parkingAvailable: String;
  priceOfAdmissions: String;
  hours: String;
  enabled: boolean;
  rating: number;

  constructor(
    id: number = 0,
    name: String = '',
    description: String = '',
    defaultImage: String = '',
    locationId: number = 0,
    operational: boolean = true,
    petFriendly: String = '',
    parkingAvailable: String = '',
    priceOfAdmissions: String = '',
    hours: String = '',
    enabled: boolean = true,
    rating: number = 0

  ){
    this.id = id;
    this.name = name;
    this.description = description;
    this.defaultImage = defaultImage;
    this.locationId = locationId;
    this.operational = operational;
    this.petFriendly = petFriendly;
    this.parkingAvailable = parkingAvailable;
    this.priceOfAdmissions = priceOfAdmissions;
    this.hours = hours;
    this.enabled = enabled;
    this.rating = rating;
  }
}
