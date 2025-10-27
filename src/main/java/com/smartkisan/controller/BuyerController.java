package com.smartkisan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.smartkisan.model.Buyers;
import com.smartkisan.services.BuyerService;

@Controller

public class BuyerController {
	@Autowired
	BuyerService buyerService;

	// This method will show the buyer login page
	@GetMapping("/buyerLogin")
	public String showBuyerLoginPage() {
		return "buyer/buyerLogin";
	}

	@GetMapping("/buyerSignup")
	public String showBuyerSignupPage() {
		return "buyer/buyerSignup";
	}

	@GetMapping("/buyerDashboard")
	public String showBuyerDashboard() {
		return "buyer/buyer"; // This should match your JSP file name
	}

	@GetMapping("/payment")
	public String showPaymentPage() {
		return "buyer/payment"; // This should match your JSP file name
	}

	@PostMapping("/buyerRegister")
	public String buyerRegister(@ModelAttribute Buyers buyer) {

		buyerService.addBuyer(buyer);

		return "buyer/buyerLogin"; // Redirect to login after successful registration
	}
	
	//login
	@PostMapping("/buyerLogin")
	public String buyerLogin(@ModelAttribute Buyers buyer) {
		if (buyerService.login(buyer)) {
			return "buyer/buyer"; // Redirect to buyer dashboard after successful login
		}
		return "buyer/buyerLogin"; // Redirect to buyer dashboard after successful login
	}
	

}