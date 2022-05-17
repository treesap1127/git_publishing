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
import kr.ac.kopo.movie_project.service.BoardService;

@Controller
@RequestMapping("/serviceCenter")
public class BoardController {
	final String path = "serviceCenter/";
	@Autowired
	BoardService service;
	
	@GetMapping("/BoardTableList")
	public String BoardTableAdd(Model model) {
		List<BoardMaster> list = service.list();
		model.addAttribute("list",list);
		return path +"BoardTableList";
	}
	@GetMapping("/BoardTableadd")
	public String add() {
		return path+"BoardTableadd";
	}
	@PostMapping("/BoardTableadd")
	public String add(BoardMaster item) {
		service.add(item);
		return "redirect:BoardTableList";
	}
	@GetMapping("/BoardTableUpdate/{boardId}")
	public String update(@PathVariable int boardId,Model model) {
		BoardMaster item = service.item(boardId);
		model.addAttribute("item",item);
		
		return path+"BoardTableList";
		
	}
	@PostMapping("/BoardTableUpdate/{boardId}")
	public String update(@PathVariable int boardId,BoardMaster item) {
		item.setBoardId(boardId);
		service.update(item);
		
		return "redirect:../BoardTableList";
	}
	@GetMapping("/delete/{boardId}")
	public String delete(@PathVariable int boardId) {
		service.delete(boardId);
		
		return "redirect:../BoardTableList";
	}
	

}
