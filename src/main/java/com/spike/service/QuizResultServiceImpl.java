package com.spike.service;

import com.spike.dao.QuizResultDAO;


import com.spike.dto.QuizResultDTO;
import com.spike.dto.UserDTO;
import com.spike.repository.UserRepository;
import com.spike.dto.QuizDTO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;


@Service
public class QuizResultServiceImpl implements QuizResultService {

	@Autowired
	private QuizResultDAO quizResultDAO;

	@Autowired
	private QuizService quizService;

	@Autowired
	private UserRepository userRepository;




	@Override
	public QuizResultDTO handleQuizResult(Long userId, int quizId, char answeredCorrectly) {
		String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

		if (canUserAttemptQuizToday(userId, todayDate)) {
			QuizDTO quiz = quizService.getQuizById(quizId);  // 퀴즈 정보 조회

			QuizResultDTO quizResult = new QuizResultDTO();
			quizResult.setQuiz(quiz);  // 퀴즈 정보 설정
			quizResult.getUser_id(); // 사용자 ID 설정
			quizResult.setAnswered_correctly(answeredCorrectly);  // 정답 여부 설정
			quizResult.setEarned_points(answeredCorrectly == 'Y' ? 10 : 0);  // 정답시 포인트 부여
			quizResult.setAttempt_date(new Date());  // 현재 시간 설정

			quizResultDAO.saveQuizResult(quizResult);  // 퀴즈 결과 저장

			updateUserPoints(userId, quizResult.getEarned_points());  // 사용자 포인트 업데이트

			return quizResult;  // 퀴즈 결과 반환
		} else {
			throw new IllegalStateException("오늘은 5개의 퀴즈만 시도할 수 있습니다.");
		}
	}

	@Override
	public boolean canUserAttemptQuizToday(Long userId, String date) {
		int attemptCount = quizResultDAO.countQuizAttemptsToday(userId, date);
		return attemptCount < 5;  // 오늘 시도한 퀴즈가 5개 미만이면 시도 가능
	}

	@Override
	public boolean attemptQuiz(Long userId, int quizId, String userAnswer) {
		QuizDTO quiz = quizService.getQuizById(quizId);  // 퀴즈 정보 조회

		boolean isCorrect = checkAnswer(quizId, userAnswer);  // 정답 여부 확인
		char answeredCorrectly = isCorrect ? 'Y' : 'N';

		QuizResultDTO result = new QuizResultDTO();
		result.setQuiz(quiz);  // 퀴즈 정보 설정
		result.getUser_id();  // 사용자 ID 설정
		result.setAnswered_correctly(answeredCorrectly);  // 정답 여부 설정
		result.setEarned_points(isCorrect ? 10 : 0);  // 포인트 설정
		result.setAttempt_date(new Date());  // 현재 시간 설정

		quizResultDAO.saveQuizResult(result);  // 퀴즈 결과 저장

		updateUserPoints(userId, result.getEarned_points());  // 사용자 포인트 업데이트

		return true;
	}

	private boolean checkAnswer(int quizId, String userAnswer) {
		QuizDTO quiz = quizService.getQuizById(quizId);
		return quiz.getCorrect_answer().equals(userAnswer);  // 실제 정답 비교
	}

	@Override
	public int getUserTotalPoints(Long userId) {
		UserDTO user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
		return user.getPoints();  // 포인트 반환
	}

	@Override
	public void updateUserPoints(Long userId, int earnedPoints) {
		UserDTO user = userRepository.findById(userId).orElseThrow(() -> new RuntimeException("User not found"));
		user.setPoints(user.getPoints() + earnedPoints);  // 기존 포인트에 추가
		userRepository.save(user);  // 포인트 업데이트 후 저장
	}

	@Override
	public void saveQuizResult(QuizResultDTO quizResult) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean canAttemptQuizToday(Long userId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public QuizResultDTO getQuizResult(Long userId, int quizId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateUserScore(Long userId, int i) {
		// TODO Auto-generated method stub
		
	}
}

