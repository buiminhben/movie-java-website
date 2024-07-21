package com.poly.dao;

import java.util.List;

import com.poly.entity.History;

public interface HistoryDao {
	// lay video nguoi dung da xem, bang username cua ho
	List<History> findByUser(String username);
	
	//tim kiem User da like
	List<History> findByUserAndIsLiked(String username);

	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	
	History create(History entity);
	History update(History entity);
}
