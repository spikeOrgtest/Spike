package com.spike.service;

import com.spike.dto.QuizResultDTO; // 퀴즈 결과 DTO 객체를 가져옵니다.

public interface QuizResultService {

    /**
     * 사용자가 퀴즈를 풀고 그 결과를 처리하는 메소드.
     * 
     * 이 메소드는 사용자가 퀴즈를 풀고 정답 여부에 따라 퀴즈 결과를 처리하여 저장합니다. 
     * 사용자가 오늘 퀴즈를 5개 이상 시도했으면 예외를 던집니다.
     * 
     * @param userId          사용자의 ID
     * @param quizId          퀴즈의 ID
     * @param answeredCorrectly 정답 여부 ('Y' or 'N')
     * @return 처리된 퀴즈 결과를 담은 `QuizResultDTO` 객체
     */
    QuizResultDTO handleQuizResult(int userId, int quizId, char answeredCorrectly);

    /**
     * 사용자가 오늘 퀴즈를 시도할 수 있는지 확인하는 메소드.
     * 
     * 이 메소드는 사용자가 오늘 퀴즈를 이미 5번 이상 시도했는지 확인합니다. 
     * 5번 이상 시도한 경우 더 이상 퀴즈를 풀 수 없으며, 그 외의 경우 퀴즈를 풀 수 있습니다.
     * 
     * @param userId 사용자의 ID
     * @param date   현재 날짜
     * @return 오늘 퀴즈를 시도할 수 있으면 true, 아니면 false
     */
    boolean canUserAttemptQuizToday(int userId, String date);

    /**
     * 사용자가 퀴즈를 시도하는 메소드.
     * 
     * 사용자가 퀴즈를 풀 때 호출됩니다. 
     * 사용자가 퀴즈를 풀었는지 여부와 정답을 확인하고, 그에 따라 퀴즈 결과를 저장합니다.
     * 
     * @param userId    사용자의 ID
     * @param quizId    퀴즈의 ID
     * @param userAnswer 사용자가 선택한 답변
     * @return 퀴즈가 성공적으로 처리되었으면 true, 아니면 false
     */
    boolean attemptQuiz(int userId, int quizId, String userAnswer);

    /**
     * 퀴즈 결과를 저장하는 메소드.
     * 
     * `QuizResultDTO` 객체를 데이터베이스에 저장하는 역할을 합니다. 
     * 이 메소드는 퀴즈 시도 결과를 DB에 저장하는 기능을 담당합니다.
     * 
     * @param quizResult 퀴즈 결과를 담은 `QuizResultDTO` 객체
     */
    void saveQuizResult(QuizResultDTO quizResult);

    /**
     * 사용자가 오늘 퀴즈를 시도할 수 있는지 확인하는 메소드.
     * 
     * 이 메소드는 `canUserAttemptQuizToday` 메소드와 유사하게, 사용자가 오늘 퀴즈를 
     * 더 이상 시도할 수 없는지 확인합니다. 반환값은 `true` 또는 `false`입니다.
     * 
     * @param userId 사용자의 ID
     * @return 오늘 퀴즈를 시도할 수 있으면 true, 아니면 false
     */
    boolean canAttemptQuizToday(int userId);

    /**
     * 특정 사용자가 푼 퀴즈 결과를 조회하는 메소드.
     * 
     * 이 메소드는 주어진 `userId`와 `quizId`를 기반으로 해당 사용자가 푼 퀴즈의 결과를 조회합니다.
     * `QuizResultDTO` 객체를 반환하며, 조회된 퀴즈 결과가 없을 경우 null을 반환할 수 있습니다.
     * 
     * @param userId 사용자의 ID
     * @param quizId 퀴즈의 ID
     * @return 조회된 퀴즈 결과를 담은 `QuizResultDTO` 객체 (없으면 null 반환)
     */
    QuizResultDTO getQuizResult(int userId, int quizId);
}
