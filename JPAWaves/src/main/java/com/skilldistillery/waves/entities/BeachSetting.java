package com.skilldistillery.waves.entities;

import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="beach_setting")
public class BeachSetting {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String description;
	
	@JsonIgnore
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(name="beach_has_beach_setting",
			joinColumns=@JoinColumn(name="beach_setting_id"),
			inverseJoinColumns=@JoinColumn(name="beach_id")
			)
	private List<Beach> beaches;
	
	public BeachSetting() {
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

	public List<Beach> getBeaches() {
		return beaches;
	}
	public void setBeaches(List<Beach> beaches) {
		this.beaches = beaches;
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
		BeachSetting other = (BeachSetting) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "BeachSetting [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
}
