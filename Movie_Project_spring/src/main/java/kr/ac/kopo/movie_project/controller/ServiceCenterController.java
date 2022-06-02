package kr.ac.kopo.movie_project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.kopo.movie_project.model.Faq;
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
      
      @GetMapping("/delete/{faqId}")
      public String delete(@PathVariable int faqId) {
    	  service.delete(faqId);
    	  
    	  return "redirect:../Faq";
      }
      
      
   }

