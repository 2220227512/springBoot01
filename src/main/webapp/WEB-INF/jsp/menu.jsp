<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <style type="text/css">
div {
  color: white;
  background-image: url("${pageContext.request.contextPath}/image/2214.jpg");
}
</style>
	<div class="span24">
		<ul class="mainNav">
					<li>
						<a href="${ pageContext.request.contextPath }/index.action"><font color="blue">首页</font></a>
						|
					</li>
					
					<c:forEach items="${cList }"  var="c">
						<li>
						
							<a href="${ pageContext.request.contextPath }/productfindByCid.action?cid=${c.cid }" ><font color="blue">${c.cname }</font></a>
						
							|
						</li>
					</c:forEach>
		</ul>
	</div>