<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./../Estilos/Estilo.css">
<title>Banco Pig</title>
</head>
<body>
<nav >

<h1 class="Menu"><i class="bi bi-bank" style="font-size: 50px ; margin-right:20px;"></i>Banco Pig</h1>
</nav>
<div class="Menu">
<i class="bi bi-person-circle">Usuario</i>
<i class="bi bi-cash">10000</i><i class="bi bi-eye"></i>
<%-- <i class="bi bi-eye-slash"></i> --%>
<input type="submit" class="boton Cuentas" value="Usuario">      
<input type="submit" class="boton Cuentas" value="cuenta 1">
<input type="submit" class="boton Cuentas" value="cuenta 2">
<input type="submit" class="boton Cuentas" value="cuenta 3">
</div>
<div class="Menu-iconos">
<i class="bi bi-cash-stack">Prestamos</i>
<i class="bi bi-arrow-left-right">Transferencias</i>
<i class="bi bi-credit-card-fill">Trajetas</i>
<i class="bi bi-bar-chart">Inversión rápida</i>
</div>
<div style="text-align: center; ">
<h2 class="Menu-iconos" >Ultimos Movimientos</h2>
<table class="Menu-iconos">
  <thead>
    <tr style="border-bottom: 2px solid #fff;" >
      <th>Codigo</th>
      <th>Tipo de operacion</th>
      <th>Fecha y Hora</th>
      <th>Monto</th>
    </tr>
  </thead>
  <tbody>
    <tr style="border:none;border-bottom: 2px solid #fff;">
      <td>Dato 1</td>
      <td>Dato 2</td>
      <td>Dato 3</td>
      <td>Dato 4</td>
    </tr>
    <tr style="border-bottom: 2px solid #fff;">
      <td>Dato 1</td>
      <td>Dato 2</td>
      <td>Dato 3</td>
      <td>Dato 4</td>
    </tr>
    <tr style="border-bottom: 2px solid #fff;">
      <td>Dato 1</td>
      <td>Dato 2</td>
      <td>Dato 3</td>
      <td>Dato 4</td>
    </tr>
  </tbody>
</table>

<input type="submit" class="boton Menu-iconos" value="Movimientos">
</div>
</body>
</html>