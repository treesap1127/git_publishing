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
	@GetMapping("/update/{cinemaCode}")
	public String update() {
		//상영관명 //상영관코드 //좌석 상영관 명이랑 상영관 코드 있는 버튼 만들어서 상영관 좌석 띄우기! 
		//아래에 좌석 페이지 띄우고 추가 할 수 있도록 ㅇㅇ 위 테이블 클릭 하면 포커스 아래로 맞춰지고 좌석 페이지 수정, 등록으로 돌아가기로 변경
		//상영관 수 10개로 한정
		return path+"sitpage";
		
	}
	@GetMapping("/cinemaMovie/{cinemaCode}")
	public String cinemaMovie() {
		return path;
		
	}
	
}
