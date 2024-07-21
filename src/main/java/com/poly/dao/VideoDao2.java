package com.poly.dao;



import java.util.List;

import com.poly.entity.Video;



public interface VideoDao2 {
	List<Video> findAll();
	Video findById(String id);
	void create(Video Video);
	void update(Video Video);
	void deleteById(String id);
}

