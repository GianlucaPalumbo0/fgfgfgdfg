<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aggiungi prodotto</title>
</head>
<body>
		<form action="product" method="post" enctype="multipart/form-data">
		
		<input type="hidden" name="action" value="insert"> 
		
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
		
		
</body>
</html>