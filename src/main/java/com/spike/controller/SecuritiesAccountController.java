package com.spike.controller;

import com.spike.dto.SecuritiesAccountDTO;
import com.spike.service.SecuritiesAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/securities-account")
public class SecuritiesAccountController {

    @Autowired
    private SecuritiesAccountService accountService;

    // 계좌 생성
    @PostMapping
    public SecuritiesAccountDTO createAccount(@RequestBody SecuritiesAccountDTO accountDTO) {
        return accountService.createAccount(accountDTO);
    }

    // 사용자 계좌 조회
    @GetMapping("/user/{userId}")
    public List<SecuritiesAccountDTO> getAccountsByUserId(@PathVariable Long userId) {
        return accountService.getAccountsByUserId(userId);
    }

    // 계좌 잔액 업데이트
    @PutMapping("/{accountId}/balance")
    public SecuritiesAccountDTO updateBalance(@PathVariable Long accountId, @RequestParam Double amount) {
        return accountService.updateBalance(accountId, amount);
    }
}
