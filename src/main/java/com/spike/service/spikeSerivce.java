package com.spike.service;

import com.spike.dto.spikeDTO;

public interface spikeSerivce {

	void insertMember(spikeDTO s);

	spikeDTO idCheck(String id);

	spikeDTO loginCheck(String login_id);

	spikeDTO findId(spikeDTO s);

	spikeDTO findPwd(spikeDTO s);

	spikeDTO changePwd(spikeDTO s);

	spikeDTO findMember(spikeDTO s);


}
