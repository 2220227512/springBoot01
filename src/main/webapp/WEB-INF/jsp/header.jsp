<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="span10 last">
		<div class="topNav clearfix">
		<font size="3" face="微软雅黑" color="blue">
			<ul>
				<c:if test="${loginUser!=null }">
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						当前用户：${loginUser.username }
					</li>
					<li id="headerLogin" class="headerLogin" style="display: list-item;">
						<a href="${ pageContext.request.contextPath }/orderfindByUid.action">我的订单</a>|
					</li>
					<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${ pageContext.request.contextPath }/userquit.action">退出</a>|
				</li>
				</c:if>
				<c:if test="${loginUser==null }">
				<li id="headerLogin" class="headerLogin" style="display: list-item;">
					<a href="${ pageContext.request.contextPath }/userloginPage.action">登录</a>|
				</li>
				<li id="headerRegister" class="headerRegister" style="display: list-item;">
					<a href="${ pageContext.request.contextPath }/userregistPage.action">注册</a>|
				</li>
                </c:if>				
				
				<li id="headerUsername" class="headerUsername"></li>
				<li id="headerLogout" class="headerLogout">
					<a>[退出]</a>|
				</li>
						<li>
							<a>商城详情</a>
							
							|
						</li>
						<li>
						<a>联系合作</a>
							
							|
						</li>
						<li>
							<a>
							<a>意见反馈</a>
					
						</li>
						
			</ul>
			</font>
		</div>
		<div class="cart">
			<a  href="${ pageContext.request.contextPath }/cartmyCart.action">购物车</a>
		</div>
		<div class="phone">
			客服热线:
			<strong>133411</strong>
		</div>
	</div>