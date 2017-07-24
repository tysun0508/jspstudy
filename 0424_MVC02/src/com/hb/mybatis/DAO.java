package com.hb.mybatis;

import java.util.List;
import java.util.Map;

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
	
	// 전체 보기
	public static List<VO> getList(){
		return getSql().selectList("list");
	}
	
	// 부서 검색
	public static List<VO> getDept(String deptno){
		return getSql().selectList("dept", deptno);
	}
	
	// 동적 쿼리
	public static List<VO> getSearch(Map<String, String> map){
		return getSql().selectList("keylist", map);
	}
}










































