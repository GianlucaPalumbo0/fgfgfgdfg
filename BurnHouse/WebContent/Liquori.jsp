<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="model.*" %>
<%Boolean isAdmin = (Boolean)session.getAttribute("adminFilter"); %>
<!DOCTYPE html>
<html>
<%@ page import="java.util.*" %>
<%@ include file="Header.jsp" %>
<head>
<meta charset="UTF-8">
<title>Liquori</title>
<link rel="stylesheet" type="text/css" href="StileCatalogo.css">	
</head>
<body>
<hr>
	<%
    ProductModelDS model = new ProductModelDS();
    Collection<ProductBean> products = model.doRetrieveByLiquore();
	%>
	
	
	<% for (ProductBean bean : products) { %>
    <div class="card">
	<div class="img-container">
		<a href="Dettagli.jsp?id=<%=bean.getCode()%>" target="_blank">
  		<img src="${pageContext.request.contextPath}/Images/<%=bean.getImg()%>" alt="<%=bean.getName() %>" style="width:100%"></a>
 			<div class="btn-container">
  				 <a href="CartController?action=addCart&id=<%=bean.getCode()%>"><button class="btn" >Aggiungi al carrello</button></a>
  			</div>
  	</div>
  <hr> <!-- Aggiungi una linea orizzontale come divisore -->
  	<div class="product-info"> <!-- crea un div per il nome e il prezzo del prodotto -->
    	<h4><%=bean.getName() %></h4>
   		<div><p class="price">€<%=String.format("%.2f", bean.getPrice()) %></p></div>  
  	</div>
  	<%if(isAdmin!=null && isAdmin!=false){ %>
  	
  	<a href="product?action=delete&id=<%=bean.getCode()%>"><button>Elimina</button></a><br>
  	<a href="Modifica.jsp?id=<%=bean.getCode()%>" target="_blank"><button>Modifica</button></a><br>
  	<%} %>  
</div>
<% } %>
	<jsp:include page="Footer.jsp" />
</body>
</html>

