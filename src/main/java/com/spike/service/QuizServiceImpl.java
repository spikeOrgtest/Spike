package com.spike.service;

import com.spike.dao.QuizDAO;  // QuizDAO를 임포트합니다. QuizDAO는 데이터베이스에서 퀴즈 정보를 가져오고, 사용자 퀴즈 시도 정보를 저장하는 역할을 합니다.
import com.spike.dto.QuizDTO;  // QuizDTO를 임포트합니다. 이 객체는 퀴즈에 대한 정보를 담고 있는 데이터 전송 객체입니다.
import org.springframework.beans.factory.annotation.Autowired;  // Spring의 의존성 주입 어노테이션
import org.springframework.stereotype.Service;  // Spring 서비스 클래스를 정의하는 어노테이션
import java.util.Date;  // 날짜와 시간을 처리하기 위한 클래스를 임포트합니다.

@Service  // 이 클래스가 Spring의 서비스 클래스임을 명시합니다.
public class QuizServiceImpl implements QuizService {

    @Autowired  // 의존성 주입을 통해 QuizDAO 객체를 자동으로 주입합니다.
    private QuizDAO quizDao;  // QuizDAO 인스턴스, 데이터베이스와 상호작용하는 객체

    @Override
    public boolean attemptQuiz(int userId, int quizId, String userAnswer) {
        // 사용자가 퀴즈를 시도할 때 호출되는 메소드입니다.
        // userId는 사용자의 고유 ID, quizId는 퀴즈의 고유 ID, userAnswer는 사용자가 입력한 답입니다.

        QuizDTO quiz = quizDao.getQuizById(quizId);  // 퀴즈 ID에 해당하는 퀴즈 정보를 데이터베이스에서 가져옵니다.

        if (quiz != null) {  // 퀴즈가 정상적으로 존재하는 경우
            boolean isCorrect = quiz.getCorrectAnswer().equals(userAnswer);  // 사용자가 제출한 답이 정답과 일치하는지 확인
            saveQuizAttempt(quizId, userId, isCorrect);  // 퀴즈 시도를 저장 (정답 여부와 함께)
            return isCorrect;  // 정답 여부를 반환 (맞으면 true, 틀리면 false)
        }
        return false;  // 퀴즈가 없으면 false 반환
    }

    @Override
    public void saveQuizAttempt(int quizId, int userId, boolean isCorrect) {
        // 퀴즈 시도에 대한 정보를 저장하는 메소드입니다.
        // quizId는 퀴즈의 고유 ID, userId는 사용자의 ID, isCorrect는 정답 여부입니다.

        if (isCorrect) {
            // 사용자가 퀴즈를 맞혔다면 포인트를 적립하는 로직을 여기에 추가할 수 있습니다.
            // 예를 들어, 사용자의 포인트를 데이터베이스에 저장하는 코드가 필요할 수 있습니다.
        }

        quizDao.updateLastAttemptDate(quizId);  // 퀴즈를 푼 날짜를 업데이트합니다. 사용자가 퀴즈를 푼 날짜를 기록하여, 이후 퀴즈를 시도할 때 관리할 수 있도록 합니다.
    }

    @Override
    public boolean canAttemptQuizToday(int userId) {
        // 사용자가 오늘 푼 퀴즈 개수가 5개 이하인지를 확인하는 메소드입니다.
        // userId는 사용자의 고유 ID입니다.

        int attempts = quizDao.countUserQuizAttempts(userId, new Date().toString());  // 오늘 사용자가 푼 퀴즈 개수를 데이터베이스에서 조회합니다.
        return attempts < 5;  // 5개 이하로 퀴즈를 풀었다면 true 반환, 그렇지 않으면 false 반환
    }
}
