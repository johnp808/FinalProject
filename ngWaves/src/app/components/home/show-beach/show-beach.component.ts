import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';
import { BeachService } from 'src/app/services/beach.service';

@Component({
  selector: 'app-show-beach',
  templateUrl: './show-beach.component.html',
  styleUrls: ['./show-beach.component.css']
})
export class ShowBeachComponent implements OnInit {

  ngOnInit(): void {
    this.reloadBeaches();
  }

  title = 'ngBeach';

  beaches: Beach[] = [];

  selected: Beach | null = null;
  newBeach: Beach | null = new Beach();
  editBeach: Beach | null = null;

  constructor(private beachService: BeachService) { }

  displayBeach(beach: Beach): void {
    this.selected = beach;
  }

  reloadBeaches(): void {
    this.beachService.index().subscribe(
      beachList => {
        this.beaches = beachList;
      },
      fail => {
        console.error('homeComponent.reloadBeachess(): error getting beach list');
        console.log(fail);
      }
    );
  }
}
