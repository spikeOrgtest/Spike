package com.spike.controller;

import com.spike.service.QuizService;

import com.spike.dao.QuizDAO;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


import org.springframework.web.bind.annotation.GetMapping;



@Controller
@RequestMapping("/api/quizzes")
public class QuizController {
	
    @Autowired
    private QuizService quizService;

    @Autowired
    private QuizDAO quizDAO;
    
    //퀴즈 페이지 보여주기 
    @GetMapping("/miniquiz")
    public String miniquiz() {
    	return "mini/miniSubpage_quiz";
    	
    	
    	
    }
}
