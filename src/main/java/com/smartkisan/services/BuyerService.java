package com.smartkisan.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.smartkisan.model.Buyers;
import com.smartkisan.repo.BuyerRepo;

@Service
public class BuyerService {

	@Autowired
	BuyerRepo buyerRepo;

	public void addBuyer(Buyers buyer) {
		
		buyerRepo.save(buyer);
		// TODO Auto-generated method stub
		
	}

	public boolean login(Buyers buyer) {
		// TODO Auto-generated method stub
		return false;
	}

}
