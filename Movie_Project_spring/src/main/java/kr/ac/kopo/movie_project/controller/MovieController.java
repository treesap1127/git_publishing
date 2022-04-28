package kr.ac.kopo.movie_project.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.ac.kopo.movie_project.model.Kofic;
import kr.ac.kopo.movie_project.model.NaverMovie;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
@Controller
public class MovieController {
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/koficmovie")
	public Object kobisMovie(@RequestBody Kofic item) throws OpenAPIFault, Exception{
		String key="52ed877329884c9bcff27fca7daf01d0";
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		cal.add(Calendar.DATE, -1);
		String date = sdf.format(cal.getTime());
		
		
		String itemPerPage=item.getRank();
		
		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		String daliydata=service.getDailyBoxOffice(true,date,itemPerPage,"","","");

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String,Object> data =mapper.readValue(daliydata,HashMap.class);
		System.out.println("박스오피스데이터"+data);
		HashMap<String,Object> boxOfficeResult=(HashMap<String, Object>) data.get("boxOfficeResult");
		List<Kofic> dailyBoxOfficeList=(List<Kofic>) boxOfficeResult.get("dailyBoxOfficeList");
		System.out.println("숫자 테스트 ONE:"+item.getRnum());
		int resultnum=Integer.parseInt(item.getRnum())-1;
		System.out.println("숫자 테스트 TWO:"+resultnum);
		System.out.println("범위 안벗어남.."+dailyBoxOfficeList.get(resultnum));
		return dailyBoxOfficeList.get(resultnum);
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/navermovie")
	public Object naverMovie(@RequestBody Kofic moviedata) throws JsonMappingException, JsonProcessingException {
		System.out.println("넘어온 영화명"+moviedata.getMovieNm());
		String clientID = "VqLhQsyK7_jem5SPZGte"; 
		String clientSecret = "z73KtTgaHW";
		String text = null;
        try {
            text = URLEncoder.encode(moviedata.getMovieNm(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("검색어 인코딩 실패",e);
        }


        String apiURL = "https://openapi.naver.com/v1/search/movie?query=" + text;    // json 결과

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientID);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        String responseBody = get(apiURL,requestHeaders);

        System.out.println("↓부터는 네이버 API");
        
        ObjectMapper hash = new ObjectMapper();
        HashMap<String,Object> data =hash.readValue(responseBody,HashMap.class);//스트링으로 받아온걸 Map으로
        List<NaverMovie> listdata=(List<NaverMovie>)data.get("items");
        System.out.println("listdata를 불러옴"+listdata.get(0));
		
        return listdata;
        
        
	}
	
	 private static String get(String apiUrl, Map<String, String> requestHeaders){
	        HttpURLConnection con = connect(apiUrl);
	        try {
	            con.setRequestMethod("GET");
	            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
	                con.setRequestProperty(header.getKey(), header.getValue());
	            }


	            int responseCode = con.getResponseCode();
	            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
	                return readBody(con.getInputStream());
	            } else { // 에러 발생
	                return readBody(con.getErrorStream());
	            }
	        } catch (IOException e) {
	            throw new RuntimeException("API 요청과 응답 실패", e);
	        } finally {
	            con.disconnect();
	        }
	    }


	    private static HttpURLConnection connect(String apiUrl){
	        try {
	            URL url = new URL(apiUrl);
	            return (HttpURLConnection)url.openConnection();
	        } catch (MalformedURLException e) {
	            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
	        } catch (IOException e) {
	            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
	        }
	    }


	    private static String readBody(InputStream body){
	        InputStreamReader streamReader = new InputStreamReader(body);


	        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
	            StringBuilder responseBody = new StringBuilder();


	            String line;
	            while ((line = lineReader.readLine()) != null) {
	                responseBody.append(line);
	            }


	            return responseBody.toString();
	        } catch (IOException e) {
	            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
	        }
	    }
}
