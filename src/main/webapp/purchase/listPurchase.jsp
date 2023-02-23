<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript">
	function fncGetPurchaseList(currentPage, searchOrderType) {
		document.getElementById("currentPage").value = currentPage;
		document.getElementById("searchOrderType").value = searchOrderType;
		document.detailForm.submit();
	}
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<c:set var = "pageType" value="purchase" scope="request"/>

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="listPurchase" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		
		<td align="right">
			<select name="searchCondition" class="ct_input_g" style="width:80px" onChange = "javaScript:fncGetProductList('${resultPage.currentPage }','${param.menu }')">
					
						<option value="0" ${ search.searchCondition == 0 ?" selected":""}>주문번호</option>
						<c:if test = "${user.role eq 'admin'}">
							<option value="1" ${ search.searchCondition == 1 ?" selected":""}>유저ID</option>
						</c:if>
						<option value="2" ${ search.searchCondition == 2 ?" selected":""}>구매자명</option>
						<option value="3" ${ search.searchCondition == 3 ?" selected":""}>주문날짜</option>
					
			</select>
			<c:choose>
				<c:when test="${search.searchCondition == 3}">
					&nbsp;
					최소가<input type="text" name="searchMinPrice" value="${search.searchMinPrice }" class="ct_input_g" style="width:100px; height:19px" />
					&nbsp;
					최대가<input type="text" name="searchMaxPrice" value="${search.searchMaxPrice }" class="ct_input_g" style="width:100px; height:19px" />
				</c:when>
				
				<c:otherwise>
					<input type="text" name="searchKeyword" value="${search.searchKeyword }" class="ct_input_g" style="width:200px; height:19px" />
				</c:otherwise>
			</c:choose>
		</td>
			
			
		<td align="right" width="70">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						<a href="javascript:fncGetProductList('1', '${param.menu }');">검색</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td align="right">
			<input type="hidden" id="searchOrderType" name="searchOrderType" value="">
		</td>
		
		<jsp:include page="../common/searchOrderTypeNavigator.jsp"/>
				
	</tr>

	<tr>
		<td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">구매자명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	
	
		<c:set var = "i" value ="0"/>
		<c:forEach var ="purchase" items="${list }">
			<c:set var = "i" value = "${i+1}"/>
		<tr class="ct_list_pop">
		<td align="center">
			
			<a href="getPurchase?tranNo=${purchase.tranNo}">${purchase.tranNo}</a>
		</td>
		<td></td>
		<td align="left">
			<a href="../user/getUser?userId=${purchase.buyer.userId}">${purchase.buyer.userId}</a>
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.receiverPhone}</td>
		<td></td>
		<td align="left">
		
		
		<c:if test="${!(purchase.tranCode eq '0')}">
				현재
			<c:choose>
				<c:when test ="${purchase.tranCode eq '1'}">
					구매완료
				</c:when>
			
				<c:when test ="${purchase.tranCode eq '2'}">
					배송중
				</c:when>
				
				<c:when test ="${purchase.tranCode eq '3'}">
					배송완료
				</c:when>
			</c:choose>
				 상태 입니다.
		</c:if>
		</td>
		
		<td></td> 
   		<td align="left">
		<c:if test = "${purchase.tranCode eq '1' && user.role eq 'admin' }">
			<a href="updateTranCode?tranNo=${purchase.tranNo}&tranCode=2&page=${resultPage.currentPage}">배송하기</a>
		</c:if>
		<c:if test = "${purchase.tranCode eq '2' && user.role eq 'user'}">
			<a href="updateTranCode?tranNo=${purchase.tranNo}&tranCode=3&page=${resultPage.currentPage}">물건도착</a>
		</c:if>
		</td>
	</tr>
	
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>

</c:forEach>		
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
			<input type="hidden" id="currentPage" name="currentPage" value=""/>
			
			<jsp:include page="../common/pageNavigator.jsp"/>
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>