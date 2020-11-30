package com.bit.backpackers.model.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor 
@Data
@ToString
public class option_tableVo {

	
	private int optionId;
	private String optionCode,optionName,optionGroupCode;
	
}
