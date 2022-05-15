package com.ffrago.bookbroker.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ffrago.bookbroker.models.Book;
import com.ffrago.bookbroker.models.User;
import com.ffrago.bookbroker.repositories.BookRepository;
import com.ffrago.bookbroker.repositories.UserRepository;

@Service
public class BookService {

    @Autowired
    public BookRepository bookRepository;

    @Autowired
    public UserRepository userRepository;

    // All books
    public List<Book> getAllBooks() {

        return bookRepository.findAll();
    }

    // All borrowed books
    public List<Book> getBorrowedBooks() {

        return bookRepository.findByBorrowerIsNotNull();
    }

    // All unborrowed books
    public List<Book> getUnborrowedBooks() {

        return bookRepository.findByBorrowerIsNull();
    }

    // Get one
    public Book showOne(Long id) {

        return bookRepository.findById(id).orElse(null);
    }

    // Create one
    public Book create(Book book) {

        return bookRepository.save(book);
    }

    // Update one
    public Book update(Book book) {

        return bookRepository.save(book);
    }

    // Delete one
    public void delete(Long id) {

        bookRepository.deleteById(id);
    }

    // Borrow one
    public void borrowBook(Book book, User user) {
        book.setBorrower(user);
        bookRepository.save(book);
    }

    // Return one
    public void unborrowBook(Book book, User user) {
        book.setBorrower(null);
        bookRepository.save(book);
    }

}
