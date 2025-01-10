package com.spike.dto;

import java.sql.Timestamp;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.*;

import org.hibernate.annotations.UpdateTimestamp;
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
@Table(name="UserInfo")
@EqualsAndHashCode(of="user_id")
public class spikeDTO {
	
	@Id
	@GeneratedValue(
			strategy = GenerationType.SEQUENCE,
			generator = "user_no_seq_name"
			)
	private Integer user_id;
	
	@NotNull(message = "필수 항목입니다.")
	@Size(min = 2, max = 100, message = "최소 2자리에서 최대 100자리까지 입력하세요.")
	@Column(length = 100)
	private String login_id;
	
	@NotNull(message = "필수 항목입니다.")
	@Size(min = 8, message = "최소 8자리 이상이여야 합니다.")
	@Column(length = 255)
	private String password;
	
	@NotNull(message = "필수 항목입니다.")
	@Size(min = 2, message = "최소 2자리 이상이여야 합니다.")
	@Column(length = 100)
	private String name;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String email_id;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String email_domain;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 15)
	private String phone;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 15)
	private String phone01;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 15)
	private String phone02;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 15)
	private String phone03;

	@NotNull(message = "필수 항목입니다.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birth_date;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String postcode;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String roadAddress;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 255)
	private String jibunAddress;
	
	@NotNull(message = "필수 항목입니다.")
	@Column(length = 100)
	private String detailAddress;
	
	private String profile_image_uri;

	@Transient // DB에 저장되지 않도록 처리해주는 에노테이션
	private MultipartFile profileImage;
	
	private boolean is_minor; // 18세 미만 여부
	
    @Enumerated(EnumType.STRING)
    @Column(name = "status", columnDefinition = "varchar(20) default 'ACTIVE'")
    private Status status = Status.ACTIVE;
	
	@UpdateTimestamp
	private Timestamp last_login;
	
	@Column(name = "registration_date", columnDefinition = "TIMESTAMP DEFAULT SYSDATE")
	private Timestamp registration_date;
	
    // 생성자
    public spikeDTO(LocalDate birth_date) {
        this.birth_date = birth_date;
        this.is_minor = calculateIsMinor();  // is_minor 값을 계산하여 설정
    }

    // 나이를 계산하고 18세 미만이면 false, 18세 이상이면 true를 반환
    private Boolean calculateIsMinor() {
        if (birth_date == null) {
            return false; // null 값 처리
        }

        // 현재 날짜와 생년월일 차이 계산
        LocalDate eighteenYearsAgo = LocalDate.now().minusYears(18);

        // 생년월일이 18년 전 날짜보다 과거일 경우 18세 미만
        return !birth_date.isAfter(eighteenYearsAgo); // 18세 이상이면 true, 미만이면 false
    }
    
    public enum Status {
        ACTIVE,    // 활성
        INACTIVE,  // 비활성
        LOCKED,    // 잠금
        SUSPENDED  // 정지
    }
    
    @AssertTrue(message = "생년월일은 현재 날짜 이전이어야 합니다.")
    public boolean isBirthDateValid() {
        return birth_date == null || !birth_date.isAfter(LocalDate.now());
    }

}
