package com.spike.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spike.dao.TestDAO;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestDAO testdao;
}
