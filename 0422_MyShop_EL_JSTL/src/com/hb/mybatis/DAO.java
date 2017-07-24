package com.hb.mybatis; 

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

// DB관련된 처리하는 클래스
public class DAO {
	private static SqlSession ss;
	private static List<VO> list;
	// 싱글턴 패턴 ; 프로그램이 끝날때까지 해당 객체는 하나만 가지고 사용
	private synchronized static SqlSession getSql(){
		if(ss == null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	// 리스트
	public static List<VO> getList(String category){
	    list = getSql().selectList("list", category);
		return list; 
	}
	
	//상세보기
	public static VO getOneList(String prod_num){
		return getSql().selectOne("onelist", prod_num);
	}
	
	public static VO findProduct(String prod_num){
		VO vo = null;
		 for(VO k : list){
	    	 if(k.getP_num().equals(prod_num)){
	    		 vo = k;
	    		 break;
	    	 }
	      }
		 return vo;
	}
}



































