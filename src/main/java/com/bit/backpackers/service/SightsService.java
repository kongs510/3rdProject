package com.bit.backpackers.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.SightsVo;

public interface SightsService {

	void listService(Model model) throws SQLException;

	void oneAddService(SightsVo bean) throws SQLException;

	void detailService(Model model, int sightsNo) throws SQLException;

	void oneEditService(SightsVo bean) throws SQLException;

	void oneDelService(int sightsNo) throws SQLException;

}