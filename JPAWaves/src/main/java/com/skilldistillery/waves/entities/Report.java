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

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String comment;
	private String image;
	private Integer rating;
	@CreationTimestamp
	private LocalDateTime created;
	private Boolean enabled;
	
	@JsonIgnoreProperties({"reportPosts"})
	@ManyToOne
	@JoinColumn(name = "beach_id")
	private Beach beach;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@JsonIgnore
	@OneToMany(mappedBy="report")
	private List<ReportComment> reportComments;
	
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
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
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
	public List<ReportComment> getReportComments() {
		return reportComments;
	}
	public void setReportComments(List<ReportComment> reportComments) {
		this.reportComments = reportComments;
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
