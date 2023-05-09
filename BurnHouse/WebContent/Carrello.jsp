<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ include file="Header.jsp" %>
<%@ page import="java.util.*, model.Carrello,model.CartProduct" %>
	<head>
		<meta charset="UTF-8">
		<title>Carrello</title>
		<link rel="stylesheet" type="text/css" href="StileCarrello.css">	
	</head>
	<body>
		<%Carrello cart=(Carrello)request.getSession().getAttribute("cart"); %>
		<hr>
		<%if(cart==null || cart.GetCart().size()==0) {%>
		<center>Carrello vuoto, aggiungi qualcosa</center>
				
		<%}else{ %>
		<br>
		<table border=1>
			<tr>
				<th>Nome</th>
				<th>Prezzo</th>
				<th>Quantita</th>
			</tr>
			<% int i=0;
			while(i<cart.GetCart().size()){
				CartProduct order=cart.GetCart().get(i);%>
			<tr>
				<td><a href ="Dettagli.jsp?id=<%=order.GetCode()%>" target="_blank"><%=order.GetNome()%></a></td>
				<td>€<%=String.format("%.2f", order.GetPrezzo()) %></td>
				<td><%=order.GetQuantita()%>
				<a href="CartController?action=Increment&index=<%=i%>"class="button">+</a>
				<a href="CartController?action=Decrement&index=<%=i%>"class="button">-</a></td>
				<%i++; %>	
			</tr>
			<%} %>
		</table>
		<%}%>
		<jsp:include page="Footer.jsp" />
	</body>
</html>