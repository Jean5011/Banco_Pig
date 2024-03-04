<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./../Estilos/Estilo.css">
<title>Banco Pig</title>
</head>
<body>
<h1 class="Login"><i class="bi bi-bank" style="display: inline; margin-right:20px;"></i>Bienvenido al Banco Pig</h1>
<form action="get">
<div class="Login">
<h2>Ingrese sus datos </h2>
<i class="bi bi-person-circle" style="disply:"></i>
<label for="Usuario" class="Ingreso" >Usuario</label> <br>
<input type="text" id="Usuario" name="Usuario" class="Ingreso"><br><br>
<label class="Ingreso">Contraseña</label><br>
<input type="password" id="password" class="Ingreso"><br><br>
<input type="submit" value="Ingresar" class="boton"><br><br>
<input type="submit" id="Olvide" class="boton" value="Olvide mi usuario/contraseña"><br><br>
<input type="submit" id="Registarme" class="boton" value="Registarme">
</div>
</form>
</body>
</html>