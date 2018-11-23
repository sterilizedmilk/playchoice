package com.playchoice.admin.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnails;

@Service
public class FileService {
	
	String path;
	
	
	public FileService(HttpServletRequest request) {
//		path = request.getRealPath("/resources/img/admin/play")+"/"; //배포할때 사용
		path = "D:\\workspace\\PlayChoice\\src\\main\\webapp\\resources\\img\\admin\\play/"; //작업할때 사용
	}

	//imageUpload 메소드를 이용, imgchk와 fileupload를 구현
	public String imageUpload(MultipartFile mf) {
		if (!isImgChk(mf))
			return null;
		
		return fileUpload(mf);		
	}
	 
	public String fileUpload(MultipartFile mf) {
		//파일을 새로 갱신해야함
		

		
		String res = fileNamePolicy(mf);
		//새로운 파일명이 나왔을시
		
		try {
			FileOutputStream fos = new FileOutputStream(path + res);
			fos.write(mf.getBytes()); //Byte 배열 받기
			
			fos.close(); // 종료
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	String fileNamePolicy(MultipartFile mf) {
		
		//파일 확장자랑 파일 이름을 절단
		int pos = mf.getOriginalFilename().lastIndexOf(".");
		
		//.포함 뒤의 정보 =>확장자명
		String ext = mf.getOriginalFilename().substring(pos);
		//파일명 처음부터 ~ . 전까지 =>파일명
		String fileName = mf.getOriginalFilename().substring(0, pos);
		
		String res = mf.getOriginalFilename();
		//파일명 선언
		String filePath = path + res ;
		//이미지가 드러갈 폴더 경로 -> path
		
		
		File file = new File(filePath);
		//파일로 등록
		int no = 0;
		
		//새로운 파일명이 나올때까지 반복
		while(file.exists()) {
			//존재하는지 체크
			
			res = fileName + "_" + no + ext;
			//파일이름에서 같은게 없다면 no를 입력한 파일명 생성
			
			filePath = path + res;
			//경로 만들기
			
			file = new File(filePath);
			no++;
		}
		return res;
	}
	
	public boolean isImgChk(MultipartFile mf) {
		String ext = mf.getOriginalFilename().toLowerCase().substring(
				mf.getOriginalFilename().lastIndexOf(".")+1);
		System.out.println(ext);
		
		return Arrays.asList("jpg,jpeg,bmp,gif,png".split(",")).contains(ext);
		//확장자 명에 대한 스플릿 리턴
	}
	
	//썸네일 생성(170px X 170px)
	public String setThumb( String res) throws IOException {
		System.out.println("setThumb() Run");

		Thumbnails.of(path+res).size(260,260).toFile(path+"thumb_"+res);
		return "thumb_"+res;
	}
}
