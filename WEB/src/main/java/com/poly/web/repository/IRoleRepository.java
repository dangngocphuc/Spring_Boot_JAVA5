package com.poly.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.poly.web.entity.Role;


@Repository("roleRepository")
public interface IRoleRepository extends JpaRepository<Role, Integer> {
	
	Role findByRole(String role);

}

