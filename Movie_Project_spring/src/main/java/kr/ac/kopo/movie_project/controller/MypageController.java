package kr.ac.kopo.movie_project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.Member;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.service.MypageService;

@Controller
@RequestMapping("myPage")
public class MypageController {
	@Autowired
	MypageService service;
	final String path="myPage/";
	
	@GetMapping("/myPage")
	public String mypage() {
		return path+"myPage";
	}
	@GetMapping("/mymovie")
	public String mymovie() {
		return path+"myMovie";
	}
	@GetMapping("/mygrade")
	public String mygrade() {
		return path+"myGrade";
	}
	@GetMapping("/myCinema")
	public String myCinema(Model model,HttpSession session,Member member) {
		member=(Member) session.getAttribute("member");
		String id=member.getId();
		List<MovieAdmin> list=service.list(id);
		model.addAttribute("list", list);
		return path+"myCinema";
	}
	
}
