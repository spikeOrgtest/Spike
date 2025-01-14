package com.spike.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spike.dto.AccountDTO;
import com.spike.service.AccountService;

@RestController
@RequestMapping("/products")
public class AccountController {

    @Autowired
    private AccountService accountService;

    // 계좌 생성 요청 처리
    @PostMapping("/newmember")
    public ResponseEntity<?> createAccount(@RequestBody AccountDTO accountDTO) {
        // 계좌 생성 시 createdDate는 서버에서 현재 날짜로 설정
        accountDTO.setCreatedDate(new Date());

        try {
            accountService.createAccount(accountDTO);  // 계좌 저장

            // 계좌 생성 성공 응답
            return ResponseEntity.ok().body("{\"status\":\"success\", \"accountNumber\":\"" + accountDTO.getAccountNumber() + "\"}");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(500).body("{\"status\":\"error\", \"message\":\"계좌 생성 실패\"}");
        }
    }

}
