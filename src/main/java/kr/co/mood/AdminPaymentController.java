package kr.co.mood;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import kr.co.mood.Payment.DAO.AdminPaymentService;
import kr.co.mood.Payment.VO.KakaoCancelResponseVO;
import kr.co.mood.Payment.VO.KakaoPayApprovalVO;
import kr.co.mood.Payment.controller.KakaoPay;
import kr.co.mood.module.ModuleCommon;
import kr.co.mood.pay.DAO.KakaoPayApprovalService;
import kr.co.mood.pay.DAO.KakaoPayApprovalServiceImpl;

@RequestMapping("/admin")
@Controller
public class AdminPaymentController {

	@Autowired
	private KakaoPay kakaoPay;

	@Autowired
	private AdminPaymentService adminService;
	
	@Autowired
	private ModuleCommon module;
	
	

	@RequestMapping("/payment")
	public String adminPaymentDefault(HttpServletRequest request) {
		return "redirect:/admin/payment/1";
	}

	@RequestMapping("/payment/{num}")
	public String adminPaymentPaging(@PathVariable("num") String num, Model model) {
		adminService.adminPaymentList(model, num);
		model.addAttribute("num", num);
		return "admin/adminPayment";
	}
	
	@RequestMapping("/payment/{paging}/{searchWhat}/{search}")
	@ResponseBody
	public Map<String, Object> adminPaymentPagingSearching(@PathVariable String paging,@PathVariable String searchWhat,@PathVariable String search, Model model){
		   Map<String, Object> map = adminService.adminPaymentSearchingList(model, paging, searchWhat, search);
		return map;	
	}
	

@RequestMapping(value = "/kakaoPayCancel" )
public String payCancel(Model model, String orderid) {
	
		KakaoPayApprovalVO vo = adminService.adminPaymentCancel(Integer.parseInt(orderid));	
		try {
			kakaoPay.kakaoCancel(vo.getTid(),Integer.toString(vo.getPrice()), null, vo.getOrderId());
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:/admin/chart";
		}
	   return "redirect:/admin/payment";
}

}
