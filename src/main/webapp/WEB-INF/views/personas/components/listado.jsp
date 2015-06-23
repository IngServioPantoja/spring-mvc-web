<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-striped" id="idTablaPersonas">
	<thead>
		<tr>
			<th>Identificacion</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Acciones</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="persona" items="${personas}">
			<tr>
				<td>${persona.identificacion}</td>
				<td>${persona.nombre}</td>
				<td>${persona.apeMaterno}</td>
				<td style="max-width:100px;">
				
					<form action="personasServlet" method="GET" style="display:inline-block;">
						<input type="hidden" value="consultar" name="accion">
						<input type="hidden" name="idPersona" value="${persona.idPersona}">
						<input type="submit" value="Consultar" class="btn btn-primary" >
					</form>
					
					<form action="personasServlet" method="GET" style="display:inline-block;">
						<input type="hidden" value="modificar" name="accion">
						<input type="hidden" name="idPersona" value="${persona.idPersona}">
						<input type="submit" value="Modificar" class="btn btn-success" >
					</form>
					
					<form action="personasServlet" method="POST"
						 onsubmit="return confirm('Realemte desea eliminar este registro');" 
						 style="display:inline-block;">
						<input type="hidden" value="eliminar" name="accion">
						<input type="hidden" name="idPersona" value="${persona.idPersona}">
						<input type="submit" value="Eliminar" class="btn btn-danger" >
					</form>
				
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<script type="text/javascript">
   	$(document).ready( function () {
	    $('#idTablaPersonas').DataTable();
	});
</script>