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

import com.bit.backpackers.model.entity.GearVo;
import com.bit.backpackers.model.entity.SightsVo;
import com.bit.backpackers.service.GearService;



@Controller
@RequestMapping("/gear")
public class GearController {
	@Inject
	GearService gearService;

	@RequestMapping(value = "",method = RequestMethod.GET)
	public String list(Model model) throws SQLException {
		gearService.listService(model);
		return "/gear/gear";
	}
	
	@RequestMapping(value = "/add",method=RequestMethod.POST)
	public String insert(@ModelAttribute GearVo bean) {
		try {
			gearService.oneAddService(bean);
		} catch (SQLException e) {
			return "redirect:/gear";
		}
		return "redirect:/gear";
	}
	@RequestMapping(value="/add",method = RequestMethod.GET)
	public String add() {
		return "/gear/gearAdd";
	}
	
	@RequestMapping(value = "/{gearNo}",method=RequestMethod.GET)
	public String detail(@PathVariable int gearNo,Model model) throws SQLException{
		gearService.detailService(model,gearNo);
		return "/gear/gearDetail";
	}
	@RequestMapping("/{gearNo}/edit")
	public String edit(@PathVariable int gearNo,Model model) throws SQLException{
		gearService.detailService(model, gearNo);
		return "/gear/gearEdit";
	}
	@RequestMapping(value = "/{gearNo}",method=RequestMethod.PUT)
	public ModelAndView update(@PathVariable int gearNo,@ModelAttribute GearVo bean) throws SQLException{
		gearService.oneEditService(bean);
		return new ModelAndView("redirect:/gear/{gearNo}");
	}
	
	@RequestMapping(value = "/{gearNo}",method = RequestMethod.DELETE)
	public String delete(@PathVariable int gearNo) throws SQLException{
		gearService.oneDelService(gearNo);
		return "redirect:/gear";
	}

}
