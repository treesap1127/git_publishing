package kr.ac.kopo.movie_project.controller;

import java.text.SimpleDateFormat;
import java.util.Date;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
   String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
   final String path = "serviceCenter/";
   	//test

      @GetMapping("/F&Q")
      public String faq() {
         
         return path+"F&Q";
      }
      
      
   }

