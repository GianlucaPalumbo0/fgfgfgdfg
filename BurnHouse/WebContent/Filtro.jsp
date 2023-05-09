<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	Collection<?> filteredProducts = (Collection<?>) session.getAttribute("filteredProducts");
	if(filteredProducts == null) {
		response.sendRedirect("./product");	
		return;
	}
	
%>    


 
<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean"%>
<%@ page import="java.io.OutputStream" %>
<html>
<head>
<meta charset="UTF-8">
<title>Gradazione</title>
<link rel="stylesheet" type="text/css" href="StileCatalogo.css">
</head>
<body>

		<ul>
		<li><a href="./product">Torna alla lista dei prodotti</a></li>
		</ul>
		
		
		<%
		if (filteredProducts != null && filteredProducts.size() != 0) {
			Iterator<?> it = filteredProducts.iterator();
			while (it.hasNext()) {
				ProductBean bean = (ProductBean) it.next();
		
		%>
		
		
<div class="card">
	<div class="img-container">
		<a href="Dettagli.jsp?id=<%=bean.getCode()%>" target="_blank">
  		<img src="${pageContext.request.contextPath}/Images/<%=bean.getImg() %>" alt="<%=bean.getName() %>" style="width:100%"></a>
 			<div class="btn-container">
  				 <button class="btn">Aggiungi al carrello</button>
  			</div>
  	</div>
  <hr> <!-- Aggiungi una linea orizzontale come divisore -->
  	<div class="product-info"> <!-- crea un div per il nome e il prezzo del prodotto -->
    	<h4><%=bean.getName() %></h4>
   		<div><p class="price">€<%=String.format("%.2f", bean.getPrice()) %></p></div>  
  	</div>
  	<a href="product?action=delete&id=<%=bean.getCode()%>"><button>Elimina</button></a><br>
  	<a href="Modifica.jsp?id=<%=bean.getCode()%>" target="_blank"><button>Modifica</button></a><br>  
</div>
		<%
				}
			} 
			else{
				 %>
				 
				<h1>Nessun prodotto trovato</h1> 
				
				 <%
			}
		%>
		<jsp:include page="Footer.jsp" />
</body>
</html>