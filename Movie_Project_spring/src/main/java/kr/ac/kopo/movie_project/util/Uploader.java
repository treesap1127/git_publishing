package kr.ac.kopo.movie_project.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.movie_project.model.MovieImage;

public class Uploader<T extends UploadFile> {
	final String uploadPath = "D:/upload/";
	
	public MovieImage makeList(MultipartFile movieImage,Class<T> type) throws Exception {
		MovieImage item =new MovieImage();
			if(!movieImage.isEmpty()){//이거안해주면 값없을 경우에 객체 하나 빈거 만들어서 저장공간 손해날 수 있음.
				
				String filename = movieImage.getOriginalFilename();
				String uuid =UUID.randomUUID().toString();
			
				movieImage.transferTo(new File(uploadPath+uuid+"_"+filename));
				
				item.setFilename(filename);
				item.setUUID(uuid);
				
				}
		return item;
	
	}

}
