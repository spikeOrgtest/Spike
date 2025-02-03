package com.spike.dto;

import javax.persistence.*;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import java.util.List;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(name = "quizNoSeq", sequenceName = "quizNoSeq", initialValue = 1, allocationSize = 1)
@Table(name = "Quiz")
@EqualsAndHashCode(of = "quizId")
public class QuizDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quizNoSeq")
    private int quizId;  // 퀴즈 고유 ID

    private String question;  // 퀴즈 질문
    private String correctAnswer;  // 정답 (O 또는 X)
    private int points;  // 퀴즈 성공 시 적립 포인트
    private String lastAttemptDate;  // 마지막 퀴즈 도전 날짜

    // QuizResultDTO와의 관계 설정 (1:N 관계)
    @OneToMany(mappedBy = "quiz", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<QuizResultDTO> quizResults;  // 퀴즈에 대한 결과들
}
