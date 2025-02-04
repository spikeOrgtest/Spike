package com.spike.controller;

import com.spike.service.QuizResultService;


import com.spike.service.QuizService;
import com.spike.service.UserSerivce;
import com.spike.dto.QuizDTO;
import com.spike.dto.QuizRank;
import com.spike.dto.QuizResultDTO;
import com.spike.dto.UserDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/spike.com")
public class QuizController {

    @Autowired
    private QuizResultService quizResultService;
    
    @Autowired
    private UserSerivce userService;

    @Autowired
    private QuizService quizService;
    


    @PostMapping("update-score")
    public ResponseEntity<Map<String, Object>> updateScore(@RequestBody QuizResultDTO quizResultDto, HttpSession session) {
        System.out.println("Hello");
    	Map<String, Object> response = new HashMap<>();

        try {
        	UserDTO sessionUser = (UserDTO)session.getAttribute("User"); //로그인 유저 정보를 가져오는 코드
        	
        	quizResultDto.setUser(sessionUser);
        	
            // QuizResult 저장
            quizResultService.saveQuizResult(quizResultDto);
            
            userService.addPoints(sessionUser, quizResultDto.getEarnedPoints());

            // User의 포인트 업데이트
         // UserSerivce.updateUserPoints(quizResultDto.getUser_id(), quizResultDto.getEarned_points());

            response.put("status", "success");
            response.put("message", "포인트가 성공적으로 업데이트되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "포인트 업데이트 실패.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }

    // 퀴즈 목록 반환
    @GetMapping("/quizlist")
    @ResponseBody
    public List<QuizDTO> quizList() {
        return quizService.getAllQuizzes();
    }

    // 메인 페이지
    @GetMapping("/mini")
    public String mini() {
        return "mini/mini";
    }
    
 // 서브메인 페이지
    @GetMapping("/minisub")
    public String minisub() {
        return "mini/miniSubpage_main";
    }
    
 // 금융교육 페이지
    @GetMapping("/edu")
    public String miniedu() {
        return "mini/miniSubpage_edu";
    }
    
    //로그인 체크 함수 
    private ModelAndView checkSession(HttpSession session, String defaultPage) {
    	UserDTO sessionUser = (UserDTO)session.getAttribute("User"); //로그인 유저 정보를 가져오는 코드
    	
    	if (sessionUser == null) { //로그인 안 하고 퀴즈 페이즈 접근시 로그인 페이지로 반환
    		return new ModelAndView("redirect:/spike.com/login");
    	}
    	
    	if (!sessionUser.getIsMinor().equals("minor")) {
    		return new ModelAndView("redirect:/spike.com/mini");
    	}
    	
    	ModelAndView mv = new ModelAndView();
    	
    	mv.setViewName(defaultPage);
    	
        return mv;
    }
    
    // 퀴즈 페이지
    @GetMapping("/quiz")
    public ModelAndView miniquiz(HttpSession session) {
        return checkSession(session, "mini/miniSubpage_quiz");
    } 

    // 포인트샵 페이지
    @GetMapping("/shop")
    public ModelAndView minishop(HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("User");
    	
    	if (user == null) {
    		return new ModelAndView("redirect:/spike.com/login");
    	}
    	
    	if (!user.getIsMinor().equals("minor")) {
    		return new ModelAndView("redirect:/spike.com/mini");
    	}
    	
    	ModelAndView mav = new ModelAndView();
    	
    	UserDTO realUser = userService.findId(user);
    	mav.addObject("point", realUser.getPoint());
    	
    	mav.setViewName("mini/miniSubpage_quiz_shop");
    	
        return mav;
    }
    
    // 포인트 확인 페이지
    @GetMapping("/point")
    public ModelAndView mypoint(HttpSession session) {
    	UserDTO user = (UserDTO) session.getAttribute("User");
    	
    	if (user == null) {
    		return new ModelAndView("redirect:/spike.com/login");
    	}
    	
    	if (!user.getIsMinor().equals("minor")) {
    		return new ModelAndView("redirect:/spike.com/mini");
    	}
    	
    	ModelAndView mav = new ModelAndView();
    	
    	List<QuizResultDTO> results = quizResultService.getTotalQuizResult(user);

    	Integer totalPoint = 0;
    	Integer totalAttempts = 0;
    	Integer correctNum = 0;
		for (QuizResultDTO qr : results) {
			totalPoint += qr.getEarnedPoints();
			totalAttempts += 1;
			if (qr.getAnsweredCorrectly() == 'Y') {
				correctNum += 1;
			}
		}
		
    	mav.addObject("totalPoint", totalPoint);
    	mav.addObject("totalAttempts", totalAttempts);
    	mav.addObject("correctNum", correctNum);
    	
    	List<QuizRank> ranks = quizResultService.getTopRankUser();
    	
    	
    	mav.addObject("ranks", ranks);
    	
    	mav.setViewName("mini/miniSubpage_quiz_point");
    	
        return mav;
    }

    // 퀴즈 시도 처리
    @PostMapping("/quiz/attempt")
    @ResponseBody
    public String attemptQuiz(@RequestParam int quizId, @RequestParam String userAnswer, HttpSession session) {
        // 세션에서 로그인된 사용자 ID 가져오기
        Long userId = (Long) session.getAttribute("userId");  // 세션에 저장된 로그인된 사용자 ID

        if (userId == null) {
            return "로그인 후 시도해주세요.";
        }

        // 퀴즈 결과 처리
        boolean isCorrect = quizResultService.attemptQuiz(userId, quizId, userAnswer);

        // QuizResultDTO 객체 생성 및 저장
        QuizResultDTO quizResult = new QuizResultDTO();
        UserDTO userDTO = new UserDTO();
        userDTO.getUserId();
        userDTO.getPoint();
        quizResult.setUser(userDTO);  // 사용자 정보 설정
        quizResult.setQuiz(quizService.getQuizById(quizId));  // 퀴즈 정보 설정
        quizResult.setAnsweredCorrectly(isCorrect ? 'Y' : 'N');
        quizResult.setEarnedPoints(isCorrect ? 100 : 0);  // 정답일 경우 100포인트 지급
        quizResult.setAttemptDate(new Date());

        quizResultService.saveQuizResult(quizResult);

        // 포인트 업데이트
        updateUserPoints(userId, isCorrect ? 100 : 0);

        // 결과 반환 (서버에 결과 전송 후 프론트에 보여줄 메시지)
        return isCorrect ? "정답입니다! 100 포인트가 적립되었습니다." : "틀렸습니다. 다시 시도해주세요.";
    }

    // 사용자 포인트 조회
    @GetMapping("/quiz/mypoint")
    @ResponseBody
    public Integer getQuizPoint(HttpSession session) {
        UserDTO user = (UserDTO) session.getAttribute("User");  // 세션에서 로그인된 사용자 ID 가져오기

        if (user == null) {
            return 0; // 로그인하지 않으면 0포인트 반환
        }

        return quizResultService.getUserTotalPoints(user);
    }
    
    

    // 퀴즈 결과 조회
    @GetMapping("/quiz/result")
    @ResponseBody
    public QuizResultDTO getQuizResult(@RequestParam int quizId, HttpSession session) {
        Long userId = (Long) session.getAttribute("userId");  // 세션에서 로그인된 사용자 ID 가져오기

        if (userId == null) {
            return null; // 로그인하지 않으면 null 반환
        }

        return quizResultService.getQuizResult(userId, quizId);
    }

    // 사용자 포인트 업데이트
    private void updateUserPoints(Long userId, int earnedPoints) {
        // 사용자 포인트 업데이트 서비스 호출
        quizResultService.updateUserPoints(userId, earnedPoints);
    }
}
