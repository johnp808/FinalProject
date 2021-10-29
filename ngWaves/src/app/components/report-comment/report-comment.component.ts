import { Component, OnInit } from '@angular/core';
import { ReportComment } from 'src/app/models/report-comment';
import { ReportCommentService } from 'src/app/services/report-comment.service';

@Component({
  selector: 'app-report-comment',
  templateUrl: './report-comment.component.html',
  styleUrls: ['./report-comment.component.css']
})
export class ReportCommentComponent implements OnInit {

  reportComments: ReportComment [] = [];
  selected: ReportComment | null = null;
  newReportComment: ReportComment = new ReportComment();

  constructor(
    private reportCommentService: ReportCommentService
  ) { }

  ngOnInit(): void {
    this.loadReportComment();
  }

  loadReportComment(): void {
    this.reportCommentService.index().subscribe(
    data=>{
      this.reportComments = data;
    }, err=>{
      console.error('Error retreieving report comment list');
      console.error(err);
    }
    );
      }

      displayTable() {
    this.selected = null;
      }

      displayReportComment(rComment: ReportComment): void {
        this.selected = rComment;
      }

      addReportComment(rComment: ReportComment) {
        console.log(rComment);
        this.reportCommentService.create(rComment).subscribe(
          created=>{
    console.log('ReportCommentListComponenet.addReportComment(): created Report Comment');
    console.log(created);
    this.loadReportComment();
          },
          failed=>{
            console.error('ReportCommentListComponenet.addReportComment(): Error Creating Report Comment')
          }
        );
        this.loadReportComment();
        this.newReportComment = new ReportComment();
      }

}
