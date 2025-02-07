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
    private Long historyId;  // 포인트 사용 내역 고유 ID
    
    @ManyToOne(fetch = FetchType.LAZY)  // User와 연결된 관계
    @JoinColumn(name = "userId")  // 사용자 ID 외래 키
    private UserDTO user;  // 사용자가 누구인지 연결
    
    @ManyToOne(fetch = FetchType.LAZY)  // GiftIcon과 연결된 관계
    @JoinColumn(name = "giftconId")  // 기프티콘 ID 외래 키
    private GiftIconDTO giftIcon;  // 사용된 기프티콘 (기프티콘 이름과 가격을 가져옴)

    @Column(nullable = false)
    private LocalDateTime useDate;  // 포인트 사용 일시 (기록된 시각)

    // 사용한 포인트는 기프티콘의 가격을 가져와서 계산할 수 있습니다.
    public Long getUsedPoints() {
        return this.giftIcon != null ? this.giftIcon.getPrice() : 0L;  // 기프티콘 가격을 가져와 사용 포인트로 설정
    }

    // 남은 포인트는 UserDTO에서 동적으로 계산할 수 있습니다.
    public Long getRemainingPoints() {
        return this.user != null ? this.user.getPoint() - getUsedPoints() : 0L;  // 사용자의 포인트에서 사용된 포인트를 뺌
    }

    @PrePersist
    protected void onCreate() {
        this.useDate = LocalDateTime.now();  // 사용 날짜는 현재 날짜로 자동 설정
    }

    // 사용 내역을 기프티콘 이름으로 설정
    public String getGiftIconName() {
        return this.giftIcon != null ? this.giftIcon.getGiftconName() : "N/A";  // 기프티콘 이름을 가져옴
    }
}
