package com.skilldistillery.waves.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Beach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@Column(name = "default_image")
	private String defaultImage;
	private Boolean enabled;
	private boolean operational;
	private Double rating;
	private String hours;

	@Column(name = "pet_friendly")
	private String petFriendly;

	@Column(name = "parking_available")
	private String parkingAvailable;

	@Column(name = "price_of_admission")
	private String priceOfAdmission;
	
	@ManyToMany(mappedBy="beaches")
	private List<BeachSetting> beachSettings;
	
	@ManyToMany(mappedBy="beaches")
	private List<InclementCondition> inclementConditions;
	
	@OneToOne
    @JoinColumn(name="location_id")
    private Location location;
	
	@JsonIgnore
	@ManyToMany(mappedBy="beachFavorites")
	private List<User> favoritedUsers;
	
	@JsonIgnore
	@OneToMany(mappedBy="beach")
	private List<Weather> weatherPosts;
	
	@JsonIgnore
	@OneToMany(mappedBy="beach")
	private List<Report> reportPosts;
	
	public Beach() {
		super();
	}
	
	public List<Weather> getWeatherPosts() {
		return weatherPosts;
	}
	public void setWeatherPosts(List<Weather> weatherPosts) {
		this.weatherPosts = weatherPosts;
	}
	public List<Report> getReportPosts() {
		return reportPosts;
	}
	public void setReportPosts(List<Report> reportPosts) {
		this.reportPosts = reportPosts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Double getRating() {
		return rating;
	}
	public void setRating(Double rating) {
		this.rating = rating;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDefaultImage() {
		return defaultImage;
	}
	public void setDefaultImage(String defaultImage) {
		this.defaultImage = defaultImage;
	}
	public Boolean getEnabled() {
		return enabled;
	}
	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public boolean isOperational() {
		return operational;
	}
	public void setOperational(boolean operational) {
		this.operational = operational;
	}
	public String getPetFriendly() {
		return petFriendly;
	}
	public void setPetFriendly(String petFriendly) {
		this.petFriendly = petFriendly;
	}
	public String getParkingAvailable() {
		return parkingAvailable;
	}
	public void setParkingAvailable(String parkingAvailable) {
		this.parkingAvailable = parkingAvailable;
	}
	public String getPriceOfAdmission() {
		return priceOfAdmission;
	}
	public void setPriceOfAdmission(String priceOfAdmission) {
		this.priceOfAdmission = priceOfAdmission;
	}
	public String getHours() {
		return hours;
	}
	public void setHours(String hours) {
		this.hours = hours;
	}
	public List<BeachSetting> getBeachSettings() {
		return beachSettings;
	}
	public void setBeachSettings(List<BeachSetting> beachSettings) {
		this.beachSettings = beachSettings;
	}
	public List<InclementCondition> getInclementConditions() {
		return inclementConditions;
	}
	public void setInclementConditions(List<InclementCondition> inclementConditions) {
		this.inclementConditions = inclementConditions;
	}

	public Location getLocation() {
		return location;
	}
	public void setLocation(Location location) {
		this.location = location;
	}
	
	public List<User> getFavoritedUsers() {
		return favoritedUsers;
	}
	public void setFavoritedUsers(List<User> favoritedUsers) {
		this.favoritedUsers = favoritedUsers;
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
		Beach other = (Beach) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "Beach [id=" + id + ", name=" + name + ", description=" + description + ", defaultImage=" + defaultImage
				+ ", operational=" + operational + ", petFriendly=" + petFriendly
				+ ", parkingAvailable=" + parkingAvailable + ", priceOfAdmission=" + priceOfAdmission + ", hours="
				+ hours + "]";
	}
}