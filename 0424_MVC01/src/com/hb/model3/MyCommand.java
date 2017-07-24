package com.hb.model3;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyCommand {
	public String exec(HttpServletRequest request, HttpServletResponse response){
		String name = request.getParameter("name");
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int sum = kor+ eng +math;
		double avg = sum / 3.0 ;
		String hak = null;
		if(avg>=90){
			hak = "A";
		}else if(avg>=80){
			hak = "B";
		}else if(avg>=70){
			hak = "C";
		}

		// 방법1 ) request, session의 속성 이용
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		session.setAttribute("sum", sum);
		session.setAttribute("avg", avg);
		session.setAttribute("hak", hak);
		
		// 방법2) VO 이용하기
		VO vo = new VO();
		vo.setName(name);
		vo.setSum(String.valueOf(sum));
		vo.setAvg(String.valueOf(avg));
		vo.setHak(hak);
		session.setAttribute("vo", vo);
		
		// 방법3) 맵을 이용하는 방법 (같은 자료형이어야 한다.)
		Map<String, String> map = new HashMap<>();
		 map.put("name", name);   
		 map.put("sum", String.valueOf(sum));   
		 map.put("avg", String.valueOf(avg));   
		 map.put("hak", hak);   
         session.setAttribute("map", map);	
         
      // 방법4) 맵을 이용하는 방법 (다른 자료형 일때)
 		Map<String, Object> map2 = new HashMap<>();
 		 map2.put("name", name);   
 		 map2.put("sum", sum);   
 		 map2.put("avg", avg);   
 		 map2.put("hak", hak);   
         session.setAttribute("map2", map2); 
		 
		return "view4/output.jsp";
	}
}
