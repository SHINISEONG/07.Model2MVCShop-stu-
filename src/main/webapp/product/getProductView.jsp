<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">
<!--
function fncAddProduct(){
	//Form 유효성 검증
	var name = document.detailForm.prodName.value;
	var detail = document.detailForm.prodDetail.value;
	var manuDate = document.detailForm.manuDate.value;
	var price = document.detailForm.price.value;

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
		
	document.detailForm.action='updateProduct';
	document.detailForm.submit();
}

function fncAddCart(){
	
	document.detailForm.action='../purchase/addCart';
	document.detailForm.submit();
}

function resetData(){
	document.detailForm.reset();
}
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">


<form name="detailForm" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">
					<c:choose>
						<c:when test = "${param.menu eq 'manage'}">
							상품수정
						</c:when>
						<c:when test = "${param.menu eq 'search'}">
							상품상세조회
						</c:when>
					</c:choose>
					
					</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37">
			<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
		</td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<c:if test = "${param.menu eq 'search'}">
		<tr>
			<td width="104" class="ct_write">
				상품번호 <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${product.prodNo } </td>
					</tr>
				</table>
			</td>
		</tr>
	</c:if>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			상품명 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">
						<c:choose>
							<c:when test = "${param.menu eq 'manage'}">
								<input type="text" name="prodName" value ="${product.prodName }" class="ct_input_g" 
								       style="width: 100px; height: 19px" maxLength="20">
							</c:when>
							
							<c:when test = "${param.menu eq 'search'}">
								${product.prodName }
							</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<c:if test = "${param.menu eq 'search'}">
		<tr>
			<td width="104" class="ct_write">
			상품이미지 <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
							${product.fileName }
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</c:if>
	
	<tr>
		<td width="104" class="ct_write">
			상품상세정보	<img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			
			
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:choose>
				<c:when test = "${param.menu eq 'manage'}">
						<input type="text" name="prodDetail" value ="${product.prodDetail }" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
				</c:when>
				
				<c:when test = "${param.menu eq 'search'}">
					${product.prodDetail }
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			제조일자 
			<c:if test = "${param.menu eq 'manage'}">			
				<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</c:if>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:choose>
				<c:when test = "${param.menu eq 'manage'}">
						<input type="text" name="manuDate" value ="${product.manuDate}" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
				</c:when>
				
				<c:when test = "${param.menu eq 'search'}">
					${product.manuDate}
				</c:when>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			가격 
			<c:if test = "${param.menu eq 'manage'}">	
				<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</c:if>
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<c:choose>
				<c:when test = "${param.menu eq 'manage'}">
						<input type="text" name="price" value ="${product.price}" class="ct_input_g" 
								style="width: 100px; height: 19px" maxLength="20">
				</c:when>
			
				<c:when test = "${param.menu eq 'search'}">
					${product.price}
				</c:when>
			</c:choose>
			
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<c:if test = "${param.menu eq 'manage'}">
		<tr>
			<td width="104" class="ct_write">상품이미지</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
	
							<input type="text" name="fileName" value ="${product.fileName}" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="104" class="ct_write">재고</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
	
							<input type="text" name="stock" value ="${product.stock}" class="ct_input_g" 
									style="width: 100px; height: 19px" maxLength="20">
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</c:if>
	<c:if test = "${param.menu eq 'search'}">
		<tr>
			<td width="104" class="ct_write">등록일자</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${product.regDate }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</c:if>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				
				
				<if test = "${param.menu eq 'search' && !(user.role eq 'admin')}">
					
					<td>
					장바구니에 담을 수량 &nbsp;
					<select name="quantity" class="ct_input_g" style="width:80px">
						<c:forEach var="i" begin = "1" end = "${product.stock }" >
							<option value="${i }" >${i }</option>
						</c:forEach>
					</select>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
						<input type = "hidden" name = "prodNo" value = "${param.prodNo }"/>
						<a href="javascript:fncAddCart();">장바구니에 담기</a>
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
				</if>
				<td width="17" height="23">
					<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
				</td>
				<c:choose>
					<c:when test = "${empty updateChecker || updateChecker}">
					
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<c:choose>
						<c:when test = "${param.menu eq 'manage'}">
							<input type = "hidden" name = "prodNo" value = "${param.prodNo }"/>
							<input type = "hidden" name = "menu" value = "search"/>
							<a href="javascript:fncAddProduct();">수정</a>
						</c:when>
						<c:when test = "${param.menu eq 'search' && !(user.role eq 'admin')}">
							<a href="../purchase/addPurchaseView?prodNo=${product.prodNo }">구매</a>
						</c:when>
					</c:choose>
					</td>
					
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
					
					
						<a href="javascript:history.go(-1)">
						<c:choose>
							<c:when test = "${param.menu eq 'manage'}">
								취소
							</c:when>
							<c:when test = "${param.menu eq 'search'}">
								이전
							</c:when>
						</c:choose>
						</a>
					</td>
				</c:when>
				<c:when test = "${param.updateChecker}">
					<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
					<a href="listProduct?menu=manage">확인</a>
					</td>
				</c:when>
				</c:choose>
				
				<td width="14" height="23">
					<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
				</td>
				
			</tr>
		</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>