package kr.ac.kopo.movie_project.controller;

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
import kr.ac.kopo.movie_project.service.TicketService;

@Controller
@RequestMapping("/ticket")
public class TicketController {
	final String path = "ticket/";
	
	@Autowired
	TicketService service;
	
	@RequestMapping("/Ticketing")
	public String Ticketing(@RequestParam("moviename") String movieName,Model model) {
		model.addAttribute("moviename", movieName);
		List<Movie> movie = service.movielist();
		model.addAttribute("movie", movie);
		return path+"Ticketing";
	}
	@RequestMapping("/TicketInformation")
	public String TicketInformation() {
		return path+"TicketInformation";
	}
	@GetMapping("/sit")
	public String ticketsit() {
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
	public Object movieplace(@RequestBody MovieAdmin bicCity) {
		return service.movieplace(bicCity);
	}
	
}
