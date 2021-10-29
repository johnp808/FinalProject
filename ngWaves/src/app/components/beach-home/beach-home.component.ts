import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';

@Component({
  selector: 'app-beach-home',
  templateUrl: './beach-home.component.html',
  styleUrls: ['./beach-home.component.css']
})
export class BeachHomeComponent implements OnInit {

  title = 'Waves';

  beaches: Beach[] = [];

  selected: Beach | null = null;
  newBeach: Beach | null = new Beach();
  editBeach: Beach | null = null;

  constructor() { }

  ngOnInit(): void {
  }

}
