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
import kr.ac.kopo.movie_project.service.ServiceCenterservice;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
	final String path = "serviceCenter/";
	
		@Autowired
		ServiceCenterservice service;
		
		@GetMapping("/CenterService")
		public String CenterService() {
			
			return path+"CenterService";
		}

		@GetMapping("/F&Q")
		public String faq() {
			
			return path+"F&Q";
		}
		
		@GetMapping("/NoticeList")
		public String list(@PathVariable int boardId, Model model) {
			List<BoardMaster> list = service.list();
			
			model.addAttribute("list", list);			
			
			return path+"NoticeList";
		}
			
		@GetMapping("/NoticeAdd")
		public String noticeadd() {
			
			return path+"NoticeAdd";
		}
		
		@PostMapping("/NoticeAdd")
		public String noticeadd(BoardMaster item) {
			service.noticeadd(item);
			
			return "redirect:noticelist";			
		}
		
		@GetMapping("/NoticeUpdate/{boardId}")
		public String noticeupdate(@PathVariable int boardId, Model model) {
			BoardMaster item = service.item(boardId);
			
			model.addAttribute("item",item);
			
			return path+"NoticeUpdate";
		}
		
		@PostMapping("/NoticeUpdate/{boardId}")
		public String noticeupdate(@PathVariable int boardId, BoardMaster item) {
			item.setBoardId(boardId);
			
			service.noticeupdate(item);
		
			return "redirect:../noticelist";
			
		}
		
		@GetMapping("/delete/{boardId}")
		public String delete(@PathVariable int boardId) {
			service.delete(boardId);
			
			return "redirect:..";
		}
		
		
	}


