package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.service.UserService;

@Controller
@RequestMapping("/auth")
public class AuthController {
	
	private UserService userService;
	
	public AuthController(UserService userService) {
		this.userService = userService;
	}
	
	@ModelAttribute("user")
	public User getUser() {
		return new User(); 
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "auth/login_form";
	}
	
	@PostMapping("/login")
	public String submitLogin(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		if(result.hasFieldErrors("email")||result.hasFieldErrors("password")) {
			return "auth/login_form";
		}
		// check user password
		User obj = userService.getUserByEmail(user.getEmail());
		if(obj==null) {
			model.addAttribute("errors", "Email is incorrect");
			return "auth/login_form";
		}
		else if(!obj.getPassword().equals(user.getPassword())) {
			model.addAttribute("errors", "Password is incorrect");
			return "auth/login_form";
		}
		session.setAttribute("current_user", obj);
		return "redirect:/";
	}
	
	@GetMapping("/register")
	public String register(Model model) {
		return "auth/register_form";
	}
	
	@PostMapping("/register")
	public String submitRegister(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			return "auth/register_form";
		}
		// check if already exist or not
		User obj = userService.getUserByEmail(user.getEmail());
		if(obj!=null) {
			model.addAttribute("errors", "User email is already exist");
			return "auth/register_form";
		}
		userService.saveUser(user);
		session.setAttribute("current_user", userService.getUserByEmail(user.getEmail()));
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
