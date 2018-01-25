<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>购物车</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>

</head>
<style type="text/css">
body {
  color: white;
  background-image: url("${pageContext.request.contextPath}/image/2216.jpg");
}
</style>
<body>
<div class="container header">
	<div class="span5">
		
	</div>
<div class="span9">
	
		<img src="${pageContext.request.contextPath}/image/header.jpg" width="390" height="65" alt="logo" title="logo"/>
    
    </div>
	<%@ include file="header.jsp" %>
	<%@ include file="menu.jsp" %>
</div>	
<div class="container cart">
		<div class="span24">
		<c:if test="${cart==null||cart.cartItems==null }">
			<div class="step step1">
				您还没有购物!请先去购物!
			</div>
		</c:if>
		<c:if test="${cart!=null||cart.cartItems.size!=0 }">
			<div class="step step1">
				购物车列表
			</div>
			
				<table>
					<tbody><tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${cart.cartItems}" var="it">
						<tr>
							<td width="60">
								<img src="${pageContext.request.contextPath}/${it.product.image}">
							</td>
							<td>
								<a target="_blank">${it.product.pname }</a>
							</td>
							<td>
								￥${it.product.shopPrice }
							</td>
							<td class="quantity" width="60">
								${it.count }
							</td>
							<td width="140">
								<span class="subtotal">￥${it.subtotal }</span>
							</td>
							<td>
								<a href="${ pageContext.request.contextPath }/cartremoveCart.action?pid=${it.product.pid}" class="delete">删除</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
							<em>
								登录后确认是否享有优惠
							</em>
					赠送积分: <em id="effectivePoint">${cart.total }</em>
					商品金额: <strong id="effectivePrice">￥${cart.total }元</strong>
				</div>
				<div class="bottom">
					<a href="${ pageContext.request.contextPath }/cartclearCart.action" id="clear" class="clear">清空购物车</a>
					<a href="${ pageContext.request.contextPath }/ordersaveOrder.action" id="submit" class="submit">提交订单</a>
				</div>
			</c:if>
		</div>
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="${pageContext.request.contextPath}/image/footer.jpg" width="950" height="52" alt="我们的优势" title="我们的优势">
</div>	</div>
	<div class="span24">
		<ul class="bottomNav">
				<li>
						<a >关于我们</a>
						|
					</li>
					<li>
						<a>联系我们</a>
						|
					</li>
					<li>
						<a>招贤纳士</a>
						|
					</li>
					<li>
						<a>法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a  target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a>服务声明</a>
						|
					</li>
					<li>
						<a>广告声明</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright"> 版权所有</div>
	</div>
</div>
</body></html>