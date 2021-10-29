import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class BeachService {

  private baseUrl = environment.baseUrl;
  private url = this.baseUrl + 'api/todos';

  constructor() { }
}
