package com.bookbook.util.db;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

public class CodeUtil {
	private static ServletContext application;
	private static Map<String, CommonCodeDTO> codeMap=new HashMap<>();
	
	public CodeUtil(){}
	
	public CodeUtil(ServletContext application){
		this.application=application;
		codeMap=(Map<String, CommonCodeDTO>)application.getAttribute("codeMap");
	}
	
	public static String getCodeName(String code){
		String codeName=codeMap.get(code).getName();
		return codeName;
	}
	
	public static String getParentCode(String code){
		String parentCode=codeMap.get(code).getParentCode();
		return parentCode;
	}
	
	public static List<String> getSiblingCodes(String code){
		List<String> codes=new ArrayList();
		
		Iterator<String> it=codeMap.keySet().iterator();
		while(it.hasNext()){
			String key=it.next();
			
			CommonCodeDTO codeDTO=codeMap.get(key);
			String parentCode=codeDTO.getParentCode();
			if( code.equals(parentCode) ){
				codes.add(codeDTO.getCommonCode());
			}
		}

		return codes;
	}
	
	public static List<String> getChildCodes(String code){
		List<String> codeList=new ArrayList();
		
		Iterator<String> it=codeMap.keySet().iterator();

		while(it.hasNext()){
			String key=it.next();
			CommonCodeDTO codeDTO=codeMap.get(key);

			if( codeDTO.getParentCode()!=null && codeDTO.getParentCode().equals(code)){
				codeList.add(codeDTO.getCommonCode());
			}
		}

		return codeList;
	}
	
	
	
	
	public static List<String> getCodes(String codeName){
		List<String> codes=new ArrayList();
		
		Iterator<String> it=codeMap.keySet().iterator();
		while(it.hasNext()){
			String key=it.next();
			
			CommonCodeDTO codeDTO=codeMap.get(key);
			String findCodeName=codeDTO.getName();
			if( codeName.equals(findCodeName) ){
				codes.add(codeDTO.getCommonCode());
			}
		}

		return codes;
	}
}
