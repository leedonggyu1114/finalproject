<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행의 설렘 TOURSUM !</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>Hotel read</h1>
	<table ></table>
	
	<script id="temp" type="text/x-handlebars-template">
		<tr>
			<td></td>
			<td></td>
		</tr>
		{{#each .}}
		<tr>
			<td></td>
			<td></td>
		</tr>		
		{{/each}}
	</script>
	

</body>
<script>
var c_id="${c_id}";

</script>
</html>