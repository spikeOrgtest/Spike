package com.spike.dto;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(name = "user_no_seq_name", sequenceName = "user_no_seq", initialValue = 1, allocationSize = 1)
@Table(name = "UserInfo")
@EqualsAndHashCode(of = "user_id")
public class UserDTO {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id") // 데이터베이스의 컬럼 이름
    private Long userId;

    @NotNull
    @Column(length = 100)
    private String loginId;

    @NotNull
    @Column(length = 255)
    private String password;

    @NotNull
    @Column(length = 100)
    private String name;

    @NotNull
    @Column(length = 255)
    private String email_id;

    @NotNull
    @Column(length = 255)
    private String email_domain;

    @NotNull
    @Column(length = 15)
    private String phone;

    @NotNull
    @Column(length = 15)
    private String phone01;

    @NotNull
    @Column(length = 15)
    private String phone02;

    @NotNull
    @Column(length = 15)
    private String phone03;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate birth_date;

    @NotNull
    @Column(length = 255)
    private String postcode;

    @NotNull
    @Column(length = 255)
    private String roadAddress;

    @Column(length = 255)
    private String jibunAddress;

    @NotNull
    @Column(length = 100)
    private String detailAddress;

    @Column(length = 100)
    private String References;

    private String profile_image_uri;

    @Transient
    private MultipartFile profileImage;

    private String is_minor;

    private String status;

    private LocalDateTime last_login;

    @CreationTimestamp
    @Column(name = "registration_date", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
    private LocalDate registration_date;

    // 1:N 관계 매핑
    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<SecuritiesAccountDTO> securitiesAccounts;
}
