package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

// DB관련된 처리하는 클래스
public class DAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴 ; 프로그램이 끝날때까지 해당 객체는 하나만 가지고 사용
	private synchronized static SqlSession getSql(){
		if(ss == null){
			ss = DBService.getFactory().openSession(false);
		}
		return ss;
	}
	
	// list 처리하는 메소드
	public static List<VO> getList(){
		return getSql().selectList("list");
	}
	
	public static String getIdchk(String id){
		List<VO> one = getSql().selectList("idchk", id);
		String res = "사용가능";
		if(one.size()>0){
			res = "사용불가";
		}
		return res;
	}
	
	public static int getInsert(VO vo){
		int res = getSql().insert("insert", vo);
		ss.commit();
		return res;
	}
	
	public static int getDelete(String idx){
		int res = getSql().delete("delete", idx);
		ss.commit();
		return res;
	}
	

}























