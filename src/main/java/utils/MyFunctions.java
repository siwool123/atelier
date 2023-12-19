package utils;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import com.edu.springboot.restboard.IBoardService;

public class MyFunctions {

	@Autowired
	IBoardService ddao;
	
	/* UUID (universally unique idenfier) : 범용고유식별자. jdk에서 기본적으로 제공되는 클래스로, 32글자의 영문,숫자 포함한 고유문자열반환 */
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString(); //randomUUID : static 함수
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된 UUID : "+uuid);
		return uuid;
	}
	
	public static String renameFile(String sDirectory, String fileName) {
		String ext = fileName.substring(fileName.lastIndexOf(".")); //파일확장자 잘라낸다
		String now = getUuid(); //파일명으로 사용할 문자열 얻어온다
		String newFileName = now + ext; //둘을합쳐 새파일명 만든다
		
		//기존파일과 새파일의 객체만든후 이름을 변경한다.
		File oldFile = new File(sDirectory+File.separator+fileName);
		File newFile = new File(sDirectory+File.separator+newFileName);
		oldFile.renameTo(newFile);
		//변경된파일명 반환한다.
		return newFileName;
	}
	
}
