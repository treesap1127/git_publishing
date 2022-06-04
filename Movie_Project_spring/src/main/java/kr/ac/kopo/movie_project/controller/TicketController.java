package kr.ac.kopo.movie_project.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.SitSelect;
import kr.ac.kopo.movie_project.model.Theater;
import kr.ac.kopo.movie_project.model.Ticketing;
import kr.ac.kopo.movie_project.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	final String path = "ticket/";
	
	@Autowired//service 선언
	TicketService service;
	
	@RequestMapping("/Ticketing")
	public String Ticketing(Model model) {
		return path+"Ticketing";
	}
	@ResponseBody
	@GetMapping("/movieview")
	public List<Movie> movieview() {
		List<Movie> list =service.view();
		return list;
		
	}
	@RequestMapping("/TicketInformation")
	public String TicketInformation() {
		return path+"TicketInformation";
	}
	@GetMapping("/sit")
	public String ticketsit(@RequestParam String movieName,@RequestParam String cinemaCode,@RequestParam String theaterName,@RequestParam String movieDate,@RequestParam String movieTime,@RequestParam int movieCode,Model model) {
		Movie list =new Movie();
		list.setMovieName(movieName);
		list.setCinemaCode(cinemaCode);
		list.setTheaterName(theaterName);
		list.setMovieDate(movieDate);
		list.setMovieTime(movieTime);
		list.setMovieCode(movieCode);
		model.addAttribute("list", list);
		Movie item=service.movieimage(list);
		model.addAttribute("item", item);
		List<Theater> sit = service.ticketsit(list);
		model.addAttribute("sit", sit);

		return path+"TicketSit";
	}
	@ResponseBody
	@PostMapping("/sitset")
	public String sitset(@RequestBody SitSelect item) {
		List<SitSelect> list=service.sitset(item);//가져옴
		StringBuffer data=new StringBuffer();
		if(list.size()!=0) {
			for(int i=0;i<list.size();i++) {
				SitSelect j=list.get(i);// 기초 좌석 파일
				String b=j.getSelectSit();//String 좌석 파일
				data.append(b+",");
			}
			String subString = data.substring(0,data.length()-1);
			return subString;
		}
		return "LPO";
	}
	@GetMapping("/payment")
	public String pay() {
		return path+"Payment";
	}
	@PostMapping("/payment")
	public String pay(Ticketing item,Model model, RedirectAttributes ra) throws Exception {
		Date now = new Date();         
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");         
		String formatedNow = formatter.format(now);
		item.setPayTime(formatedNow);
		
			String bool=service.ticketcomplete(item);
			if(bool=="false") {
				ra.addFlashAttribute("msg", "false");
				return "redirect:./Ticketing";
			}
		service.ticketsitadd(item);
		return "redirect:../ticket/complete?ticketCode="+item.getTicketCode()+"&movieCode="+item.getMovieCode();
	}
	@ResponseBody
	@PostMapping("/paymentItem")
	public Movie paymentItem(@RequestBody SitSelect item){
		Movie list=service.paymentItem(item);
		return list;
	}
	@GetMapping("/complete")
	public String com(@RequestParam String ticketCode,@RequestParam int movieCode,Model model) {
		Ticketing item=new Ticketing();
		item.setTicketCode(ticketCode);
		item.setMovieCode(movieCode);
		item =service.ticketitem(item);
		model.addAttribute("item", item);
		SitSelect Sititem = new SitSelect();
		Sititem.setMovieCode(item.getMovieCode());
		Movie list = service.paymentItem(Sititem);
		model.addAttribute("list", list);
		return path+"TicketComplete";
	}
	
	@ResponseBody
	@PostMapping("/movieplace")
	public List<MovieAdmin> movieplace(@RequestBody MovieAdmin bicCity) {
		List<MovieAdmin> item= service.movieplace(bicCity);
		return item;
	}
	@ResponseBody
	@PostMapping("/cinema")
	public List<Movie> cinema(@RequestBody MovieAdmin item) {
		List<Movie> moviename= service.cinema(item);
		if(moviename.size()==0) {
			Movie a= new Movie();
			a.setCinemaCode("fail");
			
			moviename.add(a);
			
			return moviename;
		}
		else {
			return moviename;
		}
	}
	@ResponseBody
	@PostMapping("/cinemaCode")
	public List<Movie> cinemaCode(@RequestBody Movie item) {
		List<Movie> cinemaCode= service.cinemaCode(item);
		return cinemaCode;
	}
	@ResponseBody
	@PostMapping("/cinematime")
	public List<Movie> cinematime(@RequestBody Movie item) throws ParseException {
		System.out.println(item.getMovieName());
		System.out.println(item.getCinemaCode());
		System.out.println(item.getMovieDate());
		List<Movie> time= service.cinematime(item);
		return time;
	}
	@ResponseBody
	@PostMapping("/cinemaDate")
	public List<Movie> cinemaDate(@RequestBody Movie item){
		List<Movie> date= service.cinemaDate(item);
		return date;
	}
	@ResponseBody
	@PostMapping("/moviecodea")
	public Movie moviecode(@RequestBody Movie item){
		return service.moviecode(item);
	}
	@ResponseBody
	@PostMapping("/sit_tic_add")
	public String sitTicAdd(@RequestBody SitSelect item) {//좌 아이템엔 영화 코드와 좌석,id가 존재.
		Movie data = service.sitTicdata(item);
		item.setTheaterName(data.getTheaterName());
		item.setCinemaCode(data.getCinemaCode());
		String check=service.sit_tic_add(item);
		return check;
	}
	@ResponseBody
	@PostMapping("/sit_tic_delete")
	public String sit_tic_delete(@RequestBody SitSelect item) throws InterruptedException {//좌 아이템엔 영화 코드와 좌석,id가 존재.
		String check=service.sit_tic_delete(item);
		return check;
	}
	
}
