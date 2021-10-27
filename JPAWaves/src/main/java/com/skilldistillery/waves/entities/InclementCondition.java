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
@Table(name = "inclement_condition")
public class InclementCondition {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@JsonIgnore
	@ManyToMany(cascade=CascadeType.PERSIST)
	@JoinTable(name="inclement_condition_has_beach",
			joinColumns=@JoinColumn(name="inclement_condition_id"),
			inverseJoinColumns=@JoinColumn(name="beach_id")
			)
	private List<Beach> beaches;

	public InclementCondition() {
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
		InclementCondition other = (InclementCondition) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "InclementCondition [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	
}
