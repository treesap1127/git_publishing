package kr.ac.kopo.movie_project.controller;

import java.util.HashMap;
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
import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.service.MypageService;

@Controller
@RequestMapping("myPage/")
public class MypageController {
	@Autowired
	MypageService service;
	final String path="myPage/";
	
	@GetMapping("myPage")//마이페이지메인
	public String mypage() {
		return path+"myPage";
	}
	@GetMapping("mymovie")//나의 영화목록
	public String mymovie() {
		return path+"myMovie";
	}
	@GetMapping("mygrade")//나의 평점
	public String mygrade() {
		return path+"myGrade";
	}
	@GetMapping("myCinema")//마이페이지(고객)
	public String myCinema(Model model,HttpSession session,Member member) {
		member=(Member) session.getAttribute("member");
		String id=member.getId();
		List<MovieAdmin> list=service.list(id);
		model.addAttribute("list", list);
		return path+"myCinema";
	}
	@GetMapping("theater/{cinemaCode}")//마이페이지(영화관)
	public String theater(@PathVariable String cinemaCode,Model model,MovieAdmin item) {
		item.setCinemaCode(cinemaCode);
		model.addAttribute("data",item);
		List<Theater> list =service.theaterlist(cinemaCode);
		model.addAttribute("list",list);
		return path+"sitpage";
	}
	@GetMapping("theater/add/{cinemaCode}")//마이페이지 등록(영화관)
	public String theateradd(@PathVariable String cinemaCode,Model model,MovieAdmin item) {
		item.setCinemaCode(cinemaCode);
		model.addAttribute("data",item);
		return path+"theaterPage";
	}
	@ResponseBody					//마이페이지 등록(영화관)
	@PostMapping("theater/add/sit_add")//상영관 등록 ajax
	public Object sit_add(@RequestBody Theater item) {
		service.sit_add(item);
		return item;
	}
	@GetMapping("theater/update/{cinemaCode}/{theaterName}")//마이페이지 수정(영화관)
	public String theaterupdate(@PathVariable String cinemaCode,@PathVariable String theaterName,Model model,MovieAdmin item) {
		item.setCinemaCode(cinemaCode);
		model.addAttribute("data",item);
		List<Theater> list=service.theaterlist(cinemaCode,theaterName);
		model.addAttribute("list",list);
		return path+"situpdate";
	}
	@ResponseBody							//마이페이지 수정(영화관)
	@PostMapping("theater/update/sit_update")//상영관 수정 ajax
	public Object sit_update(@RequestBody Theater item) {
		System.out.println("성공");
		service.sitUpdate(item);
		return item;
	}
	@GetMapping("theater/delete/{cinemaCode}/{theaterName}")//상영관 삭제
	public String theaterdelete(@PathVariable String cinemaCode,@PathVariable String theaterName) {
		service.theater_delete(cinemaCode,theaterName);
		return "redirect:../../{cinemaCode}";
	}
	@GetMapping("delete/{cinemaCode}")
	public String delete(@PathVariable String cinemaCode) {
		service.delete(cinemaCode);
		return "redirect:../myCinema";
	}
	@GetMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}")
	public String movieList(@PathVariable String cinemaCode,@PathVariable String theaterName,Model model,Movie item) {
		item.setCinemaCode(cinemaCode);
		item.setTheaterName(theaterName);
		model.addAttribute("data",item);
		HashMap<String, Object> map=new HashMap<String, Object>();
		map.put("cinemaCode", cinemaCode);
		map.put("theaterName", theaterName);
		List<Movie> list =service.movielist(map);
		model.addAttribute("list",list);
		return path+"theaterMovie";
	}
	@GetMapping("theater/cinemaMovie/{cinemaCode}/add/{theaterName}")
	public String movieadd(@PathVariable String cinemaCode,@PathVariable String theaterName,Movie item,Model model) {
		item.setCinemaCode(cinemaCode);
		item.setTheaterName(theaterName);
		model.addAttribute("item", item);
		return path+"theaterMovieAdd";
	}
	@PostMapping("theater/cinemaMovie/{cinemaCode}/add/{theaterName}")
	public String movieadd(@PathVariable String cinemaCode,@PathVariable String theaterName,Movie item) {
		System.out.println("item="+item.getMovieName());
		System.out.println("item="+item.getMovieDate());
		System.out.println("item="+item.getMovieTime());
		item.setCinemaCode(cinemaCode);
		item.setTheaterName(theaterName);
		service.movieadd(item);
		return "redirect:../../";
		
	}
	
}

