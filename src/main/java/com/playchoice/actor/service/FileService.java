package com.playchoice.actor.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;
/*
 * 파일 업로드 서비스
 */

public class FileService {
		
	public String fileUpload(MultipartHttpServletRequest request,
			MultipartFile mf) throws IOException {
		
		System.out.println("FileService : "+mf.getOriginalFilename());
		
//		String path = request.getRealPath("resources/img/actor"+"/");
		String path = "C:\\bg\\workspace\\PlayChoice\\src\\main\\webapp\\resources\\img\\actor/";
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
	
	//썸네일 생성(170px X 170px)
	public String setThumb(String path, String res) throws IOException {
		System.out.println("setThumb() Run");

		Thumbnails.of(path+res).size(170,170).toFile(path+"thumb_"+res);
		return "thumb_"+res;
	}
}
