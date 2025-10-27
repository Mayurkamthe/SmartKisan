package com.smartkisan.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smartkisan.model.Farmers;
import com.smartkisan.repo.FarmerRepo;

@Service
public class FarmerServices {
	@Autowired
	FarmerRepo farmerRepo;

	public void addFarmer(Farmers farmer) {

		farmerRepo.save(farmer);

	}

	public Boolean login(Farmers farmer) {
		List<Farmers> list = farmerRepo.findByEmailAndPassword(farmer.getEmail(), farmer.getPassword());

		if (list.isEmpty()) {
			System.out.println("❌ Login failed: user not found.");
			return false;
		}

		if (list.size() > 1) {
			System.out.println("⚠️ Warning: duplicate user records for email: " + farmer.getEmail());
		}

		return true;
	}

}
