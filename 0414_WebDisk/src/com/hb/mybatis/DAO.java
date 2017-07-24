package com.hb.mybatis;

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
	
	public static VO getLogin(VO vo){
		return getSql().selectOne("login", vo);
	}
	public static int getInsert(VO vo){
		int result = getSql().insert("insert", vo);
		ss.commit();
		return result;
	}
	
}






















