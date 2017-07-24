package com.hb.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

// DB관련된 것을 처리하는 클래스
public class DAO {
	private static SqlSession ss;
	
	// 싱글턴 패턴; 프로그램이 끝날때까지 해당 객체는 하나만 가지고 사용
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
	
	// insert(삽입) 처리하는 메소드
	public static int getInsert(VO vo){
		int result = getSql().insert("insert", vo);
		ss.commit();
		return result; 
	}
	
	// onelist(상세보기) 처리하는 메소드
	public static VO getOneList(String idx){
		return getSql().selectOne("onelist", idx);
	}
	
	// update 처리하는 메소드
	public static int getUpdate(VO vo){
		int result = getSql().update("update", vo);
		ss.commit();
		return result;
	}
	
	// 삭제처리하는 메소드
	public static int getDelete(String idx){
		int result = getSql().delete("delete", idx);
		ss.commit();
		return result;
	}
}






















