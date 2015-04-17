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
            <c:choose>
                <c:when test="${pregunta.getTipo() == '0'}">
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
                </c:when>
                <c:when test="${pregunta.getTipo() == '1'}">
                    <c:set var="aux5" value="0"></c:set>
                    <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                        respuesta: ${respuesta.respuesta}  ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} 
                        <c:set var="aux" value="0"></c:set>
                        <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                            ${otraStatus.index+1}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}
                            <c:set var="aux" value="${otraStatus.index}"></c:set>
                        </c:forEach>    
                        <c:choose>
                            <c:when test="${pregunta.otro == 'true'}">
                                ${aux+2}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(aux+1)}
                                <b>${iter.index} . ${iter2.index} . ${aux+1}</b>
                            </c:when>
                        </c:choose>   
                        <br/>
                        <c:set var="aux5" value="${iter2.index}"></c:set>
                    </c:forEach>
                    <c:choose>
                        <c:when test="${pregunta.otro == 'true'}">
                            respuesta: ${pregunta.labelOtro}  ${cantidadXrespuestaXPregunta.get(iter.index).get(aux5+1)} 
                            <c:set var="aux7" value="0"></c:set>
                            <c:forEach items="${pregunta.respuestaList}" var="otra2" varStatus="otraStatus2">
                                ${otraStatus2.index+1}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(otraStatus2.index)}
                                <c:set var="aux7" value="${otraStatus2.index}"></c:set>
                            </c:forEach>
                            ${aux7+2}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(aux7+1)}
                        </c:when>
                    </c:choose>
                    <br/>    

                    <%--  total Respuestas: ${totalrespuestas.get(iter.index)} <br/>--%>
                </c:when> 
                <c:when test="${pregunta.getTipo() == '2' || pregunta.getTipo() == '3'  || pregunta.getTipo() == '4'}">
                    Respuestas: 
                    <c:forEach items="${RespuestasPreguntasAbiertas.get(iter.index)}" var="respuestaxx" varStatus="respuestaStatus">
                        ${respuestaxx} ,
                    </c:forEach>
                </c:when>    
                 <c:when test="${pregunta.getTipo() == '9'}">
                    <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                        respuesta: ${respuesta.respuesta}  ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} <br/>
                    </c:forEach>
                </c:when>           
                <c:when test="${pregunta.getTipo() == '6'}">
                    <c:forEach items="${pregunta.respuestaList}" var="respuesta6" varStatus="iter6">
                        respuesta: ${respuesta6.respuesta}  ${cantidadXrespuestaXPregunta6.get(iter.index).get(iter6.index)} <br/>
                    </c:forEach>
                    total Respuestas: ${totalrespuestas.get(iter.index)} <br/>
                </c:when>
                <c:when test="${pregunta.getTipo() == '7'}">
                    <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                        respuesta: ${respuesta.respuesta}  
                        
                        <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                            ${otraStatus.index+1}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}
                        </c:forEach>    
                        <br/>
                       
                    </c:forEach>
                    <br/>    

                    <%--  total Respuestas: ${totalrespuestas.get(iter.index)} <br/>--%>
                </c:when>  
            </c:choose> 

        </c:forEach>
    </body>
</html>
