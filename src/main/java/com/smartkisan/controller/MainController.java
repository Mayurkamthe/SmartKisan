package com.smartkisan.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class MainController {


	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@GetMapping("/signup")
	public String singup() {
		return "signup";
	}

	@GetMapping("/farmerDashboard")
	public String farmerDashboard() {
		return "farmerDashboard";
	}

	@GetMapping("/myFarm")
	public String myFarm() {
		return "myFarm";
	}

	@GetMapping({ "/", "/home" })
	public String home() {
		return "home";
	}

	@GetMapping({ "/cropInfo" })
	public String cropInfo() {
		return "cropInfo";
	}

	@GetMapping("/Ai")
	public RedirectView aiassist() {
	    return new RedirectView("/aiassist.html");
	}

	@GetMapping("/sellerDashboard")
	public String sellerDashboard () {
		return "sellerDashboard";
	}
	
	@GetMapping("/sellAnalytics")
	public String about() {
		return "sellAnalytics";
	}
	
	

}
