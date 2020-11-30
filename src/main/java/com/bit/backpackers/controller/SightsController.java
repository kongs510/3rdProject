package com.bit.backpackers.controller;

import java.sql.SQLException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.backpackers.model.entity.SightsVo;
import com.bit.backpackers.service.SightsService;


@Controller
@RequestMapping("/sights")
public class SightsController {
	@Inject
	SightsService sightsService;
	
	@RequestMapping(value = "/map",method = RequestMethod.GET)
	public String markar(Model model) throws SQLException {
		sightsService.listService(model);
		return "/sights/sightsMap";
	}
	
	@RequestMapping(value = "/list",method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		sightsService.listService(model);
		return "/sights/sights";
	}
	
	@RequestMapping(value = "/add", method=RequestMethod.POST)
	public String insert(@ModelAttribute SightsVo bean) {
		try {
			sightsService.oneAddService(bean);
		} catch (SQLException e) {
			return "redirect:/sights/list";
		}
		return "redirect:/sights/list";
	}
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add() {
		return "/sights/sightsAdd";
	}
	
	@RequestMapping(value = "/{sightsNo}",method=RequestMethod.GET)
	public String detail(@PathVariable int sightsNo,Model model) throws SQLException{
		sightsService.detailService(model,sightsNo);
		return "/sights/sightsDetail";
	}
	@RequestMapping("/{sightsNo}/edit")
	public String edit(@PathVariable int sightsNo,Model model) throws SQLException{
		sightsService.detailService(model, sightsNo);
		return "/sights/sightsEdit";
	}
	@RequestMapping(value = "/{sightsNo}",method=RequestMethod.PUT)
	public ModelAndView update(@PathVariable int sightsNo,@ModelAttribute SightsVo bean) throws SQLException{
		sightsService.oneEditService(bean);
		return new ModelAndView("redirect:/sights/{sightsNo}");
	}
	@RequestMapping(value = "/{sightsNo}",method = RequestMethod.DELETE)
	public String delete(@PathVariable int sightsNo) throws SQLException{
		sightsService.oneDelService(sightsNo);
		return "redirect:/sights/list";
	}

	
}
