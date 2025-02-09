package com.spike.service;

import com.spike.dto.PointHistoryDTO;
import com.spike.dto.UserDTO;
import com.spike.dto.GiftIconDTO;
import com.spike.repository.GiftIconRepository;
import com.spike.repository.PointHistoryRepository;
import com.spike.service.UserSerivce;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PointHistoryServiceImpl implements PointHistoryService {

    private final PointHistoryRepository pointHistoryRepository;
    private final UserSerivce userService; // UserService 주입
    private final GiftIconRepository giftIconRepository;

    @Autowired
    public PointHistoryServiceImpl(PointHistoryRepository pointHistoryRepository, UserSerivce userService, GiftIconRepository giftIconRepository) {
        this.pointHistoryRepository = pointHistoryRepository;
        this.userService = userService;
        this.giftIconRepository = giftIconRepository;
    }
    

    @Override
    @Transactional
    public void save(PointHistoryDTO pointHistoryDTO) {
    	pointHistoryRepository.save(pointHistoryDTO);
    }
    
    @Override
    public List<PointHistoryDTO> getPointHistory(UserDTO user) {
        return pointHistoryRepository.findTop5ByUserOrderByUseDateDesc(user); // 포인트 사용 내역 조회
    }
    
    @Override
    @Transactional
    public boolean addPurchaseHistory(UserDTO user, String itemName, int itemPrice) {
        // 사용자의 현재 포인트 가져오기
        UserDTO realUser = userService.findId(user);
        
        GiftIconDTO giftIcon = giftIconRepository.findByGiftconName(itemName);
        
        if (giftIcon == null) {
        	return false;
        }
        
        int userPoints = realUser.getPoint();
        System.out.println("현재 포인트: " + realUser.getPoint());

        // 포인트 부족 확인
        if (userPoints < itemPrice) {
            return false;
        }

        // 포인트 차감
        userService.addPoints(realUser, -itemPrice);
        
        // 구매 내역 저장
        PointHistoryDTO pointHistory = new PointHistoryDTO();
        pointHistory.setUser(realUser);
        pointHistory.setGiftIcon(giftIcon);
        pointHistory.setGiftIconName(giftIcon.getGiftconName());
        pointHistory.setUsedPoints((long) itemPrice);
        pointHistory.setRemainingPoints((long) (userPoints - itemPrice));
        System.out.println("남은 포인트: " + pointHistory.getRemainingPoints());
        pointHistoryRepository.save(pointHistory);

        return true;
    }
}