package com.spike.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.spike.model.Account;

public interface AccountRepository extends JpaRepository<Account, String> {
    // JPA에서 기본적으로 제공하는 메서드들 (save, findAll 등)을 사용할 수 있습니다.
}
