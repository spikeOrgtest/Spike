package com.spike.dto;

import java.time.LocalDateTime;

import javax.persistence.*;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@Entity
@SequenceGenerator(name = "pointHistorySeq", sequenceName = "point_history_seq", initialValue = 1, allocationSize = 1)
@Table(name = "PointHistory")
@EqualsAndHashCode(of = "historyId")  // historyId를 기준으로 비교하도록 설정
public class PointHistoryDTO {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "pointHistorySeq")
    @SequenceGenerator(name = "pointHistorySeq", sequenceName = "POINT_HISTORY_SEQ", allocationSize = 1)
    private Long historyId;  // 포인트 사용 내역 고유 ID
    
    @ManyToOne(fetch = FetchType.LAZY)  // User와 연결된 관계
    @JoinColumn(name = "userId", nullable = false)  // 사용자 ID 외래 키
    private UserDTO user;  // 사용자가 누구인지 연결
    
    @ManyToOne(fetch = FetchType.LAZY)  // GiftIcon과 연결된 관계
    @JoinColumn(name = "giftconId", nullable = false)  // 기프티콘 ID 외래 키
    private GiftIconDTO giftIcon;  // 사용된 기프티콘 (기프티콘 이름과 가격을 가져옴)

    @Column(nullable = false, updatable = false)
    private LocalDateTime useDate;  // 포인트 사용 일시 (기록된 시각)
    
    // 0208 추가
    @Column(length = 225, nullable = false)
    private String giftIconName;
    
    @Column(nullable = false)
    private Long usedPoints;  // 사용한 포인트

    @Column(nullable = false)
    private Long remainingPoints;  // 남은 포인트

    /* 0208 확인 후 삭제 예정
    // 사용한 포인트는 기프티콘의 가격을 가져와서 계산할 수 있습니다.
    public Long getUsedPoints() {
        return this.giftIcon != null ? this.giftIcon.getPrice() : 0L;  // 기프티콘 가격을 가져와 사용 포인트로 설정
    }

    // 남은 포인트는 UserDTO에서 동적으로 계산할 수 있습니다.
    public Long getRemainingPoints() {
        return this.user != null ? this.user.getPoint() - getUsedPoints() : 0L;  // 사용자의 포인트에서 사용된 포인트를 뺌
    }
    */
    
    @Override
    public String toString() {
        return "PointHistoryDTO{" +
                "historyId=" + historyId +
                ", user=" + (user != null ? user.getUserId() : null) +
                ", giftIcon=" + (giftIcon != null ? giftIcon.getGiftconName() : null) +
                ", useDate=" + useDate +
                ", usedPoints=" + usedPoints +
                ", remainingPoints=" + remainingPoints +
                '}';
    }

    @PrePersist
    protected void onCreate() {
        if (this.useDate == null) {
            this.useDate = LocalDateTime.now();  // 저장 시 자동으로 현재 시간 설정
        }
        if (this.giftIcon != null) {
            this.giftIconName = this.giftIcon.getGiftconName();  // 기프티콘 이름 저장
            this.usedPoints = this.giftIcon.getPrice();  // 사용 포인트 자동 설정
        } else {
            this.giftIconName = "N/A";  
            this.usedPoints = 0L;
        }
        
        // 차감 후 포인트를 기반으로 남은 포인트 계산
        if (this.user != null) {
            // 유저가 이미 갱신된 상태인지 확인하고, 차감된 포인트 계산 후 남은 포인트 업데이트
            long currentPoints = this.user.getPoint();  // 실제 포인트 조회
            this.remainingPoints = currentPoints - this.usedPoints;  // 남은 포인트 계산
        } else {
            this.remainingPoints = 0L;  // user가 없으면 남은 포인트 0
        }
    }

    // 사용 내역을 기프티콘 이름으로 설정
    public String getGiftIconName() {
        return this.giftIcon != null ? this.giftIcon.getGiftconName() : "N/A";  // 기프티콘 이름을 가져옴
    }
}
