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

import kr.ac.kopo.movie_project.model.Movie;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.model.Theater;
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
		//moviecode...;
		list.setCinemaCode(cinemaCode);
		list.setTheaterName(theaterName);
		list.setMovieDate(movieDate);
		list.setMovieTime(movieTime);
		list.setMovieCode(movieCode);
		model.addAttribute("list", list);
		List<Theater> sit = service.ticketsit(list);
		model.addAttribute("sit", sit);
		return path+"TicketSit";
	}
	@GetMapping("/payment")
	public String pay() {
		return path+"Payment";
	}
	@GetMapping("/complete")
	public String com() {
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
	
}
