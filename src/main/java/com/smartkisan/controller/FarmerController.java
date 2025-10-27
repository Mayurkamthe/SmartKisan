package com.smartkisan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.smartkisan.model.Farmers;
import com.smartkisan.services.FarmerServices;

@Controller
public class FarmerController {
	@Autowired
	FarmerServices farmerServices;

	@PostMapping("/register")
	public String register(Farmers farmer) {
		farmerServices.addFarmer(farmer);

		return "login";

	}

	// login
	@PostMapping("/login")

	public String login(@ModelAttribute Farmers farmer) {
		
		if (farmerServices.login(farmer)) {
			return "farmerDashboard";
		}
		return "login";

	}
}