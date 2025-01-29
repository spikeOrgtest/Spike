package com.spike.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class TransferDTO { //이체처리를 위한 데이터 전송 객체

	private Long fromAccountId;
	private String toAccount;
	private long amount;
	private String memo;
	private String accountPassword;
	private String ownerName;
	
	public TransferDTO(Long fromAccountId, String toAccount, long amount, String memo, String accountPassword, String toAccOwner) {
		this.fromAccountId = fromAccountId;
		this.toAccount = toAccount;
		this.amount = amount;
		this.memo = memo;
		this.accountPassword = accountPassword;
		this.ownerName = toAccOwner;
	}

}
