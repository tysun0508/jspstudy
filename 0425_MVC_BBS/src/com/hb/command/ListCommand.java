package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BVO;
import com.hb.mybatis.DAO;
import com.hb.mybatis.Paging;

public class ListCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
	    // 1. 전체 게시물의 수 구하기
		pvo.setTotalRecord(DAO.getTotalCount());
		
		// 전체 페이지의 수를 구한다.
		pvo.setTotalPage();
		
		// 2. 현재 페이지 구하기
		// 처음 list.jsp를 제외하고는 무조건 cPage라는 
		// 현재 페이지를 뜻하는 파라미터값를 받자
		  String cPage = request.getParameter("cPage");
		  // null 아니면 현재페이지 변경
		  // null 이면 그냥 현재 페이지를 1 page로 인식
		  if(cPage != null){
			 pvo.setNowPage(Integer.parseInt(cPage));  
		  }
		
		 // 3. 각페이지의 시작 번호 와 끝번호 구하기
		  pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		  pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		 
		  
		 // 4. 페이지블록의 시작페이지와 끝페이지 구하기
		  pvo.setBeginPage((int)(((pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1));
		  pvo.setEndPage(pvo.getBeginPage()+pvo.getPagePerBlock()-1);
		  
		 // 주의 사항 : endPage가 totalPage보다 클 경우에는 
		 //            endPage를 totalPage와 같게 만든다.
		  if(pvo.getEndPage() > pvo.getTotalPage()){
			  pvo.setEndPage(pvo.getTotalPage());
		  }
		  
		// DB처리 (시작번호와 끝번호 가지고 DB처리)
		 Map<String, Integer> map = new HashMap<>();
		 map.put("begin",pvo.getBegin() );
		 map.put("end", pvo.getEnd());
		 
		// request로 결과 저장
		List<BVO> list = DAO.getList(map);
		
		request.setAttribute("list", list);
		request.setAttribute("pvo", pvo);
		// 결과 보여줄 jsp지정
		return "list.jsp";
	}

}
