package com.spike.dto;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.time.LocalDate;
import java.time.Period;

public class MinAge18Validator implements ConstraintValidator<MinAge18, LocalDate> {

    @Override
    public void initialize(MinAge18 constraintAnnotation) {
        // 초기화 작업 (필요하면 구현)
    }

    @Override
    public boolean isValid(LocalDate birthDate, ConstraintValidatorContext context) {
        if (birthDate == null) {
            return false; // null 값 처리
        }

        // 현재 날짜와 생년월일 차이 계산
        Period period = Period.between(birthDate, LocalDate.now());

        // 나이가 18세 이상인지 확인
        return period.getYears() >= 18;
    }
}
