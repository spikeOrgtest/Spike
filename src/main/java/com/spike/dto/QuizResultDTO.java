package com.spike.dto;

import javax.persistence.*;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(name = "quizResultNoSeq", sequenceName = "quizResultNoSeq", initialValue = 1, allocationSize = 1)
@Table(name = "QuizResult")
@EqualsAndHashCode(of = "resultId")

public class QuizResultDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quizResultNoSeq")
    private int resultId;  // 퀴즈 결과 고유 ID
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quizId")  // 퀴즈 ID 외래 키
    private QuizDTO quiz;  // 퀴즈와의 관계 설정

    @ManyToOne
    @JoinColumn(name = "userId")  // 사용자 ID 외래 키
    private UserDTO user;  // 사용자와의 관계 설정

    private char answeredCorrectly;  // 정답 여부 (Y or N)
    private Integer earnedPoints;  // 적립된 포인트
    private Date attemptDate;   // 퀴즈 시도 일자
    
    // 엔티티가 처음 저장될 때 현재 시간 설정
    @PrePersist
    protected void onCreate() {
        this.attemptDate = new Date();
    }
    
    // user_id를 반환하는 메서드 (user 객체에서 가져오기)
    public Long getUser_id() {
        return user != null ? user.getUserId() : 0; // user가 null일 경우 0 반환
    }
}
