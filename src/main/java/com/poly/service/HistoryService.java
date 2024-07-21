package com.poly.service;

import java.util.List;

import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;

public interface HistoryService {
	// lay video nguoi dung da xem, bang username cua ho
	List<History> findByUser(String username);
	
	//tim kiem User da like
	List<History> findByUserAndIsLiked(String username);

	History findByUserIdAndVideoId(Integer userId, Integer videoId);
	
	History create(User user, Video video);
	boolean updateLikeOrUnLike(User user, String videoHref);

}
