<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*, model.ProductBean, java.sql.Blob" %>

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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Modifica prodotto</title>
</head>
<body>
	<h1>Modifica prodotto</h1>
	
	
	<form action="product" method="post" enctype="multipart/form-data">
	
		<input type="hidden" name="action" value="modify"> 
		
		<input type="hidden" name="id" value="<%=productId%>">
		
		<label for="codice">Codice:</label><br> 
		<input name="codice" type="number" min="0" required><br>
		
		<label for="nome">Nome:</label><br> 
		<input name="nome" type="text" maxlength="20" required placeholder="inserire un nome"><br> 
		
		<label for="prezzo">Prezzo:</label><br> 
		<input name="prezzo" type="number" step="0.01" min="0" required><br>
		
		<label for="descrizione">Descrizione:</label><br>
		<textarea name="descrizione" maxlength="100" rows="3" required placeholder="inserire una descrizione"></textarea><br>
		
		<label for="gradazione">Gradazione:</label><br> 
		<input name="gradazione" type="number" step="0.01" min="0" max="100" required><br>
		
		<label for="tipo">Tipo:</label><br> 
		<input name="tipo" type="text" maxlength="20" required placeholder="inserire il tipo"><br> 
		
		
		<label for="img">Selezionare una foto:</label><br>
  		<input name="img" type="file" id="myfile" ><br><br>

		<input type="submit" value="Aggiungi"><input type="reset" value="Reset">
	</form>
	<jsp:include page="Footer.jsp" />
</body>
</html>
<% 
	}
}
%>