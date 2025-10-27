package com.smartkisan.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.smartkisan.model.Farmers;

@Repository
public interface FarmerRepo extends JpaRepository<Farmers, Integer> {

	List<Farmers> findByEmailAndPassword(String email, String password);

}
