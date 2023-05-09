<!-- header.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%Boolean ad = (Boolean)session.getAttribute("adminFilter"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Burn House</title>
    <link rel="stylesheet" type="text/css" href="Header.css">
  </head> 

  <body>
      <div class= "linea">
      <h2>Consegna in Italia in 1 - 3 giorni lavorativi | gratuita oltre i 49,90€ </h2>
      </div>

      <header>
        <div id="zonaleft">
        <a href="Home.jsp">
          <img id="headerLogo"src="Images/logog.png" alt="Burn House header logo image">
        </a>
        </div>
  
        <div id="zonacenter">
          <form action="#" method="get">
            <input id="search-box-input" type="search" name="search" maxlength="255" placeholder="Cosa stai cercando ?" autocomplete="off">
          </form>
          
        </div>
  
        <div id="zonaright">
        <%if(ad==null){ %>
          <a href="Login.jsp" title="Accedi">Accedi</a>
          <%}else{ %>
          <a href="/LogoutServlet" title="Logout">Esci</a>
          <%} %>
          <a href="Carrello.jsp" title="Carrello">Carrello</a>
          
        </div>
      </header>

    <nav>
      <ul>
        
        <li><a href="Azienda.jsp">Azienda</a></li>
        <li><a href="Cantine.jsp">Cantine</a></li>
        <li><a href="ProductView.jsp">Catalogo</a></li>
        <li><a href="Vini.jsp">Vini</a></li>
        <li><a href="Distillati.jsp">Distillati</a></li>
        <li><a href="Liquori.jsp">Liquori</a></li>
        <li><a href="Contatti.jsp">Contatti</a></li>
      </ul>
    </nav>
  </body>
</html>



            

