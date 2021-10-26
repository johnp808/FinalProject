package com.skilldistillery.waves.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Beach {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String name;
	private String description;
	@Column(name = "default_image")
	private String defaultImage;

	@Column(name = "location_id")
	private int locationId;

	private boolean operational;

	@Column(name = "pet_friendly")
	private String petFriendly;

	@Column(name = "parking_available")
	private String parkingAvailable;

	@Column(name = "price_of_admission")
	private String priceOfAdmission;
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
				+ ", locationId=" + locationId + ", operational=" + operational + ", petFriendly=" + petFriendly
				+ ", parkingAvailable=" + parkingAvailable + ", priceOfAdmission=" + priceOfAdmission + ", hours="
				+ hours + "]";
	}
	public Beach() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public int getLocationId() {
		return locationId;
	}
	public void setLocationId(int locationId) {
		this.locationId = locationId;
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
	private String hours;
	
}