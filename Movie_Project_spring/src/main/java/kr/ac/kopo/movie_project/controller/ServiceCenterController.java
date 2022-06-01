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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.movie_project.model.Board;
import kr.ac.kopo.movie_project.model.BoardImage;
import kr.ac.kopo.movie_project.service.ServiceCenterservice;
import kr.ac.kopo.movie_project.util.PagerBoardId;
import kr.ac.kopo.movie_project.util.Uploader;

@Controller
@RequestMapping("/serviceCenter")
public class ServiceCenterController {
   String date = new SimpleDateFormat("dd-MM-yyyy").format(new Date());
   final String path = "serviceCenter/";
   	//test
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
      
      @GetMapping("/{boardId}/BoardList")
      public String BoardList(@PathVariable Long boardId,Model model,PagerBoardId pager) {
         pager.setBoardId(boardId);
    	  List<Board> list = service.list(pager,boardId);
         model.addAttribute("list",list);
         
         return path+"BoardList";
      }
      
      @GetMapping("/{boardId}/BoardAdd")
      public String BoardAdd() {
    	  
         return path +"BoardAdd";
      }
      @PostMapping("/{boardId}/BoardAdd")
      public String add(@PathVariable int boardId,Board item,HttpSession session, @RequestParam("boardImage") List<MultipartFile> boardImage) {
         item.setBoardId(boardId); // 수정가능성 높음
         
         
         try {
             Uploader<BoardImage> uploader =new Uploader<>(); //업로더라고 객체생성함 보드이미지 모델에 업로더 담궈둠
         
             List<BoardImage> images=uploader.makeList(boardImage,BoardImage.class);

             item.setImages(images);
             List<BoardImage> a = item.getImages();
             BoardImage b = a.get(0);
             System.out.println("이미지ㅣㅣㅣㅣㅣㅣ"+ b.getArticleId());
             System.out.println("이미지ㅣㅣㅣㅣㅣㅣ"+ b.getBoardId());
             System.out.println("이미지ㅣㅣㅣㅣㅣㅣ"+ b.getFilename());
             System.out.println("이미지ㅣㅣㅣㅣㅣㅣ"+ b.getUUID());
			
             //셋 이미지 해서 이미지 설정해줌 
             service.add(item);
           
          }
           catch (Exception e) {
                e.printStackTrace(); //에러 출력 
             }
         
         
         return "redirect:BoardList";
      }
      
      
      
      @GetMapping("{boardId}/BoardView/{articleId}")
      public String BoardView(@PathVariable int boardId, @PathVariable int articleId,Model model) {
         Board item = service.item(boardId,articleId);
         model.addAttribute("item",item);
         return path+"BoardView";
      }
      
      @GetMapping("/{boardId}/BoardUpdate/{articleId}")
      public String BoardUpdate(@PathVariable int boardId,@PathVariable int articleId,Model model) {
         Board item = service.item(boardId,articleId);
         model.addAttribute("item",item);
         return path+"BoardUpdate";
      }
      @PostMapping("/{boardId}/BoardUpdate/{articleId}")
      public String BoardUpdate(@PathVariable int boardId,@PathVariable int articleId,Board item,
    		  @RequestParam("boardImage") List<MultipartFile> boardImage) {
         item.setArticleId(articleId);
         item.setBoardId(boardId);
         try {
             Uploader<BoardImage> uploader =new Uploader<>(); //업로더라고 객체생성함 보드이미지 모델에 업로더 담궈둠
             
             List<BoardImage> images=uploader.makeList(boardImage,BoardImage.class);
             //makeList는 파일 사이즈 조정하는듯
             //보드이미지 모델을 images라고 줄인담에 uploader.makeList(~~)를 사이즈 초과되지않게 images에 담가둠
             item.setImages(images);
             //셋 이미지 해서 이미지 설정해줌 
             service.update(item);
          
          }
           catch (Exception e) {
                e.printStackTrace(); //에러 출력 
             }
         
         return "redirect:../BoardList";
      }
 
      
      
      
      
      
      
      
      @GetMapping("/{boardId}/delete/{articleId}")
      public String delete(@PathVariable Long boardId, @PathVariable Long articleId) {
         service.delete(boardId,articleId);
         return "redirect:../BoardList";
      }
   
      
      
   }

