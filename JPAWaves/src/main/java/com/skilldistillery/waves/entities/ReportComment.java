package com.skilldistillery.waves.entities;

import java.time.LocalDateTime;
import java.util.Objects;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="report_comment")
public class ReportComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	@Column(name="comment_date")
	private LocalDateTime commentDate;
	
	@ManyToOne
	@JoinColumn(name = "report_id")
	private Report report;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	public ReportComment() {
		super();
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(LocalDateTime commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReportComment other = (ReportComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "ReportComment [id=" + id + ", comment=" + comment + ", commentDate=" + commentDate + "]";
	}
	
}
