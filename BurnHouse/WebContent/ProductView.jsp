<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	Collection<?> products = (Collection<?>) request.getAttribute("products");
	if(products == null) {
		response.sendRedirect("./product");	
		return;
	}
	
	session.setAttribute("products", products);
	ProductBean product = (ProductBean) request.getAttribute("product");
	
	
	Boolean isAdmin = (Boolean)session.getAttribute("adminFilter");
%>

<!DOCTYPE html>
<html>
<%@ page contentType="text/html; charset=UTF-8" import="java.util.*,model.ProductBean"%>
<%@ page import="java.io.OutputStream" %>
<%@ include file="Header.jsp" %>
<hr>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Catalogo BurnHouse</title>
	<link rel="stylesheet" type="text/css" href="StileCatalogo.css">	
</head>

<body>
	<ul>
		<li><a href="product?sort=codice">Ordina i prodotti per codice</a></li>
		<li><a href="product?sort=nome">Ordina i prodotti per nome</a></li>
		<li><a href="product?sort=prezzo">Ordina i prodotti per prezzo</a></li>
		<%if(isAdmin!=null && isAdmin!=false){ %>
		<li><a href="Insert.jsp" target="_blank">Aggiungi prodotto al catalogo</a><br></li>
		<%} %>  
	</ul>
	
		<form method="post" action="product">
				<input type="hidden" name="action" value="filter">
			 	<label for="minGradazione">Gradazione minima:</label>
			  	<input type="text" name="minGradazione" pattern="[0-9]+" required>
			  	<label for="maxGradazione">Gradazione massima:</label>
			  	<input type="text" name="maxGradazione" pattern="[0-9]+" required>
			  	<button type="submit">Filtra</button>	  	
		</form>
		
		

		<%
		
		
		if(request.getAttribute("filteredProducts") != null){
			Collection<?> filteredProducts = (Collection<?>) request.getAttribute("filteredProducts");
			session.setAttribute("filteredProducts", filteredProducts);
			response.sendRedirect("Filtro.jsp");
		}
		
	
			if (products != null && products.size() != 0) {
				Iterator<?> it = products.iterator();
				while (it.hasNext()) {
					ProductBean bean = (ProductBean) it.next();
					
		%>
		  
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
		
		<%
				}
			} 
			else{
				 %>
				 
				<h1>Catalogo momentaneamente non disponibile</h1> 
				
				 <%
			}
		%>
	<jsp:include page="Footer.jsp" />
</body>
</html>