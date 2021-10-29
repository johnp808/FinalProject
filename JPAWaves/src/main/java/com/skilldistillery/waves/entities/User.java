package com.skilldistillery.waves.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;
	
	private String password;
	
	private Boolean enabled;
	
	private String role;
	
	private String email;
	
	@Column (name ="profile_image")
	private String profileImage;
	
	@ManyToOne
    @JoinColumn(name="location_id")
    private Location location;
	
	@OneToMany(mappedBy="user")
	private List<Weather> weather;
	
	@OneToMany(mappedBy="user")
	private List<WeatherComment> weatherComments;
	
	@OneToMany(mappedBy="user")
	private List<ReportComment> reportComments;
	
	@OneToMany(mappedBy="user")
	private List<Report> reports;
	
	@ManyToMany
	 @JoinTable(name="favorites",
	 joinColumns = @JoinColumn(name="user_id"),
	 inverseJoinColumns = @JoinColumn(name="beach_id"))
	@JsonIgnoreProperties({"favoritedUsers"})
	 private List<Beach> beachFavorites;


	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Weather> getWeather() {
		return weather;
	}

	public void setWeather(List<Weather> weather) {
		this.weather = weather;
	}

	public List<WeatherComment> getWeatherComments() {
		return weatherComments;
	}

	public void setWeatherComments(List<WeatherComment> weatherComments) {
		this.weatherComments = weatherComments;
	}

	public List<ReportComment> getReportComments() {
		return reportComments;
	}

	public void setReportComments(List<ReportComment> reportComments) {
		this.reportComments = reportComments;
	}

	public List<Report> getReports() {
		return reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}

	public List<Beach> getBeachFavorites() {
		return beachFavorites;
	}

	public void setBeachFavorites(List<Beach> beachFavorites) {
		this.beachFavorites = beachFavorites;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + "]";
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
		User other = (User) obj;
		return id == other.id;
	}

}
