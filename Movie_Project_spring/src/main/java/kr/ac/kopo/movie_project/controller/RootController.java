package kr.ac.kopo.movie_project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.movie_project.model.Member;
import kr.ac.kopo.movie_project.service.MemberService;

@Controller
public class RootController {
	final String path="login/";

	@Autowired
	MemberService memberservice;
	
	@RequestMapping("/")
	public String index(Member member, HttpSession session) {
		if(session.getAttribute("member")==null) {
			member.setGrade(0);
			session.setAttribute("member",member);
			}
		return "index";
	}
	
	@GetMapping("/login")
	public String login(Model model, HttpSession session) {
		String msg = (String) session.getAttribute("msg");		
		if(msg != null) {
			session.removeAttribute("msg");
			
			model.addAttribute("msg", msg);
		}
		return path+"login"; 	
	}
	
	@PostMapping("/login")
	public String login(Member member,HttpSession session) {
		if(memberservice.login(member)) {
			session.setAttribute("member", member);
			String target=(String) session.getAttribute("target");			
			return "redirect:"+(target==null?"/":target);
		}
		
		session.setAttribute("msg", "로그인 실패 하였습니다.");
		
		return "redirect:login";
	}

	@GetMapping("/signup")
	public String signup() {
		return path+"signup";
	}

	@PostMapping("/signup")
	public String signup(Member member,RedirectAttributes ra) {
		memberservice.add(member);
		ra.addFlashAttribute("msg", "회원가입이 완료되었습니다");
		return "redirect:.";
	}
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(String id) {

		if(memberservice.checkId(id))
			return "OK";
		else return "FAIL";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:.";
	}
	
	@GetMapping("/findid")
	public String findid() {
		return path+"findid";
	}
	
	
		
}

