<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<c:choose>
		<c:when test = "${pageType eq 'user' }">
			<c:set var = "fncName" value =  "fncGetUserList"/>
		</c:when>
		
		<c:when test = "${pageType eq 'product' }">
			<c:set var = "fncName" value =  "fncGetProductList"/>
			<c:set var = "menu" value = ",'${param.menu}'"/>
		</c:when>
		
		<c:when test = "${pageType eq 'purchase'}">
			<c:set var = "fncName" value =  "fncGetPurchaseList"/>
		</c:when>
		
		<c:when test = "${pageType eq 'cart' }">
			<c:set var = "fncName" value =  "fncGetCartList"/>
		</c:when>
	</c:choose>	
		
		<c:if test="${ resultPage.currentPage <= resultPage.pageUnit }">
				◀ 이전
		</c:if>
		<c:if test="${ resultPage.currentPage > resultPage.pageUnit }">
				<a href="javascript:${fncName }('${ resultPage.currentPage-1}','${search.searchOrderType}'${menu })">◀ 이전</a>
		</c:if>
		
		<c:forEach var="i"  begin="${resultPage.beginUnitPage}" end="${resultPage.endUnitPage}" step="1">
			<a href="javascript:${fncName }('${ i }','${search.searchOrderType}'${menu });">${ i }</a>
		</c:forEach>
		
		<c:if test="${ resultPage.endUnitPage >= resultPage.maxPage }">
				이후 ▶
		</c:if>
		<c:if test="${ resultPage.endUnitPage < resultPage.maxPage }">
				<a href="javascript:${fncName }('${resultPage.endUnitPage+1}','${search.searchOrderType}'${menu })">이후 ▶</a>
		</c:if>
	
	