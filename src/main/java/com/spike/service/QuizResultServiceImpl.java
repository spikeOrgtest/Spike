package com.spike.service;

import com.spike.dao.QuizResultDAO;
import com.spike.dto.QuizResultDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.text.SimpleDateFormat;

@Service // 이 클래스는 Service 계층의 구성 요소로, 비즈니스 로직을 처리하는 클래스입니다.
public class QuizResultServiceImpl implements QuizResultService {

    @Autowired // DAO 객체를 주입받아 DB와 상호작용합니다.
    private QuizResultDAO quizResultDAO;

    // 사용자가 퀴즈 결과를 처리하는 메소드
    @Override
    public QuizResultDTO handleQuizResult(int userId, int quizId, char answeredCorrectly) {
        // 오늘 날짜를 구하는 SimpleDateFormat 사용
        String todayDate = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

        // 사용자가 오늘 퀴즈를 5개 이상 시도했는지 여부를 확인
        if (canUserAttemptQuizToday(userId, todayDate)) {
            // 새로운 퀴즈 결과 객체 생성
            QuizResultDTO result = new QuizResultDTO();
            result.setUser_id(userId); // 사용자 ID 설정
            result.setQuiz_id(quizId); // 퀴즈 ID 설정
            result.setAnswered_correctly(answeredCorrectly); // 정답 여부 설정
            result.setEarned_points(answeredCorrectly == 'Y' ? 10 : 0); // 정답 시 포인트 부여 (예: 정답 10점, 오답 0점)

            // 퀴즈 결과를 DB에 저장하고 결과를 반환
            return quizResultDAO.saveQuizResult(result); // 저장된 결과 반환
        } else {
            // 사용자가 오늘 퀴즈를 5개 이상 풀었을 경우 예외 발생
            throw new IllegalStateException("오늘은 5개의 퀴즈만 시도할 수 있습니다."); // 예외 발생
        }
    }

    // 사용자가 오늘 퀴즈를 몇 번 시도했는지 확인
    @Override
    public boolean canUserAttemptQuizToday(int userId, String date) {
        // 사용자가 오늘 퀴즈를 몇 번 시도했는지 확인
        int attemptCount = quizResultDAO.countQuizAttemptsToday(userId, date);

        // 시도 횟수가 5번 미만이면 true 반환
        return attemptCount < 5; // 5번 미만이면 퀴즈 시도 가능
    }

    // 퀴즈를 시도한 결과에 따라 퀴즈 결과를 저장하거나 처리하는 메소드
    @Override
    public boolean attemptQuiz(int userId, int quizId, String userAnswer) {
        // 퀴즈의 정답 여부를 확인
        QuizResultDTO quizResult = quizResultDAO.findQuizResultByUserIdAndQuizId(userId, quizId);
        
        // 사용자가 퀴즈를 풀었는지 여부를 체크
        if (quizResult != null) {
            // 이미 푼 퀴즈라면 false 반환 (퀴즈는 한 번만 풀 수 있음)
            return false;
        }

        // 사용자가 퀴즈를 처음 푼 경우
        boolean isCorrect = checkAnswer(quizId, userAnswer); // 정답을 확인하는 메소드 (추가 구현 필요)
        char answeredCorrectly = isCorrect ? 'Y' : 'N';

        // 퀴즈 결과 객체 생성
        QuizResultDTO result = new QuizResultDTO();
        result.setUser_id(userId); // 사용자 ID 설정
        result.setQuiz_id(quizId); // 퀴즈 ID 설정
        result.setAnswered_correctly(answeredCorrectly); // 정답 여부 설정
        result.setEarned_points(isCorrect ? 10 : 0); // 정답이면 포인트 부여 (예: 정답 10점, 오답 0점)

        // 퀴즈 결과 DB에 저장
        quizResultDAO.saveQuizResult(result);

        return true; // 퀴즈가 성공적으로 저장되었음을 반환
    }

    // 퀴즈 결과를 저장하는 메소드
    @Override
    public void saveQuizResult(QuizResultDTO quizResult) {
        // QuizResultDTO 객체를 DB에 저장하는 로직을 구현해야 합니다.
        quizResultDAO.saveQuizResult(quizResult); // quizResultDAO를 통해 DB에 저장
    }

    // 사용자가 푼 퀴즈 결과를 조회하는 메소드
    @Override
    public QuizResultDTO getQuizResult(int userId, int quizId) {
        // 사용자 ID와 퀴즈 ID로 퀴즈 결과를 조회하여 반환하는 로직을 구현해야 합니다.
        QuizResultDTO result = quizResultDAO.findQuizResultByUserIdAndQuizId(userId, quizId); // DB에서 퀴즈 결과 조회
        return result; // 결과 반환
    }

    // 정답 여부를 확인하는 메소드 (단순히 예시로 구현)
    private boolean checkAnswer(int quizId, String userAnswer) {
        // 실제 퀴즈의 정답을 DB에서 조회해야 하며, userAnswer와 비교
        // 이 예시에서는 'O'가 정답으로 설정되었다고 가정
        return "O".equals(userAnswer); // 예시로 "O"가 정답
    }

	@Override
	public boolean canAttemptQuizToday(int userId) {
		// TODO Auto-generated method stub
		return false;
	}
}
