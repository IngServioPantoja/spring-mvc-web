<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Mostrar persona</h1>
        <ul>
            <li>Nombre: ${pVal.nombre}</li>
            <li>Apellido: ${pVal.apellido}</li>
            <li>Correo: ${pVal.correo}</li>
        </ul> 
        <a href="form.htm?verForm">Ir a Registrar persona</a>
    </body>
</html>
