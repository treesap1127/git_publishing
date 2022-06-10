package kr.ac.kopo.movie_project.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.service.AdminService;
import kr.ac.kopo.movie_project.service.MypageService;

@Controller
@RequestMapping("/webadmin")
public class WebAdminController {
	@Autowired
	AdminService service;
	final String path="admin/";
	@GetMapping("/admin")
	public String admin(Model model) {
		List<MovieAdmin> movieadmin = service.admin();
		model.addAttribute("list", movieadmin);
		return path+"approve";
	}
	@GetMapping("/myCinema")
	public String adminTable(Model model) {
		List<MovieAdmin> movieadmin = service.adminTable();
		model.addAttribute("list", movieadmin);
		return path+"adminTable";
	}
	@GetMapping("/approve/{cinemaCode}/{id}")
	public String approve(@PathVariable String cinemaCode,@PathVariable String id) {
		service.approve(cinemaCode,id);
		return "redirect:../../admin";
	}
	@GetMapping("/reject/{cinemaCode}")
	public String reject(@PathVariable String cinemaCode) {
		service.reject(cinemaCode);
		return "redirect:../admin";
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
}
