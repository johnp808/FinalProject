import { Report } from "./report"

export class ReportComment {
  id: number;
  comment: string;
  commentDate: string;
  report: Report;
  // user: User;

  constructor(
    id:number = 0,
    comment: string = '',
    commentDate: string = '',
    report: Report = new Report(),
    // user: User = new user()
  ){
    this.id = id;
    this.comment = comment;
    this.commentDate = commentDate;
    this.report = report;
    // this.user = user;
  }
}
