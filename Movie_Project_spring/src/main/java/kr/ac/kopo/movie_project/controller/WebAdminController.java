package kr.ac.kopo.movie_project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/webadmin")
public class WebAdminController {
	final String path="admin/";
	@GetMapping("/admin")
	public String admin() {
		return path+"main";
	}
}
