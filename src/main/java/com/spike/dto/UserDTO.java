package com.spike.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(
    name = "user_no_seq_name",
    sequenceName = "user_no_seq",
    initialValue = 1,
    allocationSize = 1
)
@Table(name = "UserInfo")
@EqualsAndHashCode(of = {"user_id", "login_id"}) // 중요 필드 추가
public class UserDTO {

    @Id
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE,
        generator = "user_no_seq_name"
    )
    private Integer user_id;

    @NotNull
    @Column(length = 100, nullable = false, unique = true) // unique 설정 추가
    private String login_id;

    @NotNull
    @Column(length = 255, nullable = false)
    private String password;

    @NotNull
    @Column(length = 100, nullable = false)
    private String name;

    @NotNull
    @Column(length = 255, nullable = false)
    private String email_id;

    @NotNull
    @Column(length = 255, nullable = false)
    private String email_domain;

    @NotNull
    @Column(length = 15, nullable = false)
    private String phone;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(nullable = false)
    private LocalDate birth_date;

    @NotNull
    @Column(length = 255, nullable = false)
    private String postcode;

    @NotNull
    @Column(length = 255, nullable = false)
    private String roadAddress;

    @Column(length = 255)
    private String jibunAddress;

    @NotNull
    @Column(length = 100, nullable = false)
    private String detailAddress;

    private String profile_image_uri;

    @Transient // 파일 업로드 로직에서만 사용
    private MultipartFile profileImage;

    @Column(nullable = false)
    private Boolean is_minor; // boolean으로 변경

    private String status;

    private LocalDateTime last_login; // 마지막 로그인

    @CreationTimestamp
    @Column(name = "registration_date", updatable = false) // DB에서 기본값 처리
    private LocalDateTime registration_date;
}
