package com.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.util.JpaUtil;

public class AbstractDao<T> {

	public static final EntityManager entityManager = JpaUtil.getEntityManager();

	@SuppressWarnings("removal") // deprecation
	@Override
	protected void finalize() throws Throwable {
		entityManager.close();
		super.finalize();
	}

	public T findById(Class<T> clazz, Integer id) {
		return entityManager.find(clazz, id);
	}

	// existIsActive: có tồn tại column IsActive không
	public List<T> findAll(Class<T> clazz, boolean existIsActive) {
		// SELECT o FROM entity o WHERE isActive =1
		String entityName = clazz.getSimpleName(); // lấy tên entity
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o ");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);
		return query.getResultList();

	}

	public List<T> findAll(Class<T> clazz, boolean existIsActive, int pageNumber, int pageSize) {
		// SELECT o FROM entity o WHERE isActive =1
		String entityName = clazz.getSimpleName(); // lấy tên entity
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o FROM ").append(entityName).append(" o ");
		if (existIsActive == true) {
			sql.append(" WHERE isActive = 1");
		}
		TypedQuery<T> query = entityManager.createQuery(sql.toString(), clazz);

		query.setFirstResult((pageNumber - 1) * pageSize); // trang bat dau
		query.setMaxResults(pageSize);
		return query.getResultList();
	}


//		Object... params: tham so do dai bien doi
	// hàm tìm kiếm, trả 1 giá trị
	public T findOne(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<T> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

	// hàm tìm kiếm, trả nhiều giá trị
	public List<T> findMany(Class<T> clazz, String sql, Object... params) {
		TypedQuery<T> query = entityManager.createQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	
	// trả về list, map như nào map
	@SuppressWarnings("unchecked")
	public List<Object[]> findManyByNativeQuery(Class<T> clazz, String sql, Object... params) {
		Query query = entityManager.createNativeQuery(sql, clazz);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query.getResultList();
	}
	
	public T create(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.persist(entity);
			entityManager.getTransaction().commit();
			System.out.println("tạo thành công!");
			return entity;
		}catch(Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("KHong the insert entity: "+ entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
		
	}
	
	public T update(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.merge(entity);
			entityManager.getTransaction().commit();
			System.out.println("update thành công!");
			return entity;
		}catch(Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("KHong the update entity: "+ entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
		
	}
	
	public T delete(T entity) {
		try {
			entityManager.getTransaction().begin();
			entityManager.remove(entity);
			entityManager.getTransaction().commit();
			System.out.println("delete thành công!");
			return entity;
		}catch(Exception e) {
			entityManager.getTransaction().rollback();
			System.out.println("KHong the delete entity: "+ entity.getClass().getSimpleName());
			throw new RuntimeException(e);
		}
		
	}
	
}
