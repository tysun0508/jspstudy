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
	
	// 원글 리스트
	public static List<BVO> getList(Map<String, Integer> map){
		return getSql().selectList("list", map);
	}
	
	// 원글 삽입
	public static int getInsert(BVO bvo){
		int res = getSql().insert("insert", bvo);
		ss.commit();
		return res;
	}
	
	// 원글 상세보기
	public static BVO getOneList(String b_idx){
		return getSql().selectOne("onelist", b_idx);
	}
	
	// 원글 히트 업데이트
	public static void getHit(BVO bvo){
		getSql().update("hit",bvo);
		ss.commit();
	}
	
	//원글 업데이트
	public static int getUpdate(BVO bvo){
		int res = getSql().update("update",bvo);
		ss.commit();
		return res ;
	}
	
	//원글 삭제
	public static void getDelete(String b_idx){
		getSql().delete("delete",b_idx);
		ss.commit();
	}
	// 전체 게시물의 수
	public static int getTotalCount(){
		return getSql().selectOne("totalCount");
	}
	// 댓글 리스트
	public static List<CVO> getAns_List(String b_idx){
		return getSql().selectList("ans_list", b_idx);
	}
	// 댓글 삽입
	public static int getAns_Insert(CVO cvo){
		int res = getSql().insert("ans_insert", cvo);
		ss.commit();
		return res;
	}
	//댓글 삭제
	public static void getAns_Delete(String c_idx){
		getSql().delete("ans_Delete",c_idx);
		ss.commit();
	}
}




































