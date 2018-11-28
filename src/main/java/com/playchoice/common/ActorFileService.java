package com.playchoice.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;
/*
 * 액터
 * 파일 업로드 서비스
 */

public class ActorFileService {
		
	public String fileUpload(MultipartHttpServletRequest request,
			MultipartFile mf) throws IOException {
		
		System.out.println("FileService : "+mf.getOriginalFilename());
		
		String path = request.getRealPath("resources/img/actor"+"/");
//		String path = "C:\\bg\\workspace\\PlayChoice\\src\\main\\webapp\\resources\\img\\actor/";
		String res = fileNamePolicy(mf, path);
		System.out.println("경로 : "+path+res);
		
		try {
			FileOutputStream fos = new FileOutputStream(path+res);
			fos.write(mf.getBytes());
			
			fos.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return setThumb(path,res);
	}
	
	//파일 중복확인
	String fileNamePolicy(MultipartFile mf, String path) throws IOException {
		System.out.println("fileNamePolicy() Run");
		String res = mf.getOriginalFilename();
		File file = new File(path+res);
		
		//파일이 존재하면 파일명 앞에 현재시간을 입력하여 중복회피
		if(file.exists()) {
			System.out.println("file.exist 들어옴");
			res = System.currentTimeMillis() + "_"+res;
			file = new File(path+res);
		}
		System.out.println("res : "+res);
		System.out.println("path : "+path);
		System.out.println(file);

		return res;
	}
	
	//이미지 파일 확인
	public boolean isImgCheck(MultipartFile mf) {
		// ext -> 파일 확장자명
		String ext = mf.getOriginalFilename().toLowerCase().substring(
				mf.getOriginalFilename().lastIndexOf(".")+1);
		
		// jpg, jpeg, gif, png 파일만 허용
		ArrayList<String> extList = new ArrayList<>();
		extList.add("jpg");
		extList.add("jpeg");
		extList.add("gif");
		extList.add("png");
		
		return extList.contains(ext);		
		
	}
	
	//썸네일 생성(170px X 170px)
	public String setThumb(String path, String res) throws IOException {
		System.out.println("setThumb() Run");

		Thumbnails.of(path+res).size(170,170).toFile(path+"thumb_"+res);
		return "thumb_"+res;
	}
}
