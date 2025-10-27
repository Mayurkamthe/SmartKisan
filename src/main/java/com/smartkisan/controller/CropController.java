package com.smartkisan.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.smartkisan.model.Crop;
@Controller
public class CropController {

	@GetMapping("/crop")
	public String cropInfo(Model model) {
		List<Crop> crops = Arrays.asList(
				new Crop("Sugarcane (गन्ना)", "Jan-Mar, Oct-Nov", "Loamy, Black cotton soil", "High irrigation",
						"Early shoot borer, Pyrilla"),
				new Crop("Wheat (गेहूं)", "Oct-Dec", "Loamy soil", "Moderate", "Aphids, Termites, Rusts"),
				new Crop("Cotton (कपास)", "Apr-May", "Black cotton soil", "Moderate, drought tolerant",
						"Bollworm, Whitefly, Jassids"));
		model.addAttribute("crops", crops);
		return "crop"; // JSP page name
	}

}
