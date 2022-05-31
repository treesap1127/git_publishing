package kr.ac.kopo.movie_project.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class Uploader<T extends UploadFile> {
   final String uploadPath = "D:/upload/"; //저장위치
   
   public List<T> makeList(List<MultipartFile> files,Class<T> type) throws Exception {
      List<T> result =new ArrayList<>(); //어레이리스트 객체생성해서 리절트에 담음
      
      for(MultipartFile file : files) {
         if(!file.isEmpty()){//이거안해주면 값없을 경우에 객체 하나 빈거 만들어서 저장공간 손해날 수 있음.
            
            String filename = file.getOriginalFilename(); //업로드한 파일 이름을 구함 
            String uuid =UUID.randomUUID().toString(); //UUID를 써서 파일 이름이 중복되지않게함
            System.out.println(filename);
         
            file.transferTo(new File(uploadPath+uuid+"_"+filename));//아 transferTo 이거 써서 지정한 파일로 저장할수있음 앞에 uuid 쓰고 뒤에는 파일네임 
            
            @SuppressWarnings("deprecation") //경고무시 
            T item = type.newInstance();
            item.setFilename(filename); //파일네임 아이템에 넣어 
            item.setUUID(uuid); //유유아이디도 넣어 
            
            result.add(item);//애드해 
            
            
            }
         }
      return result;
   
   }
}
