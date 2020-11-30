package com.bit.backpackers.member.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.member.Interceptor.AdminInterceptor;
import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.service.MemberService;
import com.bit.backpackers.model.AdminDao;
import com.bit.backpackers.model.entity.BoardVo;

import com.bit.backpackers.model.entity.brandVo;
import com.bit.backpackers.model.entity.main_categoryVo;
import com.bit.backpackers.model.entity.option_tableVo;
import com.bit.backpackers.model.entity.sub_categoryVo;
import com.bit.backpackers.service.AdminService;
import com.bit.backpackers.service.BoardService;

import com.bit.backpackers.util.Criteria;
import com.bit.backpackers.util.PageMaker;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Inject
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	private MemberService memberService;

	// 관리자페이지
	@RequestMapping(value = "/adminPage", method = RequestMethod.GET)
	public String adminpage(@ModelAttribute("loginDTO") LoginDTO loginDTO) throws Exception {
		logger.info("admin Login");
		return "/admin/adminPage";
	}
    
	@RequestMapping(value = "/addproduct", method = RequestMethod.GET)
	public String listproduct(Model model) throws Exception {

		adminService.list(model);
		adminService.list2(model);
		adminService.list3(model);
		adminService.list4(model);
		adminService.list5(model);
		return "/admin/addproduct";
	}
	//상품등록
	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String addproduct(@ModelAttribute ItemVo item) throws SQLException {

		adminService.insertproduct(item);
		return "redirect:/admin/addproduct";

	}

	//상품리스트 페이징
	@RequestMapping(value = "/deleteproduct")
	public ModelAndView deleteproductBoardList(Criteria cri) throws Exception {

		ModelAndView mav = new ModelAndView("/admin/deleteproduct");

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminService.countBoardListTotal());

		List<Map<String, Object>> list = adminService.deletelist(cri);
		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		return mav;
	}

	// 상품삭제
	@RequestMapping(value = "{itemId}/delete", method = RequestMethod.DELETE)
	public String deleteproduct(@PathVariable int itemId) throws SQLException {
		adminService.deleteproduct(itemId);
		return "redirect:/admin/deleteproduct";
	}

	  //상품디테일
	  @RequestMapping(value = "{itemId}/detail") 
	  public String productdetail(@PathVariable int itemId,Model model) throws SQLException {
		  adminService.productdetail(model, itemId);
		  return "/admin/detailproduct";
	  }
	  
	  //상품수정
     @RequestMapping(value = "{itemId}/edit",method = {RequestMethod.PUT,RequestMethod.GET})
     public String updateproduct(@PathVariable int itemId,ItemVo item,Model model,HttpServletRequest request) throws SQLException {
    	 
     if(request.getParameter("itemId") != null) {
    	 adminService.updateproduct(item);
    	 return "redirect:detail";
    	 
     }else {
    	adminService.list(model);
  		adminService.list2(model);
  		adminService.list3(model);
  		adminService.list4(model);
  		adminService.list5(model);
    	adminService.productdetail(model, itemId);
 
     }
    
    	 return "/admin/editproduct";
     }
	  
	  
	  
}
