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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$("#addButton").click(function()
	{
		$("addList").submit();
	});
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
						</tr>					
					</c:forEach>
					<!-- <tr>
						<td>
							1
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							Default
						</td>
						<td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-active">
						<td>
							2
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							Approved
						</td>
						<td>
							01/04/2012
						</td>
					</tr>
					<tr class="table-success">
						<td>
							3
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							Declined
						</td>
						<td>
							02/04/2012
						</td>
					</tr>
					<tr class="table-warning">
						<td>
							4
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							Pending
						</td>
						<td>
							03/04/2012
						</td>
					</tr>
					<tr class="table-danger">
						<td>
							5
						</td>
						<td>
							TB - Monthly
						</td>
						<td>
							Call in to confirm
						</td>
						<td>
							04/04/2012
						</td>
					</tr> -->
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
			<nav>
				<ul class="pagination">
					<li class="page-item">
						<a class="page-link" href="#">Previous</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">1</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">2</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">3</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">4</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">5</a>
					</li>
					<li class="page-item">
						<a class="page-link" href="#">Next</a>
					</li>
				</ul>
			</nav>
		</div>
		
		<div class="col-md-3">
		</div>
	</div>
</div>
</body>
</html>