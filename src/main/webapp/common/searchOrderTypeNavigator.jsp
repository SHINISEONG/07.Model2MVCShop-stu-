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
	</c:choose>	
		
	
		<td colspan="10" align="right">
			<c:if test="${pageType eq 'purchase' }">
			<select name="searchTranCodeCondition" class="ct_input_g" style="width:80px" onChange = "javaScript:fncGetProductList('${resultPage.currentPage }','${param.menu }')">
					<c:if test = "${user.role eq 'admin'}">
						<option value="1" ${ search.searchCondition == 1 ?" selected":""}>배송전</option>
						<option value="2" ${ search.searchCondition == 2 ?" selected":""}>배송중</option>
						<option value="3" ${ search.searchCondition == 3 ?" selected":""}>배송완료</option>
					</c:if>
			</select>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			</c:if>
			<c:if test="${pageType eq 'user' }">
				<a href="javascript:${fncName }('1', 'orderByUserIdASC'${menu })">
				ID순&nbsp;&nbsp;&nbsp;&nbsp;
				</a>
			</c:if>
			<a href="javascript:${fncName }('1', 'orderByDateDESC'${menu })">
			최근등록순&nbsp;&nbsp;&nbsp;&nbsp;
			</a>
			<a href="javascript:${fncName }('1', 'orderByDateASC'${menu })">
			오래된등록순&nbsp;&nbsp;&nbsp;&nbsp;
			</a>
			<c:if test="${pageType eq 'product' }">
				<a href="javascript:${fncName }('1', 'orderByPriceDESC'${menu })">
				가격높은순&nbsp;&nbsp;&nbsp;&nbsp;
				</a>
				<a href="javascript:${fncName }('1', 'orderByPriceASC'${menu })">
				가격낮은순&nbsp;&nbsp;
				</a>
			</c:if>
		</td>
	