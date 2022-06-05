package kr.ac.kopo.movie_project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ac.kopo.movie_project.model.Faq;
import kr.ac.kopo.movie_project.model.MovieAdmin;
import kr.ac.kopo.movie_project.service.ServiceCenterservice;
@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
	@Autowired
	ServiceCenterservice service;
   String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
   final String path = "serviceCenter/";
   	//test

      @GetMapping("/Faq")
      public String faq(Model model, Faq item) {
    	  List<Faq> list = service.list();
    	  model.addAttribute("list",list);
    	  List<Faq> list1 = service.list1();
    	  model.addAttribute("list1",list1);
    	  List<Faq> list2 = service.list2();
    	  model.addAttribute("list2",list2);
    	  List<Faq> list3 = service.list3();
    	  model.addAttribute("list3",list3);
    	  return path+"Faq";
      }
      
      @GetMapping("/FaqAdd")
      public String faqadd() {
    	  return path + "FaqAdd";
      }
      @PostMapping("/FaqAdd")
      public String faqadd(Faq item) {
    	  service.FaqAdd(item);
    	  return "redirect:Faq";
      }
      
      @GetMapping("/FaqUpdate/{faqId}")
      public String faqupdate(@PathVariable int faqId, Model model) {
    	  
    	 Faq item = service.item(faqId);
    	 model.addAttribute("item", item);
    	 return path + "FaqUpdate";
    	 
      }
      
      @PostMapping("/FaqUpdate/{faqId}")
      public String faqupdate(@PathVariable int faqId, Faq item) {
    	  item.setFaqId(faqId);
    	  
    	  service.faqupdate(item);
    	  
    	  return "redirect:../Faq";    	  
      }
      
      @GetMapping("/FAQdelete/{faqId}")
      public String delete(@PathVariable int faqId) {
    	  service.delete(faqId);
    	  return "redirect:../Faq";
      }
      @GetMapping("/adminAdd")
      public String adminAdd() {
    	  return path+"adminAdd";
      }
      @PostMapping("/adminAdd")
      public String adminAdd(MovieAdmin item,RedirectAttributes ra) {
    	  int wordLength=8;
    	  Random r = new Random();	StringBuilder sb = new StringBuilder(wordLength);		
    	  for(int i = 0; i < wordLength; i++) {		
    		  char tmp = (char) ('a' + r.nextInt('z' - 'a'));				
    		  sb.append(tmp);	}		
			
    	  String cinemacode=sb.toString();
    	  item.setCinemaCode(cinemacode);
    	  String bool=service.adminAdd(item);
    	  if(bool=="false") {
    		  ra.addFlashAttribute("msg", "false");
    		  return "redirect:adminAdd";
    	  }
    	  ra.addFlashAttribute("msg", "true");
    	  return "redirect:CenterService";
      }
      
   }

