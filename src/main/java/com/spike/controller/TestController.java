package com.spike.controller; // 패키지 선언

import com.spike.dto.hshtest; // hshtest 클래스 import
import org.springframework.web.bind.annotation.GetMapping; // GET 요청을 처리할 수 있는 어노테이션
import org.springframework.web.bind.annotation.RequestMapping; // 요청 URL을 매핑하는 어노테이션
import org.springframework.web.bind.annotation.RestController; // RESTful API로 응답하는 어노테이션

@RestController  // 이 클래스는 REST API의 컨트롤러로 사용된다는 것을 나타냄
@RequestMapping("/test")  // "/test" 경로로 들어오는 요청을 이 컨트롤러에서 처리
public class TestController {

    // '/test/userid' 경로로 GET 요청을 처리하는 메소드
    @GetMapping("/userid")  // /test/userid 경로로 GET 요청이 오면 실행됨
    public String test(hshtest t) {  // hshtest 타입의 객체 t를 요청 파라미터로 받음
        
        // hshtest 객체에 userid 값을 설정
        t.setUserid("hsh");  // "hsh"라는 값을 userid에 설정
        
        // userid 값을 가져오기
        String userid = t.getUserid();  // t 객체에서 userid 값을 가져옴

        // 가져온 userid 값을 응답으로 반환
        return "User ID is: " + userid;  // 응답 메시지로 User ID를 반환
    }
}
