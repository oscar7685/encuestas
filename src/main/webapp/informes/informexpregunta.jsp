<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
           <br/>
            pregunta: ${pregunta.pregunta}<br/>
            <c:set var="actual" value="2000"></c:set>
            <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                respuesta: ${respuesta.respuesta}  ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} <br/>
                <c:set var="actual" value="${iter2.index}"></c:set>
            </c:forEach>
            <c:choose>
                <c:when test="${pregunta.otro == 'true'}">
                    <b>${pregunta.labelOtro} : ${cantidadXrespuestaXPregunta.get(iter.index).get(actual + 1)} </b>
                    <br/>
                </c:when>
            </c:choose>
                    total Respuestas: ${totalrespuestas.get(iter.index)} <br/>
        </c:forEach>
    </body>
</html>
