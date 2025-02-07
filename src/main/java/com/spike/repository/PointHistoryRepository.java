package com.spike.repository;

import com.spike.dto.GiftIconDTO;
import com.spike.dto.PointHistoryDTO;
import com.spike.dto.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface PointHistoryRepository extends JpaRepository<PointHistoryDTO, Long> {

	// 특정 사용자의 최근 5개 포인트 사용 내역 조회 (최신순)
	List<PointHistoryDTO> findTop5ByUserOrderByUseDateDesc(UserDTO user);

	@Service
	public class PointHistoryService {

		@Autowired
		private PointHistoryRepository pointHistoryRepository;

		@Autowired
		private GiftIconRepository giftIconRepository;  // GiftIcon 데이터를 가져오기 위한 repository
		@Autowired
		private UserRepository userRepository;  // User 데이터를 가져오기 위한 repository

		public void createPointHistory(Long userId, Long giftIconId) {
			// User 및 GiftIcon 데이터를 불러옵니다.
			UserDTO user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
			GiftIconDTO giftIcon = giftIconRepository.findById(giftIconId).orElseThrow(() -> new RuntimeException("GiftIcon not found"));

			// PointHistoryDTO 객체를 생성하고 데이터 설정
			PointHistoryDTO pointHistory = new PointHistoryDTO();
			pointHistory.setUser(user);
			pointHistory.setGiftIcon(giftIcon);

			// pointHistory 객체가 저장될 때 useDate 필드가 자동으로 설정됩니다.

			// DB에 저장
			pointHistoryRepository.save(pointHistory);
		}
	}
}
