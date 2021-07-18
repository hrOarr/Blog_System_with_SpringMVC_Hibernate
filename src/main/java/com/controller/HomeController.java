package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.service.ArticleService;
import com.service.TagService;

@Controller
public class HomeController {
	
	private ArticleService articleService;
	private TagService tagService;
	
	@Autowired
	public HomeController(ArticleService articleService, TagService tagService) {
		this.articleService = articleService;
		this.tagService = tagService;
	}
	
	@GetMapping()
	public String getHome(Model model) {
		model.addAttribute("articles", articleService.getArticleList());
		model.addAttribute("tags", tagService.allTags());
		return "home";
	}

}
