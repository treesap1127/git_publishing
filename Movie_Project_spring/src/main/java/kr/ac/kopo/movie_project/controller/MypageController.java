package kr.ac.kopo.movie_project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.movie_project.model.Member;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
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
	public String update(@PathVariable String cinemaCode,Model model) {
		MovieAdmin item =new MovieAdmin();
		item.setCinemaCode(cinemaCode);
		model.addAttribute("item",item);
		return path+"sitpage";
	}
	
	@GetMapping("/cinemaMovie/{cinemaCode}")
	public String cinemaMovie() {
		return path;
	}
	@ResponseBody
	@PostMapping("/update/sit_add")
	public Object sit_add(@RequestBody Theater item) {
		System.out.println("좌석"+item.getSit());
		System.out.println("코드"+item.getCinemaCode());
		return item;
	}

}

