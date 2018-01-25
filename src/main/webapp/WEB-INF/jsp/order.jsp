<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>订单页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>


</head>
<script type="text/javascript">
	  function checkFrom(){
		
		
		var addr = document.getElementById("addr").value;
		if(addr == ''){
			alert("订单地址不能为空!");
			return false;
		}
		
		var name = document.getElementById("name").value;
		if(name == ''){
			alert("订单人不能为空!");
			return false;
		}
		
		var phone = document.getElementById("phone").value;
		if(phone == ''){
			alert("联系人电话不为空!");
			return false;
		}
		if(isNaN(phone)){
		alert("联系人电话为数字类型!");
			return false;
		
		}
		
		
		}
		
		</script>
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
	<!-- 菜单栏 -->
	<%@ include file="menu.jsp" %>
	
</div>	

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					<font color="blue">
					<li  class="current"></li>
					<li  >生成订单成功</li>
					<li  >订单号:${orders.oid }</li>
					</font>
				</ul>
			</div>
		
				<table>
					<tbody>
					<tr>
						<th>图片</th>
						<th>商品</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
					
					<c:forEach items="${orders.items }" var="orderItem">
					
						<tr>
							<td width="60" >
								<img src="${ pageContext.request.contextPath }/${orderItem.product.image }"/>
							</td>
							
							<td>
								<a target="_blank" >${orderItem.product.pname }</a>
							</td>
							
							<td>
							<font color="blue">
							${orderItem.product.shopPrice }
							</font>
							</td>
							<td class="quantity" width="60">
							<font color="blue">
									${orderItem.count }	
									</font>						
							</td>
							<td width="140">
							<font color="blue">
								<span class="subtotal">￥${orderItem.subtotal }</span>
									</font>
							</td>
						
						</tr>
						
					</c:forEach>
					
				</tbody>
			</table>
				<dl id="giftItems" class="hidden" style="display: none;">
				</dl>
				<div class="total">
					<em id="promotion"></em>
					商品金额: <strong id="effectivePrice">￥${orders.total }元</strong>
				</div>
			<form id="orderForm"  action="${pageContext.request.contextPath }/orderpayOrder.action" onsubmit="return checkFrom();" method="post">
				<input type="hidden" name="oid" value="${orders.oid }"/>
				
				<div class="span24">
					<p>
					<font color="blue">
							收货地址：<input name="addr" id="addr" type="text" value="${orders.addr }" style="width:350px" />
								<br />
							收货人&nbsp;&nbsp;&nbsp;：<input name="name" id="name" type="text" value="${orders.name }" style="width:150px" />
								<br /> 
							联系方式：<input name="phone" id="phone" type="text" value="${orders.phone }" style="width:150px" />

						</p>
						<hr />
						<p>
							选择银行：<br/>
							<input type="radio" name="pd_FrpId" value="ICBC-NET-B2C" checked="checked"/>工商银行
							<img src="${pageContext.request.contextPath}/bank_img/icbc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="BOC-NET-B2C"/>中国银行
							<img src="${pageContext.request.contextPath}/bank_img/bc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="ABC-NET-B2C"/>农业银行
							<img src="${pageContext.request.contextPath}/bank_img/abc.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="BOCO-NET-B2C"/>交通银行
							<img src="${pageContext.request.contextPath}/bank_img/bcc.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="PINGANBANK-NET"/>平安银行
							<img src="${pageContext.request.contextPath}/bank_img/pingan.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CCB-NET-B2C"/>建设银行
							<img src="${pageContext.request.contextPath}/bank_img/ccb.bmp" align="middle"/>
							<br/>
							<input type="radio" name="pd_FrpId" value="CEB-NET-B2C"/>光大银行
							<img src="${pageContext.request.contextPath}/bank_img/guangda.bmp" align="middle"/>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pd_FrpId" value="CMBCHINA-NET-B2C"/>招商银行
							<img src="${pageContext.request.contextPath}/bank_img/cmb.bmp" align="middle"/>
						</p>
						<hr />
						<p style="text-align:right">
							<a href="javascript:document.getElementById('orderForm').submit();" >
								<img src="${pageContext.request.contextPath}/images/finalbutton.gif" width="204" height="51" border="0" />
							</a>
						</p>
						</font>
				</div>
				
			</form>
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<div class="footerAd">
					<img src="image\r___________renleipic_01/footer.jpg" alt="我们的优势" title="我们的优势" height="52" width="950">
</div>
</div>
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
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
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright"> 版权所有</div>
	</div>
</div>
</body>
</html>