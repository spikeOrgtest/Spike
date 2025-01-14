package com.spike.dto;

import java.sql.Timestamp;

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
@Entity
@SequenceGenerator( // 시퀀스 생성기
    name = "quiz_no_seq", // 시퀀스 제네레이터 이름
    sequenceName = "quiz_seq", // 시퀀스 이름
    initialValue = 1, // 시작값
    allocationSize = 1 // 증가값
)
@Table(name = "Quiz") // 테이블 이름
@EqualsAndHashCode(of = "quiz_id") // quiz_id를 기준으로 equals와 hashCode 구현
public class QuizDTO {
    
    @Id // 기본 키
    @GeneratedValue(
        strategy = GenerationType.SEQUENCE, // SEQUENCE 전략을 사용
        generator = "quiz_no_seq" // quiz_no_seq 시퀀스 제너레이터 사용
    )
    private int quiz_id; // 퀴즈 고유 ID
    
    private String question; // 퀴즈 질문
    private String correct_answer; // 정답 (O 또는 X)
    private int points; // 퀴즈 성공 시 적립 포인트
    
    @CreationTimestamp // 생성 시 자동으로 타임스탬프 삽입
    private Timestamp last_attempt_date; // 마지막 퀴즈 도전 날짜

	public Object getCorrectAnswer() {
		 return correct_answer;
    }

    public void setCorrect_answer(String correct_answer) {
        this.correct_answer = correct_answer;
    }
}

