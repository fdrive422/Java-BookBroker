package com.ffrago.bookbroker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.ffrago.bookbroker.models.Book;
import com.ffrago.bookbroker.models.User;
import com.ffrago.bookbroker.services.BookService;
import com.ffrago.bookbroker.services.UserService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private UserService userService;
	
// ****** DASHBOARD ******//

		@GetMapping("/books")
		public String dashboard(
				Model viewModel,
				HttpSession session) {

			if (session.getAttribute("loggedInUser") != null) {

				viewModel.addAttribute("books", bookService.getAllBooks());

				return "dashboard.jsp";
			} else {
				return "redirect:/";
			}
		}

// ****** CREATE BOOK ******//

		@GetMapping("/books/new")
		public String newBook(
				@ModelAttribute("newBook") Book book,
				HttpSession session) {

			if (session.getAttribute("loggedInUser") != null) {
				return "newBook.jsp";
			} else {
				return "redirect:/";
			}
		}

		@PostMapping("/books/create")
		public String createBook(
				@Valid @ModelAttribute("newBook") Book book,
				BindingResult result,
				HttpSession session) {

			if (result.hasErrors()) {
				return "newBook.jsp";
			}

			bookService.create(book);
			return "redirect:/books";

		}

// ****** DISPLAY BOOK ******//

		@GetMapping("/books/{id}")
		public String showBook(
				@PathVariable("id") Long id,
				Model viewModel,
				HttpSession session) {

			if (session.getAttribute("loggedInUser") != null) {

				Book book = bookService.showOne(id);
				viewModel.addAttribute("book", book);
				viewModel.addAttribute("user", userService.findByEmail("loggedInUser"));

				return "showBook.jsp";
			} else {
				return "redirect:/";
			}
		}

// ****** EDIT BOOK ******//

		@GetMapping("/books/{id}/edit")
		public String editBook(
				@PathVariable("id") Long id,
				Model viewModel,
				HttpSession session) {

			if (session.getAttribute("loggedInUser") != null) {

				Book book = bookService.showOne(id);

				viewModel.addAttribute("editBook", book);
				return "editBook.jsp";
			} else {

				return "redirect:/";
			}
		}

		@PutMapping("/books/{id}/update")
		public String updateBook(
				@PathVariable("id") Long id,
				@Valid @ModelAttribute("editBook") Book book,
				BindingResult result,
				Model viewModel) {

			if (result.hasErrors()) {

				return "editBook.jsp";
			}

			bookService.update(book);
			return "redirect:/books";
		}

// ****** DELETE BOOK ******//

		@DeleteMapping("/books/{id}/delete")
		public String destroyBook(
				@PathVariable("id") Long id) {

			bookService.delete(id);
			return "redirect:/books";
		}

// ****** BOOK MARKET DASHBOARD ******//

		@GetMapping("/bookmarket")
		public String bookMarket(
				@ModelAttribute("unborrowedBooks") Book book,
				BindingResult result,
				Model viewModel,
				HttpSession session) {

			if (session.getAttribute("loggedInUser") != null) {

				// System.out.println(session.getAttribute("loggedInUser"));
				viewModel.addAttribute("unborrowed", bookService.getUnborrowedBooks());
				viewModel.addAttribute("borrowed", bookService.getBorrowedBooks());

				return "bookBroker.jsp";
			} else {

				return "redirect:/";
			}
		}

// ****** BORROW/RETURN BOOK VIA FORM TAG IN BUTTON ******//

		@PutMapping("/books/borrow/{id}")
		public String borrowBook(
				@PathVariable("id") Long id,
				@ModelAttribute("unborrowedBooks") Book book,
				BindingResult result,
				HttpSession session) {

			if (result.hasErrors()) {

				return "bookBroker.jsp";
			}

			book.setBorrower((User) session.getAttribute("loggedInUser"));
			bookService.update(book);
			return "redirect:/bookmarket";
		}

		@PutMapping("/books/return/{id}")
		public String returnBook(
				@PathVariable("id") Long id,
				@ModelAttribute("unborrowedBooks") Book book,
				BindingResult result,
				HttpSession session) {

			if (result.hasErrors()) {

				return "bookBroker.jsp";
			}

			book.setBorrower(null);
			bookService.update(book);
			return "redirect:/bookmarket";
		}

// ****** BORROW/RETURN BOOK VIA ROUTE ONLY IN BUTTON ******//

		@GetMapping("books/add/{id}")
		public String borrow(
				@PathVariable("id") Long id,
				HttpSession session) {

			User user = (User) session.getAttribute("loggedInUser");
			Book book = bookService.showOne(id);
			bookService.borrowBook(book, user);

			return "redirect:/bookmarket";
		}

		@GetMapping("books/remove/{id}")
		public String unborrow(
				@PathVariable("id") Long id,
				HttpSession session) {

			User user = (User) session.getAttribute("loggedInUser");
			Book book = bookService.showOne(id);
			bookService.unborrowBook(book, user);

			return "redirect:/bookmarket";
		}
}
