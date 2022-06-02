package kr.ac.kopo.movie_project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.Notice;
import kr.ac.kopo.movie_project.service.NoticeService;

@Controller
@RequestMapping("/serviceCenter")
public class NoticeController {
	String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
	final String path = "serviceCenter/";
	
		@Autowired
		NoticeService service;
		
		@GetMapping("/CenterService")
		public String CenterService() {
			
			return path+"CenterService";
		}
		
		@GetMapping("/BoardList")
		public String BoardList(Model model) {
			List<Notice> list = service.list();
			model.addAttribute("list",list);
			
			return path+"BoardList";
		}
		
		@GetMapping("/BoardAdd")
		public String BoardAdd() {
			return path +"BoardAdd";
		}
		@PostMapping("/BoardAdd")
		public String add(Notice item,HttpSession session) {
			service.add(item);
			return "redirect:BoardList";
		}
		
		@GetMapping("/BoardView/{articleId}")
		public String BoardView(@PathVariable int articleId,Model model) {
			Notice item = service.item(articleId);
			model.addAttribute("item",item);
			return path+"BoardView";
		}
		@GetMapping("/BoardUpdate/{articleId}")
		public String BoardUpdate(@PathVariable int articleId,Model model) {
			Notice item = service.item(articleId);
			model.addAttribute("item",item);
			return path+"BoardUpdate";
		}
		@PostMapping("/BoardUpdate/{articleId}")
		public String BoardUpdate(@PathVariable int articleId,Notice item) {
			item.setArticleId(articleId);
			service.update(item);
			
			return "redirect:../BoardList";
		}
		
		@GetMapping("/delete/{articleId}")
		public String delete(@PathVariable int articleId) {
			service.delete(articleId);
			return "redirect:../BoardList";
		}
		
}
