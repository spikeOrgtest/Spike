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
@SequenceGenerator(name = "quiz_result_no_seq", sequenceName = "quiz_result_no_seq", initialValue = 1, allocationSize = 1)
@Table(name = "QuizResult")
@EqualsAndHashCode(of = "result_id")

public class QuizResultDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quiz_result_no_seq")
    private int result_id;  // 퀴즈 결과 고유 ID

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quiz_id")  // 퀴즈 ID 외래 키
    private QuizDTO quiz;  // 퀴즈와의 관계 설정

    @ManyToOne
    @JoinColumn(name = "user_id")  // 사용자 ID 외래 키
    private UserDTO user;  // 사용자와의 관계 설정

    private char answered_correctly;  // 정답 여부 (Y or N)
    private Integer earned_points;  // 적립된 포인트
    private Date attempt_date;   // 퀴즈 시도 일자
    
    

    // user_id를 반환하는 메서드 (user 객체에서 가져오기)
    public Long getUser_id() {
        return user != null ? user.getUser_id() : 0; // user가 null일 경우 0 반환
    }
}
