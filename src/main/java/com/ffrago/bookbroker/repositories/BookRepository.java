package com.ffrago.bookbroker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.ffrago.bookbroker.models.Book;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {

    // get all
    List<Book> findAll();

    // get all books with no borrowers
    List<Book> findByBorrowerIsNull();

    // get all books with borrowers
    List<Book> findByBorrowerIsNotNull();

}