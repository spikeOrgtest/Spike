package com.spike.service;

import com.spike.dto.PointHistoryDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.PointHistoryRepository;
import java.util.List;

public interface PointHistoryService {
    void save(PointHistoryDTO pointHistoryDTO);
    
    List<PointHistoryDTO> getPointHistory(UserDTO user);
    
    boolean addPurchaseHistory(UserDTO user, String itemName, int itemPrice);
}