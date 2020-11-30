package com.bit.backpackers.service;

import java.sql.SQLException;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.GearVo;

public interface GearService {

		void listService(Model model) throws SQLException;

		void oneAddService(GearVo bean) throws SQLException;

		void detailService(Model model, int gearNo) throws SQLException;

		void oneEditService(GearVo bean) throws SQLException;

		void oneDelService(int gearNo) throws SQLException;

	}