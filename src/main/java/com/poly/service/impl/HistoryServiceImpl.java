package com.poly.service.impl;

import java.sql.Timestamp;
import java.util.List;

import com.poly.dao.HistoryDao;
import com.poly.dao.impl.HistoryDaoImpl;
import com.poly.entity.History;
import com.poly.entity.User;
import com.poly.entity.Video;
import com.poly.service.HistoryService;
import com.poly.service.VideoService;

public class HistoryServiceImpl implements HistoryService {
	private HistoryDao dao;
	private VideoService videoService = new VideoServiceImpl();
	
	
	public HistoryServiceImpl() {
		dao = new HistoryDaoImpl();
	}
	
	@Override
	public List<History> findByUser(String username) {
		return dao.findByUser(username);
	}

	@Override
	public List<History> findByUserAndIsLiked(String username) {
		return dao.findByUserAndIsLiked(username);
	}

	@Override
	public History findByUserIdAndVideoId(Integer userId, Integer videoId) {
		return dao.findByUserIdAndVideoId(userId, videoId);
	}

	@Override
	public History create(User user, Video video) {
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
			if(existHistory == null) {
				existHistory = new History();
				existHistory.setUser(user);
				existHistory.setVideo(video);
				existHistory.setIsLiked(Boolean.FALSE);
				existHistory.setViewedDate(new Timestamp(System.currentTimeMillis()));
				return dao.create(existHistory);		
			}
			return existHistory;
			
		}
	

	@Override
	public boolean updateLikeOrUnLike(User user, String videoHref) {
		Video video = videoService.findByHref(videoHref);
		History existHistory = findByUserIdAndVideoId(user.getId(), video.getId());
		
		if(existHistory.getIsLiked() == Boolean.FALSE) {
			existHistory.setIsLiked(Boolean.TRUE);
		existHistory.setLikedDate(new Timestamp(System.currentTimeMillis()));   // lay tg hien tai he thong
		
		}else {
			existHistory.setIsLiked(Boolean.FALSE);
			existHistory.setLikedDate(null);
		}
		History updatedHistory = dao.update(existHistory);
		// neu khac null thi true, nguoc lai false
		return updatedHistory != null ? true : false;
	}
	

}
