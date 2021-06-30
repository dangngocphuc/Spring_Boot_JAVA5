package com.poly.web.repository;

import org.springframework.data.repository.CrudRepository;

import com.poly.web.entity.User;

public interface IUserRepository extends CrudRepository<User, Long> {
	User findByEmail(String email);
}
