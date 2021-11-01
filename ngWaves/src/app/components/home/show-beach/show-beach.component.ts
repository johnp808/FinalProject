import { Component, OnInit } from '@angular/core';
import { Beach } from 'src/app/models/beach';
import { Report } from 'src/app/models/report';
import { BeachService } from 'src/app/services/beach.service';
import { ReportService } from 'src/app/services/report.service';

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
  reports: Report[] = [];

  selected: Beach | null = null;
  newBeach: Beach | null = new Beach();
  editBeach: Beach | null = null;
  report: Report | null = null;

  constructor(private beachService: BeachService,
    private reportService: ReportService)
    {

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

  displayBeach(beach: Beach): void {
    this.selected = beach;
  }

  // displayReport(report:Report): Report beachReport {
  //   this.report = beachReport
  // }


}
