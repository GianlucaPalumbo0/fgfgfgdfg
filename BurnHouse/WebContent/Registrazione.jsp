<%@ page language="java" contentType="text/html; UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Registrazione</title>

<meta charset="UTF-8">
</head>
<body>
<br><br><br>
<center><form action="UserController" method="POST">
<h2>Registrazione</h2>
<fieldset>
<legend>Dati anagrafici:</legend>
<label for="fname">Nome <br><input type="text" name="nome" required></label>
<label for="sname">Cognome <br><input type="text" name="cognome" required></label>
<label for="email">Email d'accesso<br><input type="email" name="email"></label>
<label for="pass">Password<br><input type="password" name="password"></label>
</fieldset>
</form></center>
</body>
</html>