package com.spike.controller;

import com.spike.service.*;
import com.spike.dto.*;
import com.spike.repository.GiftIconRepository;
import com.spike.repository.UserRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/spike.com")
public class QuizController {

    @Autowired
    private QuizResultService quizResultService;
    
    @Autowired
    private UserSerivce userService;

    @Autowired
    private QuizService quizService;
    
    @Autowired
    private GifticonService gifticonService;
    
    @Autowired
    private PointHistoryService pointHistoryService;
    
    @Autowired
    private GiftIconRepository giftIconRepository;
    
    @Autowired
    private UserRepository userRepository;

    // -------------------- Quiz Result and Points Update --------------------
    
    @PostMapping("update-score")
    public ResponseEntity<Map<String, Object>> updateScore(@RequestBody QuizResultDTO quizResultDto, HttpSession session) {
        Map<String, Object> response = new HashMap<>();
        try {
            UserDTO sessionUser = (UserDTO) session.getAttribute("User"); // 로그인 유저 정보
            quizResultDto.setUser(sessionUser);

            // 퀴즈 결과 저장 및 포인트 업데이트
            quizResultService.saveQuizResult(quizResultDto);
            userService.addPoints(sessionUser, quizResultDto.getEarnedPoints());
            
            // 업데이트된 유저 정보를 세션에 저장
            UserDTO updatedUser = userService.findId(sessionUser);
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

    // -------------------- Gifticon Purchase --------------------
    
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
            Integer itemPrice = (Integer) purchaseData.get("itemPrice");
            if (itemPrice == null) {
                response.put("success", false);
                response.put("message", "상품 가격 정보가 없습니다.");
                return ResponseEntity.badRequest().body(response);
            }
            
         // 포인트 차감 및 구매 내역 저장
            boolean purchaseSuccess = pointHistoryService.addPurchaseHistory(user, itemName, itemPrice);
            if (!purchaseSuccess) {
                response.put("success", false);
                response.put("message", "포인트가 부족합니다.");
                return ResponseEntity.badRequest().body(response);
            }
            response.put("success", true);
            response.put("message", itemName + " 구매 성공!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "구매 처리 중 오류가 발생했습니다.");
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }

    }

    // -------------------- Quiz and Points Pages --------------------

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

    // 퀴즈 페이지
    @GetMapping("/quiz")
    public ModelAndView miniquiz(HttpSession session, RedirectAttributes redirectAttributes) {
        return checkSession(session, redirectAttributes, "mini/miniSubpage_quiz");
    }

    // 포인트샵 페이지
    @GetMapping("/shop")
    public ModelAndView minishop(HttpSession session, RedirectAttributes redirectAttributes) {
        UserDTO user = getSessionUser(session, redirectAttributes);
        if (user == null) return new ModelAndView("redirect:/spike.com/login");
        // 물품 db 조회
        List<GiftIconDTO> gift = gifticonService.findgifticon();
        UserDTO realUser = userService.findId(user);
        
        ModelAndView mav = new ModelAndView();
        mav.addObject("point", realUser.getPoint());
        mav.addObject("gift", gift);
        mav.setViewName("mini/miniSubpage_quiz_shop");
        return mav;
    }

    // 포인트 확인 페이지
    @GetMapping("/point")
    public ModelAndView mypoint(HttpSession session) {
        UserDTO user = getSessionUser(session, null);
        if (user == null) return new ModelAndView("redirect:/spike.com/login");

        ModelAndView mav = new ModelAndView();

        // 세션을 통한 포인트 조회
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
        
        // 포인트 사용 내역 추가
        List<PointHistoryDTO> historyList = pointHistoryService.getPointHistory(user);
        mav.addObject("history", historyList);
        
        List<QuizRank> ranks = quizResultService.getTopRankUser();
        mav.addObject("ranks", ranks);

        mav.setViewName("mini/miniSubpage_quiz_point");
        return mav;
    }
    
 // JSON 응답을 위한 DTO 클래스
    static class PointHistoryResponse {
        public String useDate;
        public String giftName;
        public int usedPoints;
        public int remainingPoints;

        public PointHistoryResponse(PointHistoryDTO history) {
            this.useDate = history.getUseDate().toString(); // 날짜 변환
            this.giftName = history.getGiftIconName(); // 기프티콘 이름
            this.usedPoints = history.getUsedPoints().intValue(); // 사용한 포인트
            this.remainingPoints = history.getRemainingPoints().intValue(); // 남은 포인트
        }
    }
    
    // -------------------- Common Methods --------------------

    // 세션에서 로그인된 사용자 확인
    private UserDTO getSessionUser(HttpSession session, RedirectAttributes redirectAttributes) {
        UserDTO sessionUser = (UserDTO) session.getAttribute("User");
        if (sessionUser == null && redirectAttributes != null) {
            redirectAttributes.addAttribute("message", "로그인이 필요합니다!");
        }
        return sessionUser;
    }

    // 세션 확인 및 리다이렉트
    private ModelAndView checkSession(HttpSession session, RedirectAttributes redirectAttributes, String defaultPage) {
        UserDTO sessionUser = getSessionUser(session, redirectAttributes);
        if (sessionUser == null) {
            return new ModelAndView("redirect:/spike.com/login");
        }
        if (!sessionUser.getIsMinor().equals("minor")) {
            redirectAttributes.addAttribute("message", "mini 회원이 아닙니다.");
            return new ModelAndView("redirect:/spike.com/mini");
        }
        return new ModelAndView(defaultPage);
    }

    
}


