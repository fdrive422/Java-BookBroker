package com.ffrago.bookbroker.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ffrago.bookbroker.models.LoginUser;
import com.ffrago.bookbroker.models.User;
import com.ffrago.bookbroker.services.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index(
			@ModelAttribute("newUser") User user,
			@ModelAttribute("newLogin") LoginUser loginUser) {

		return "index.jsp";
	}

	// ****** REGISTER USER ******//

	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User user,
			BindingResult result,
			HttpSession session,
			@ModelAttribute("newLogin") LoginUser loginUser) {

		// validate user
		userService.validate(user, result);
		if (result.hasErrors()) {
			return "index.jsp";
		}

		// register user
		userService.registerUser(user);

		// put user in session
		session.setAttribute("loggedInUser", user);
		return "redirect:/books";

	}

// ****** LOGIN USER ******//

	@PostMapping("/login")
	public String login(
			@Valid @ModelAttribute("newLogin") LoginUser loginUser,
			BindingResult result,
			HttpSession session,
			@ModelAttribute("newUser") User user) {

		// authenticate user
		userService.authenticateUser(loginUser, result);
		if (result.hasErrors()) {
			return "index.jsp";
		}

		User loggedInUser = userService.findByEmail(loginUser.getUserEmail());

		// put user in session
		session.setAttribute("loggedInUser", loggedInUser);
		return "redirect:/books";
	}

	
// ****** LOGOUT ******//

	@GetMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/";
	}



}
