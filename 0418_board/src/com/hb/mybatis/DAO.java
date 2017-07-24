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
	
	public static List<VO> getList(Map<String, Integer> map){
		return getSql().selectList("list", map);
	}
	
	public static void getInsert(VO vo){
		getSql().insert("insert", vo);
		ss.commit();
	}
	
	public static VO getOneList(String seq){
		return getSql().selectOne("onelist", seq);
	}
	
	public static void getUp_lev(Map<String, Integer> map){
		getSql().update("up_lev", map);
		ss.commit();
	}
	
	public static void getReInsert(VO vo){
		getSql().insert("reInsert", vo);
		ss.commit();
	}
	
	public static int getUpdate(VO vo){
		int res = getSql().update("modify", vo);
		ss.commit();
		return res;
	}
	// 원글 히트 업데이트
	public static void getHit(VO vo){
		getSql().update("hit",vo);
		ss.commit();
	}
	//원글 삭제
	public static void getDelete(String seq){
		getSql().delete("delete", seq);
		ss.commit();
	}
	// 전체 게시물의 수
	public static int getTotalCount(){
		return getSql().selectOne("totalCount");
	}
}




































