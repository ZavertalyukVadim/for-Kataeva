package com.dao;

import com.entities.Vendor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VendorDao extends JpaRepository<Vendor, Integer> {
}
