package com.smartkisan.model;

import org.springframework.stereotype.Component;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Component
@Entity

public class Crop {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cropId;
	private String name;
	private String sowingSeason;
	private String soilType;
	private String waterNeeds;
	private String pests;

	public Crop() {
	}

	public Crop(String name, String sowingSeason, String soilType, String waterNeeds, String pests) {
		this.name = name;
		this.sowingSeason = sowingSeason;
		this.soilType = soilType;
		this.waterNeeds = waterNeeds;
		this.pests = pests;
	}

	public String getName() {
		return name;
	}

	public String getSowingSeason() {
		return sowingSeason;
	}

	public String getSoilType() {
		return soilType;
	}

	public String getWaterNeeds() {
		return waterNeeds;
	}

	public String getPests() {
		return pests;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSowingSeason(String sowingSeason) {
		this.sowingSeason = sowingSeason;
	}

	public void setSoilType(String soilType) {
		this.soilType = soilType;
	}

	public void setWaterNeeds(String waterNeeds) {
		this.waterNeeds = waterNeeds;
	}

	public void setPests(String pests) {
		this.pests = pests;
	}
}
