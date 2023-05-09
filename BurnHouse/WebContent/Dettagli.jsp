<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, model.ProductBean" %>


<%
	// Recupera l'id del prodotto dalla richiesta
	int productId = Integer.parseInt(request.getParameter("id"));

	// Recupera la lista dei prodotti dalla sessione
	Collection<?> products = (Collection<?>) session.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}


	// Cerca il prodotto corrispondente alla lista dei prodotti
	
	Iterator<?> it = products.iterator();
	while (it.hasNext()) {
		ProductBean bean = (ProductBean) it.next();
		if(bean.getCode()==productId){
			%>


<!DOCTYPE html>
<html>
<%@ include file="Header.jsp" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=bean.getName()%></title>
	<link rel="stylesheet" type="text/css" href="StileDettagli.css">
</head>
<body>
	
	<main class="container">
 
  <!-- Left Column / Headphones Image -->
  <div class="left-column">
    <img src="${pageContext.request.contextPath}/Images/<%=bean.getImg() %>" alt="<%=bean.getName() %>" style="width:100%">
  </div>
 
 
  <!-- Right Column -->
  <div class="right-column">
 
    <!-- Product Description -->
    <div class="product-description">
      <span><%=bean.getType()%></span>
      <span><%=bean.getDegree()%>% vol. alcol</span>
      <h1><%=bean.getName()%></h1>
      <p><%=bean.getDescription()%></p>
   </div>
 


 
    <!-- Product Pricing -->
    <div class="product-price">
      <span><%=String.format("%.2f", bean.getPrice()) %>€</span>
      <a href="CartController?action=addCart&id=<%=bean.getCode()%>" class="cart-btn">Aggiungi al carrello</a>
    </div>
  </div>
</main>
	
	<jsp:include page="Footer.jsp" />
</body>
</html>
<% 
	}
}
%>