package com.skilldistillery.waves.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Weather {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="weather_type")
	private String weatherType;
	
	private String description;
	
	@Column(name="temperature_celsius")
	private int temperatureCelsius;
	
	private LocalDateTime created;
	
	@Column(name="wave_size")
	private String waveSize;
	

	public Weather() {
		super();
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getWeatherType() {
		return weatherType;
	}

	public void setWeatherType(String weatherType) {
		this.weatherType = weatherType;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getTemperatureCelsius() {
		return temperatureCelsius;
	}

	public void setTemperatureCelsius(int temperatureCelsius) {
		this.temperatureCelsius = temperatureCelsius;
	}

	public LocalDateTime getCreated() {
		return created;
	}

	public void setCreated(LocalDateTime created) {
		this.created = created;
	}

	public String getWaveSize() {
		return waveSize;
	}

	public void setWaveSize(String waveSize) {
		this.waveSize = waveSize;
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
		Weather other = (Weather) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "Weather [id=" + id + ", weatherType=" + weatherType + ", description=" + description
				+ ", temperatureCelsius=" + temperatureCelsius + ", created=" + created + ", waveSize=" + waveSize
				+ "]";
	}	


}
