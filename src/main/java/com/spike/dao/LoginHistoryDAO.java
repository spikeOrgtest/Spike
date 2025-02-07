package com.spike.dao;

import java.util.List;

import com.spike.dto.ManagerDTO;

public interface LoginHistoryDAO {

	List<ManagerDTO> findByLoginIdday();

}
