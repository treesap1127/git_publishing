package kr.ac.kopo.movie_project.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@Autowired
	TicketService service;
	
	@RequestMapping("/Ticketing")
	public String Ticketing(Model model) {
		List<Movie> movie = service.movielist();
		model.addAttribute("movie", movie);
		return path+"Ticketing";
	}
	@RequestMapping("/TicketInformation")
	public String TicketInformation() {
		return path+"TicketInformation";
	}
	@GetMapping("/sit")
	public String ticketsit(@RequestParam String movieName,@RequestParam String cinemaCode,@RequestParam String theaterName,@RequestParam String movieDate,@RequestParam String movieTime,Model model) {
		Movie list =new Movie();
		list.setMovieName(movieName);
		list.setCinemaCode(cinemaCode);
		list.setTheaterName(theaterName);
		list.setMovieDate(movieDate);
		list.setMovieTime(movieTime);
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
		return moviename;
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
	public List<Movie> cinemaDate(@RequestBody Movie item) throws ParseException {
		List<Movie> date= service.cinemaDate(item);
		return date;
	}
	
	
}
