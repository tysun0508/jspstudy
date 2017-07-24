package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.DAO;
import com.hb.mybatis.VO;

public class SearchCommand implements Command{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String str = "";
		String idx = request.getParameter("idx");
		String keyword = request.getParameter("keyword");
		
		if(idx==null || keyword==null){
			str = "search.jsp";
		}else{
			Map<String, String> map = new HashMap<>();
			map.put("idx", idx);
			map.put("keyword", keyword);
			
			List<VO> k_list = DAO.getSearch(map);
			request.setAttribute("k_list", k_list);
			request.setAttribute("idx", idx);
			str = "search_ok.jsp";
		}
		
		return str;
	}

}
