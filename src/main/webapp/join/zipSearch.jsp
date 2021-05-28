<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ page import="com.toron.dto.ZipcodeBean" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<!--Bootstrap-->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8"
            crossorigin="anonymous"></script>
	<meta charset="UTF-8">
	<title>zipSearch.jsp</title>
	<script src="../js/script.js" type="text/javascript"></script>
	<script type="text/javascript">
		function sendAdd(zipcode, addr){
			opener.document.join.zipcode.value=zipcode;  // member.jsp 내부
			opener.document.join.address.value=addr;  	// member.jsp 내부
			self.close();
		}
	</script>
</head>
<body>
	<div algin="center">
			<form action="../ZipSearchServlet" name="zipFrm" method="post" >
				<table>
					<tr>
						<td>
							도로명 입력 &nbsp;&nbsp;<input type="text" name="area3" required="required" />
							<input type="submit"  class="btn btn-success" value="검색" />
						</td>
					</tr>
					
					<c:if test="${search == 'y'}">
						<c:if test="${empty zipList}">
							<tr>
								<td align="center">검색된 결과가 없습니다.</td>
							</tr>
						</c:if>
					
						<c:if test="${not empty zipList}">
							<tr>
								<td align="center">* 검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
							</tr>
							<%
								ArrayList<ZipcodeBean> zipList= (ArrayList<ZipcodeBean>)request.getAttribute("zipList");
								for(int i=0; i<zipList.size(); i++){
									ZipcodeBean zBean=zipList.get(i);
									String rZipcode=zBean.getZipcode();
									String rArea1=zBean.getArea1();
									String rArea2=zBean.getArea2();
									String rArea3=zBean.getArea3();
									String adds=rArea1+"  "+rArea2+"  "+rArea3+"  ";
							%>
									<tr>
										<td>
											<a href="#" onclick="javascript:sendAdd('<%=rZipcode %>','<%=adds %>')" >
												<%=rZipcode+"  "+adds %>
											</a>
										</td>
									</tr>
							<%} %>
						</c:if>
					</c:if>
					  
					<tr>
						<td align="center">
							<a href="#"  onclick="self.close()" style="color: green; text-decoration: none;">닫기</a>
						</td>
					</tr>
					
				</table>
				<input type="hidden" name="search" value="y" />
			</form>
		
		</div>
</body>
</html>