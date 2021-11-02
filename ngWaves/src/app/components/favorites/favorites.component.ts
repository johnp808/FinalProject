import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-favorites',
  templateUrl: './favorites.component.html',
  styleUrls: ['./favorites.component.css']
})
export class FavoritesComponent implements OnInit {
  isFavorite!: boolean;
  constructor() {console.log("Data: " ); }

  ngOnInit(): void {
  }
  onClick(){
    this.isFavorite = !this.isFavorite;
    console.log('Is favorite value: ' + this.isFavorite);
  }

}
