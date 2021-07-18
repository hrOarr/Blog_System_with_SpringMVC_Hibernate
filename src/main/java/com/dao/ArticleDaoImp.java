package com.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Article;

@Repository
public class ArticleDaoImp implements ArticleDao {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public ArticleDaoImp(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	@Transactional
	public void saveArticle(Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.save(article);
	}

	@Override
	@Transactional
	public List<Article> getArticleList() {
		Session session = sessionFactory.getCurrentSession();
		CriteriaBuilder cb = session.getCriteriaBuilder();
		CriteriaQuery<Article> cq = cb.createQuery(Article.class);
		Root<Article> root = cq.from(Article.class);
		cq.select(root);
		
		TypedQuery<Article> allQuery = session.createQuery(cq);
		return allQuery.getResultList();
	}

	@Override
	@Transactional
	public Article getArticle(int id) {
		Session session = sessionFactory.getCurrentSession();
		return (Article) session.get(Article.class, id);
	}

	@Override
	@Transactional
	public void updateArticle(Article article) {
		Session session = sessionFactory.getCurrentSession();
		session.update(article);
	}

}
