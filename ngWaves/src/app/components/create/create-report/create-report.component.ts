import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Beach } from 'src/app/models/beach';
import { Report } from 'src/app/models/report';
import { AuthService } from 'src/app/services/auth.service';
import { BeachService } from 'src/app/services/beach.service';
import { ReportService } from 'src/app/services/report.service';

@Component({
  selector: 'app-create-report',
  templateUrl: './create-report.component.html',
  styleUrls: ['./create-report.component.css']
})
export class CreateReportComponent implements OnInit {
  isLogin: boolean = false;
  reports: Report[] = [];
  beaches: Beach[] = [];
  newReport: Report = new Report();
  editReport: Report | null = null;
  selected: Report | null = null;

  constructor(
    private ReportService: ReportService,
    private route: ActivatedRoute,
    private router: Router,
    private beachService: BeachService,
    private authService: AuthService

  ) { }
  setEditReport() {
    this.editReport = Object.assign({}, this.selected);
  }
  displayTable() {
    this.selected = null;
  }
  getReportCount(): number {
    return this.reports.length;
    // return this.incompletePipe.transform(this.todos).length;
  }
  displayReport(reports : Report) {
    this.selected = reports;
  }
  reloadReports(): void {
    this.ReportService.index().subscribe(
      (reportList) => {
        this.reports = reportList;
      },
      (fail) => {
        console.error('Component.reloadReport(): error getting report posts');
        console.error(fail);
      }
    );
  }
  ngOnInit(): void {
    this.reloadReports();
    this.isLogin = this.authService.checkLogin();
  }


addReport(report: Report) {
  console.log('Adding Report'+this.newReport);
  console.log(JSON.stringify(this.newReport));
  this.ReportService.create(this.newReport).subscribe(
    (newTo): void => {

      // this.newReport.created =
      this.reloadReports();
      this.newReport= report;
    },
    (nojoy) => {
      console.error('Error creating Report Post');
      console.error(nojoy);
    }
  );
}
updateReport(report: Report, showReport = true): void {
  this.ReportService.update(report).subscribe(
    (updated) => {
      this.reloadReports();
      this.editReport = null;
      // this.selected = updated;
    },
    (fail) => {
      console.error('Error updating Report Post');
      console.error(fail);
    }
  );
}
deleteReport(id: number): void {
  this.ReportService.destroy(id).subscribe(
    (good) => {
      this.reloadReports();
    },
    (evil) => {
      console.error('ListComponent.deleteReport(); error deleting report');
      console.error(evil);
    }
  );
}
}
