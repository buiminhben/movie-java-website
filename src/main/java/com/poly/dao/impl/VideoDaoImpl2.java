package com.poly.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import com.poly.dao.VideoDao;
import com.poly.dao.VideoDao2;
import com.poly.entity.Video;
import com.poly.util.JpaUtil;

public class VideoDaoImpl2 implements VideoDao2 {
	EntityManager em = JpaUtil.getEntityManager();
	@Override
	public List<Video> findAll() {
		String jpql = "SELECT o FROM Video o";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		return query.getResultList();
	}

	@Override
	public Video findById(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void create(Video Video) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Video Video) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteById(String id) {
		// TODO Auto-generated method stub
		
	}

}
