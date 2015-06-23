<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<sf:form modelAttribute="personaDetalle" method="POST" action="personas?agregarPersona" id="formPersona">
	<div class="form-group">
		<div class="col-xs-12 col-sm-6">
			<strong>identificacion:</strong>
		</div>
		<div class="col-xs-12 col-sm-6">
			<sf:input type="text" path="identificacion"  class="form-control" required="required"/>
		</div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6">
           	<strong>Nombre:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:input path="nombre" class="form-control" cssErrorClass="inputError" required="required"/>
           </div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6">
           	<strong>Apellido Paterno:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:input path="apePaterno" class="form-control" required="required"/>
           </div>
	</div>
	<div class="form-group">
		<div class="col-xs-12 col-sm-6">
           	<strong>Apellido Materno:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:input path="apeMaterno" class="form-control" required="required"/>
           </div>
	</div>
       <div class="form-group">
       	<div class="col-xs-12 col-sm-6">
           	<strong>Email:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:input path="email" class="form-control" required="required"/>
           </div>
       </div>
       <div class="form-group">
       	<div class="col-xs-12 col-sm-6">
           	<strong>Telefono:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:input path="telefono" class="form-control" required="required"/>
           </div>
       </div>
       <div class="form-group">
       	<div class="col-xs-12 col-sm-6">
           	<strong>Genero:</strong>
           </div>
           <div class="col-xs-12 col-sm-6">
           	<sf:select path="genero.id" class="form-control" items="${generos}" itemValue="id" itemLabel="descripcion"  required="required"/>
           </div>
       </div>
       
	<input type="submit" class="hidden" id="enviarPersona" value="enviar">
 		 </sf:form>