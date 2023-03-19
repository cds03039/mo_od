package kr.co.mood;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.mood.user.dao.MemberService;
import kr.co.mood.user.dao.UserVO;

@Controller
@SessionAttributes("loginUser")
@RequestMapping(value="/member/*")
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private HttpSession session;

	@RequestMapping(value="/kakaoLogin", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code ) throws Exception {
		System.out.println("#########" + code);
		
		String access_Token = ms.getAccessToken(code);
		
		
		UserVO userInfo = ms.getUserInfo(access_Token);

		
		
		
		// 아래 코드가 추가되는 내용

		// 위 코드는 session객체에 담긴 정보를 초기화 하는 코드.
		session.setAttribute("login_info", userInfo);
//		session.setAttribute("login_info", userInfo.getId());
//		session.setAttribute("login_info", userInfo.getName());
//		session.setAttribute("login_info", userInfo.getAge());
//		session.setAttribute("login_info", userInfo.getEmail());
		System.out.println("fdfd"+userInfo);
//		session.invalidate();

		return "redirect:/";
    	}

}
