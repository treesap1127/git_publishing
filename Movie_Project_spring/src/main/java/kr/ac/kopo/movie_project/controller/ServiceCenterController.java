package kr.ac.kopo.movie_project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.BoardMaster;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
	final String path = "serviceCenter/";	
		
		
		@GetMapping("/CenterService")
		public String CenterService() {
			
			return path+"CenterService";
		}

		@GetMapping("/F&Q")
		public String faq() {
			
			return path+"F&Q";
		}		
	
	
		
		
	}


