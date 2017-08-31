<%-- 
    Document   : usuario
    Created on : 24/08/2017, 19:44:24
    Author     : Mileto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastro de usuarios</h1>
        <form name="cadUsuario" action="/HelpWeb/acao" method="post">
            <label>Nome</label>
            <br>
            <input type="text" name="nome">
            <br>
            <label> E-mail</label>
            <br>
            <input type="email" name="email">
            <br>
            <label> Senha</label>
            <br>
            <input type="password" name="senha">
            <br>
            <br>
            <input type="submit" name="enviar" value="salvar">
        </form>
    </body>
</html>
