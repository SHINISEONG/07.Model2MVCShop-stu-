<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.model2.mvc.service.product.ProductService"%>
<%@ page contentType="text/html; charset=euc-kr" %>

<%@ page import="java.util.*"  %>


<html>
<head>
<title>장바구니 조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">

function fncGetCartList(currentPage,searchOrderType) {
		document.getElementById("currentPage").value = currentPage;
		document.detailForm.submit();		
	}
	
</script>

</head>

<body bgcolor="#ffffff" text="#000000">
<c:set var = "pageType" value="cart" scope="request"/>

<div style="width:98%; margin-left:10px;">

<form name="detailForm" action="listCart" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
						장바구니
					</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
		</td>
	</tr>
</table>



<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	
	
	
	<tr>
		
		<td colspan="11" >전체  ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">상품명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">가격</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">등록일</td>	
		<td class="ct_line02"></td>
		<td class="ct_list_b">구매 수량</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0"/>
	<c:forEach var="product" items = "${list}">
		<c:set var="i" value="${i+1}"/>
		 
	<tr class="ct_list_pop">
		<td align="center">${i }</td>
		<td></td>
			<td align="left">
				<c:choose>
					<c:when test = "${product.stock > 0}">
						<a href="../product/getProduct?prodNo=${product.prodNo}&menu=${param.menu}"> ${product.prodName}</a>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test = "${user.role eq 'admin'}">
								<a href="../product/getProduct?prodNo=${product.prodNo }&menu=${param.menu}">${product.prodName}</a>
							</c:when>
							<c:otherwise>
								${product.prodName }
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</td>
		
		<td></td>
		<td align="left">${product.price }</td>
		<td></td>
		<td align="left">${product.regDate }</td>
		<td></td>
		<td align="left">
			${quantity}
		</td>	
	</tr>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>	

</c:forEach>
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td align="center">
		
		
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			<input type="hidden" id="menu" name="menu" value=""/>
			
			<%--<jsp:include page="../common/pageNavigator.jsp"/> --%> 
    	</td>
	</tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>

</div>
</body>
</html>
