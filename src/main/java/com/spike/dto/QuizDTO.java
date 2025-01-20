package com.spike.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

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
@SequenceGenerator(name = "quiz_no_seq_name", sequenceName = "quiz_no_seq", initialValue = 1, allocationSize = 1)
@Table(name = "Quiz")
@EqualsAndHashCode(of = "quiz_id")
public class QuizDTO {
    private int quiz_id;  // 퀴즈 ID
    private String question;  // 퀴즈 질문
    private String correctAnswer;  // 정답
    private int points;  // 포인트
    private int last_attempt_date;

    @Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "quiz_no_seq_name")
	private Integer quizid;
    public QuizDTO(int quiz_id, String question, String correctAnswer, int points) {
        this.quiz_id = quiz_id;
        this.question = question;
        this.correctAnswer = correctAnswer;
        this.points = points;
    }

    // getter, setter 추가
    public int getQuizId() {
        return quiz_id;
    }

    public void setQuizId(int quiz_id) {
        this.quiz_id = quiz_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

	public int getLast_attempt_date() {
		return last_attempt_date;
	}

	public void setLast_attempt_date(int last_attempt_date) {
		this.last_attempt_date = last_attempt_date;
	}
    
    
}
