package com.hb.am;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// localhost : 8090/프로젝트이름/url맵핑(@WebServlet("/Ex01"))
// 생명주기
@WebServlet("/Ex01")
public class Ex01 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 생성자
    public Ex01() {
        // 부모클래스의 생성자
    	super();
    	System.out.println("생성자");
    	// 생성자가 끝나면 자동으로 init()메소드 호출
    }

	public void init(ServletConfig config) throws ServletException {
		// 서블릿 객체가 처음 생성된 후 최초로 한번만 호출됨
		// 서블릿 객체 초기화 기능이 있음
		System.out.println("init()");
		// 메소드가 끝나면 자동으로 service() 호출
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request => 요청정보
		// response => 응답정보
		// 사용자 요청방식(get, post)에 따라서 해당 메소드를 자동으로 호출
		// get 방식 => doGet()메소드
		// post 방식 => doPost()메소드
		System.out.println("service()");
		if(request.getMethod().equalsIgnoreCase("get")){
			doGet(request, response);
		}else if(request.getMethod().equalsIgnoreCase("post")){
			doPost(request, response);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 작업하는 공간
		System.out.println("doGet()");
		// get방식으로 들어온 것을 doPost()로 넘긴다.
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 실제 작업하는 공간
		System.out.println("doPost()");
	}
	public void destroy() {
		// 서버에서 해당 프로젝트가 소멸 되면 
		// 해당 메소드를 호출하고 소멸 된다.
		System.out.println("destory()");
	}
}
