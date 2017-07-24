<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 검색 결과</title>
</head>
<body>
	<h1>부서 결과 보기</h1>
	<h2>
		<ul>
			<c:choose>
				<c:when test="${empty d_list }">
					<li>자료가 존재 하지 않습니다.</li>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${d_list }">
						<li>
							${k.employee_id },${k.first_name },${k.job_id },
							${k.salary },${k.department_id }
						</li>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
	</h2>
</body>
</html>