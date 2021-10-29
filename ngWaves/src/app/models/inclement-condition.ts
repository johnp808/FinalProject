export class InclementCondition {
  id: number;
  name: String;
  description: String;
  constructor(
    id: number = 0,
    name: String = '',
    description: String = ''
  ){
    this.id = id;
    this.name = name;
    this.description = description;
  }
}
