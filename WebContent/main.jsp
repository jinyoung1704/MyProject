<%@page import="java.util.function.Function"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#addButton").click(function()
		{
			$("addList").submit();
		});
		
	});

	
	function deleteList(obj)
	{
		//alert("확인");
		var listname = obj.getAttribute("id");
		alert(listname);
		$(location).attr("href","deletelist.action?listname=" + listname);
	}
	
	function search()
	{
		alert("확인");
	}
	
</script>
</head>
<body>
	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h3 class="text-center">
				My List
			</h3>
			<div class="col-md-3">
			</div>
			
			<div class="col-md-6">
			<form action="addList.action" id="addList">
				<div class="form-group">
					 
					<label for="name">
						Name
					</label>
					<input type="text" class="form-control" id="name" name="name" />
				</div>
				<div class="form-group">
					 
					<label for="url">
						URL
					</label>
					<input type="text" class="form-control" id="url" name="url"/>
				</div>
					 
				<button type="submit" class="btn btn-primary" id="addButton">
					ADD
				</button>
				<button type="reset" class="btn btn-pirmary" id="resetButton">
					RESET
				</button>
			</form>
			</div>
			
			<div class="col-md-3">
			</div>
		</div>
	</div>
	
<!-- 	
	<div class="row">
	
		<div class="col-md-3">
		</div>
		
		<div class="col-md-6">
		<span class="glyphicon glyphicon-grain"></span>
		</div>
		
		<div class="col-md-3">
		</div>
		
	</div>
 -->
	
	<div class="row">
		<div class="col-md-3">
		</div>
		<div class="col-md-6">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>
							Number
						</th>
						<th>
							Name
						</th>
						<th>
							URL
						</th>
						<th>
							Date
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${lists }" varStatus="status" begin="0" >
						<tr>
							<td>${status.count }
							<td>${list.name }</td>
							<td><a href="${list.url }">${list.url }</a></td>
							<td>${list.wdate }</td>
							<td><input type="button" id="${list.name }" class="btn btn-pirmary" value="delete" onclick="deleteList(this)"></td>
						</tr>					
					</c:forEach>
				
				</tbody>
			</table>
		</div>
		<div class="col-md-3">
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
		</div>
		
		
		
		
		<div class="col-md-6">
		
		<!--검색 영역  -->
			<tr align="right" style="height: 30px;" class="form-control">
			 	
			 	<form name="searchForm" method="post">
			 	<div class="form-inline col-md-12">
			 			<select name="searchKey" class="form-control" style="height: 33px;width: 100px;">
			 				<option value="subject">제목</option>
			 				<option value="url">주소</option>
			 			</select>
			 		
			 			<input type="text" name="searchValue" class="form-control boxTF" style="width:30%;">
			 			<input type="button" value=" 검 색 " class="btn btn-pirmary" onclick="search()">
			 		
			 	</div></form>
			 </tr>
			
			
			<!-- 페이징 처리에 따른 페이지 인덱스 적용  -->
		<c:if test="${dataCount != 0 }">
			
			 
			 <nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="main.action?pageNum=1">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="${pageIndexList }">${pageIndexList }</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="main.action?pageNum=1">Next</a>
					</li>
					
		
				</ul>
			</nav>
			 
			 
		</c:if>
		</div>
		
		<div class="col-md-3">
		</div>
	</div>
</div>
</body>
</html>