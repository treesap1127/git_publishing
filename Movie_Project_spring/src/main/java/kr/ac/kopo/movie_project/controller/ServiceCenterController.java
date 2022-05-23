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

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.service.ServiceCenterservice;
import kr.ac.kopo.movie_project.util.Pager;

@Controller
@RequestMapping("/serviceCenter")
//test
public class ServiceCenterController {
   String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
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
      
      @RequestMapping("/serviceCenter/{boardId}/BoardList")
      @GetMapping("/BoardList")
      public String BoardList(@PathVariable int boardId,Model model,Pager pager) {
         List<Board> list = service.list(pager);
         model.addAttribute("list",list);
         
         return path+"BoardList";
      }
      
      @GetMapping("/BoardAdd")
      public String BoardAdd() {
         return path +"BoardAdd";
      }
      @PostMapping("/BoardAdd")
      public String add(@PathVariable int boardId,Board item,HttpSession session) {
         item.setArticleId(boardId); // 수정가능성 높음
         
         service.add(item);
         return "redirect:BoardList";
      }
      
      @GetMapping("/BoardView/{articleId}")
      public String BoardView(@PathVariable int boardId, @PathVariable int articleId,Model model) {
         Board item = service.item(boardId,articleId);
         model.addAttribute("item",item);
         return path+"BoardView";
      }
      
      @GetMapping("/BoardUpdate/{articleId}")
      public String BoardUpdate(@PathVariable int boardId,@PathVariable int articleId,Model model) {
         Board item = service.item(boardId,articleId);
         model.addAttribute("item",item);
         return path+"BoardUpdate";
      }
      @PostMapping("/BoardUpdate/{articleId}")
      public String BoardUpdate(@PathVariable int boardId,@PathVariable int articleId,Board item) {
         item.setArticleId(articleId);
         item.setBoardId(boardId);
         service.update(item);
         
         return "redirect:../BoardList";
      }
      
      @GetMapping("/delete/{articleId}")
      public String delete(@PathVariable int boardId, @PathVariable int articleId) {
         service.delete(boardId,articleId);
         return "redirect:../BoardList";
      }
      
   
      
      
   }

