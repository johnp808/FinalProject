package com.skilldistillery.waves.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	private String image;
	private Integer rating;
	private LocalDateTime created;
	private Boolean enabled;
	
	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public List<ReportComment> getReportComments() {
		return reportComments;
	}

	public void setReportComments(List<ReportComment> reportComments) {
		this.reportComments = reportComments;
	}

	@ManyToOne
	@JoinColumn(name = "beach_id")
	private Beach beach;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy="report")
	private List<ReportComment> reportComments;
	
	
	public Report() {
		super();
	}

	public Beach getBeach() {
		return beach;
	}

	public void setBeach(Beach beach) {
		this.beach = beach;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ReportComment> getComments() {
		return reportComments;
	}

	public void setComments(List<ReportComment> comments) {
		this.reportComments = comments;
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

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}

	public LocalDateTime getCreated() {
		return created;
	}
	public void setCreated(LocalDateTime created) {
		this.created = created;
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
		Report other = (Report) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Report [id=" + id + ", comment=" + comment + ", image=" + image + ", rating=" + rating + ", created="
				+ created + "]";
	}
	
}
