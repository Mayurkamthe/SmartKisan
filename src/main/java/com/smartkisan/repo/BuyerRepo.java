package com.smartkisan.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository; // Or another repository type
import org.springframework.stereotype.Repository;

import com.smartkisan.model.Buyers;

@Repository
public interface BuyerRepo extends JpaRepository<Buyers, Integer> { // Use your primary key type instead of Long if
																	// different
	List<Buyers> findByEmailAndPassword(String email, String password);
}