package com.spike.dto;

import java.util.Date; // Date 클래스를 사용

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Entity // 이 클래스는 JPA 엔티티로 사용됨
@SequenceGenerator( // 시퀀스 생성기
    name = "quiz_result_no_seq", // 시퀀스 제너레이터 이름
    sequenceName = "quiz_result_seq", // 시퀀스 이름
    initialValue = 1, // 시작값
    allocationSize = 1 // 증가값
)
@Table(name = "QuizResult") // 테이블 이름
@EqualsAndHashCode(of = "result_id") // result_id를 기준으로 equals와 hashCode 구현
public class QuizResultDTO {

    @Id // 기본 키
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE, // SEQUENCE 전략을 사용
        generator = "quiz_result_no_seq" // quiz_result_no_seq 시퀀스 제너레이터 사용
    )
    private int result_id; // 퀴즈 결과 고유 ID
    
    private int user_id; // 사용자 ID
    private int quiz_id; // 퀴즈 ID
    
    private char answered_correctly; // 정답 여부 (Y/N)

    private Integer earned_points; // 적립된 포인트, Integer로 변경하여 0도 가능하게 설정

    @CreationTimestamp // 생성 시 자동으로 타임스탬프 삽입
    private Date attempt_date; // 퀴즈 시도 일시, Date로 변경하여 정확한 날짜 저장

	

    // 필요한 경우 추가적인 메서드나 로직을 여기에 추가할 수 있습니다.
}
