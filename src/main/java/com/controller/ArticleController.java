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
import org.springframework.web.bind.annotation.RequestParam;

import com.model.Article;
import com.model.ArticleDTO;
import com.model.User;
import com.service.ArticleService;
import com.service.TagService;
import com.service.UserService;

@Controller
@RequestMapping("/articles")
public class ArticleController {
	
	private ArticleService articleService;
	private UserService userService;
	private TagService tagService;
	
	@Autowired
	public ArticleController(ArticleService articleService, UserService userService, TagService tagService) {
		this.articleService = articleService;
		this.userService = userService;
		this.tagService = tagService;
	}
	
	@GetMapping()
	public String allArticles(Model model) {
		List<Article> articles = articleService.getArticleList();
		model.addAttribute("articles", articles);
		model.addAttribute("tags", tagService.allTags());
		return "articles/article_list";
	}
	
	// get single article
	@GetMapping("/{id}")
	public String showArticle(@PathVariable("id") int id, Model model) {
		try {
			System.out.println(id);
			Article article = articleService.getArticle(id);
			model.addAttribute("article", article);
			return "articles/show_article";
		} catch (Exception e) {
			model.addAttribute("msg", "Resource Not Found");
			return "error";
		}
	}
	
	// get article form
	@GetMapping("/add")
	public String addArticle(Model model) {
		model.addAttribute("type", "add");
//		model.addAttribute("article", new Article());
		return "articles/show_form";
	}
	
	@ModelAttribute("articleDTO")
	public ArticleDTO getArticle() {
		return new ArticleDTO();
	}
	
	@ModelAttribute("users")
	public List<User> getUsers(){
		return userService.allUsers();
	}
	
	// add article
	@PostMapping("/add")
	public String addArticle(@Valid @ModelAttribute("articleDTO") ArticleDTO articleDTO, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("type", "add");
			return "articles/show_form";
		}
		articleService.saveArticle(articleDTO);
		return "redirect:/articles";
	}
	
	// get edit article form
	@GetMapping("/edit/{id}")
	public String editArticle(@PathVariable("id") int id, Model model) {
		try {
			Article article = articleService.getArticle(id);
			model.addAttribute("articleDTO", articleService.articleToArticleDTO(article));
			model.addAttribute("type", "edit");
			return "articles/show_form";
		} catch (Exception e) {
			model.addAttribute("msg", "Unauthorized...");
			return "error";
		}
	}
	
	// edit article
	@PostMapping("/edit")
	public String editArticle(@ModelAttribute("articleDTO") ArticleDTO articleDTO, BindingResult result, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("type", "edit");
			return "articles/show_form";
		}
		articleService.updateArticle(articleDTO);
		return "redirect:/articles";
	}
	
	// get articles by tag
	@GetMapping("/byTag")
	public String getArticlesByTag(@RequestParam("tag") String name, Model model) {
		model.addAttribute("articles", articleService.getArticlesByTagName(name));
		model.addAttribute("tags", tagService.allTags());
		model.addAttribute("tag_name", name);
		return "articles/article_list_by_tags";
	}
	
	@PostMapping("/delete/{id}")
	public String deleteArticle(@PathVariable("id") int id, Model model) {
		articleService.deleteArticle(id);
		return "redirect:/articles";
	}
}
