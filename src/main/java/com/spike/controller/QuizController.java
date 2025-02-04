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
     
    	Map<String, Object> response = new HashMap<>();

        try {
        	UserDTO sessionUser = (UserDTO)session.getAttribute("User"); //로그인 유저 정보를 가져오는 코드
        	
        	quizResultDto.setUser(sessionUser);
        	
            // QuizResult 저장
            quizResultService.saveQuizResult(quizResultDto);
            
            userService.addPoints(sessionUser, quizResultDto.getEarnedPoints());
			
            // 0204 포인트가 업데이트된 최신 UserDTO 가져오기
            UserDTO updatedUser = userService.findId(sessionUser);
            
            // 0204 업데이트된 유저 정보를 세션에 다시 저장
            session.setAttribute("User", updatedUser);
            
            response.put("status", "success");
            response.put("message", "포인트가 성공적으로 업데이트되었습니다.");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "포인트 업데이트 실패.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }
    
    // 0204 추가-기프티콘 구매 시, 포인트 차감 요청
    @PostMapping("/purchase")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> purchaseItem(@RequestBody Map<String, Object> purchaseData, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        
        try {
            // 세션에서 로그인한 사용자 정보 가져오기
            UserDTO user = (UserDTO) session.getAttribute("User");

            if (user == null) {
                response.put("success", false);
                response.put("message", "로그인이 필요합니다.");
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(response);
            }

            // 구매하려는 상품 정보 가져오기
            String itemName = (String) purchaseData.get("itemName");
            int itemPrice = (int) purchaseData.get("itemPrice");

            // 사용자 정보 갱신
            UserDTO realUser = userService.findId(user);
            int userPoints = realUser.getPoint(); // 현재 포인트 조회

            if (userPoints < itemPrice) {
                response.put("success", false);
                response.put("message", "포인트가 부족합니다.");
                return ResponseEntity.badRequest().body(response);
            }

            // 포인트 차감 로직 실행
            userService.addPoints(user, -itemPrice);

            response.put("success", true);
            response.put("message", itemName + " 구매 성공!");
            return ResponseEntity.ok(response);
        } catch (IllegalArgumentException e) {
        	response.put("success", false);
        	response.put("message", e.getMessage());
        	return ResponseEntity.badRequest().body(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "구매 처리 중 오류가 발생했습니다.");
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
    	
    	// DB에서 세션값을 통해 바로 포인트를 땡겨옴
    	Integer totalPoint = userService.findId(user).getPoint();
    	
    	List<QuizResultDTO> results = quizResultService.getTotalQuizResult(user);

    	Integer totalAttempts = 0;
    	Integer correctNum = 0;
		for (QuizResultDTO qr : results) {
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