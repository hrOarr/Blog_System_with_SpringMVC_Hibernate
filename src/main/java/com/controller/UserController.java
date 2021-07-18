package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.model.User;
import com.service.UserService;

@Controller
@RequestMapping("/users")
public class UserController {
	
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	// get user-list
	@GetMapping()
	public String allUsers(Model model) {
		List<User> users = userService.allUsers();
		model.addAttribute("users", users);
		return "users/user_list";
	}
	
	// get user form
	@GetMapping("/add")
	public String addUser(Model model) {
		model.addAttribute("type", "add");
		return "users/show_form";
	}
	
	@ModelAttribute("user")
	public User getUser() {
		return new User();
	}
	
	// add user
	@PostMapping("/add")
	public String addUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("type", "add");
			return "users/show_form";
		}
		System.out.println(user);
		userService.saveUser(user);
		return "redirect:/users";
	}
	
	// get edit user form
	@GetMapping("/update/{id}")
	public String updateUser(@PathVariable("id") int id, Model model) {
		User user = userService.getUser(id);
		model.addAttribute("user", user);
		model.addAttribute("type", "update");
		return "users/show_form";
	}
	
	// edit user
	@PostMapping("/update")
	public String updateUser(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("type", "update");
			return "users/show_form";
		}
		userService.updateUser(user);
		return "redirect:/users";
	}
	
	// delete user
	@PostMapping("/delete/{id}")
	public String deleteUser(@PathVariable("id") int id) {
		userService.deleteUser(id);
		return "redirect:/users";
	}
}
