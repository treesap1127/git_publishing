package kr.ac.kopo.movie_project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.movie_project.model.Member;
import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.service.MypageService;
import kr.ac.kopo.movie_project.service.ServiceCenterservice;
import kr.ac.kopo.movie_project.model.TicketItem;
import kr.ac.kopo.movie_project.model.Ticketing;

@Controller
@RequestMapping("myPage/")
public class MypageController {
	@Autowired
	MypageService service;
	@Autowired
	ServiceCenterservice Centerservice;

	final String path="myPage/";
	
	@GetMapping("myPage")//마이페이지메인
	public String mypage(HttpSession session,Model model) {
		String id=(String) session.getAttribute("id");
		System.out.println(id+"id값!");
		List<TicketItem> TicketItem =service.myticket(id);//ticket 담아옴
		//ticketitem에 다 넣어서 보냅시다.
		model.addAttribute("TicketItem", TicketItem);
		return path+"myPage";
	}
	@GetMapping("mymovie")//나의 영화목록
	public String mymovie(HttpSession session,Model model) {
		String id=(String) session.getAttribute("id");
		System.out.println(id+"id값!");
		List<TicketItem> TicketItem =service.myDateTicket(id);//시간 지난 영화상영 ㅇㅇ
		model.addAttribute("TicketItem", TicketItem);
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
	@GetMapping("cinemaUpdate/{cinemaCode}")
	public String cinemaUpdate(@PathVariable String cinemaCode,Model model) {
		MovieAdmin item=service.cinemaItem(cinemaCode);
		model.addAttribute("item", item);
		return path+"cinemaUpdate";
	}
	@PostMapping("cinemaUpdate/{cinemaCode}")
	public String cinemaUpdate(MovieAdmin item) {
		service.cinemaUpdate(item);
		
		return "redirect:../myCinema";
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
		System.out.println(item.getTheaterName()+"영화 상영관명");
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
	@GetMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}/movie")
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
	@GetMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}/add")
	public String movieadd(@PathVariable String cinemaCode,@PathVariable String theaterName,Movie item,Model model) {
		item.setCinemaCode(cinemaCode);
		item.setTheaterName(theaterName);
		model.addAttribute("item", item);
		return path+"theaterMovieAdd";
	}
	@GetMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}/Minoradd")
	public String Minoradd(@PathVariable String cinemaCode,@PathVariable String theaterName,Movie item,Model model) {
		item.setCinemaCode(cinemaCode);
		item.setTheaterName(theaterName);
		model.addAttribute("item", item);
		return path+"Minoradd";
	}
	@PostMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}/Minoradd")
	public String Minoradd(@PathVariable String cinemaCode,@PathVariable String theaterName,Movie item,RedirectAttributes ra) {
		return "redirect:movie";
	}
	@GetMapping("theater/cinemaMovie/{cinemaCode}/{theaterName}/delete/{movieName}/{movieDate}/{movieTime}")
	public String moviedelete(@PathVariable String cinemaCode,@PathVariable String theaterName,@PathVariable String movieName,@PathVariable String movieDate,@PathVariable String movieTime) {
		Movie item =new Movie();
		item.setCinemaCode(cinemaCode);
		item.setMovieDate(movieDate);
		item.setMovieName(movieName);
		item.setMovieTime(movieTime);
		item.setTheaterName(theaterName);
		service.moviedelete(item);
		return "redirect:../../../movie";
	}
	@ResponseBody
	@PostMapping("theater/cinemaMovie/movieadd")
	public Object movieadd(@RequestBody Movie item) {
		service.movieadd(item);
		return item;
	}
	@ResponseBody
	@PostMapping("cancel")
	public String cancel(@RequestBody Ticketing item) {
		String bool=service.cancel(item);
		return bool;
	}
	@GetMapping("/theateradd")
    public String theateradd() {
  	  return path+"adminAdd";
    }
    @PostMapping("/theateradd")
    public String theateradd(MovieAdmin item,RedirectAttributes ra) {
  	  int wordLength=8;
  	  Random r = new Random();	StringBuilder sb = new StringBuilder(wordLength);		
  	  for(int i = 0; i < wordLength; i++) {		
  		  char tmp = (char) ('a' + r.nextInt('z' - 'a'));				
  		  sb.append(tmp);	}		
			
  	  String cinemacode=sb.toString();
  	  item.setCinemaCode(cinemacode);
  	  String bool=Centerservice.adminAdd(item);
  	  if(bool=="false") {
  		  ra.addFlashAttribute("msg", "false");
  		  return "redirect:theateradd";
  	  }
  	  ra.addFlashAttribute("msg", "true");
  	  return "redirect:myCinema";
    }
}

