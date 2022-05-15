package com.ffrago.bookbroker.repositories;

import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ffrago.bookbroker.models.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

    List<User> findAll();

    public User findByEmail(String email);

}