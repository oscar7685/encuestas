<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${pageContext.servletContext.contextPath}/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.servletContext.contextPath}/assets/css/docs.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/dist/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/dist/js/dataTable.js" ></script>
<div class="container">
    <div class="row">
        <div id="conte" class="span10">

            <h3 style="margin: 0;">Listado de  Personas que han respondido</h3>
            <c:choose>
                <c:when test="${fn:length(listaPersonas)!= 0}">

                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span2">Nombre</th>
                        <th class="span2">Tipo</th>
                        <th class="span3">Programa</th>
                        <th class="span3">Facultad</th>
                        <th class="span2">Ver respuestas</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaPersonas}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                    <td>   
                                        <c:choose>
                                            <c:when test="${row.semestre != null && row.semestre != ''}"> 
                                                Estudiante
                                            </c:when>
                                            <c:when test="${row.vinculacion != null && row.vinculacion != ''}"> 
                                                Docente
                                            </c:when>    
                                        </c:choose>

                                    </td>
                                    <td>   
                                        <c:out value="${row.programaIdprograma.programa}"/>
                                    </td>
                                    <td>   
                                        <c:out value="${row.programaIdprograma.facultadIdfacultad.facultad}"/>
                                    </td>
                                    <td>
                                        <a href="Encuestas?accion=verRespuestas&persona=${row.idpersona}" title="Editar">Ver respuestas</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen Personas registradas en el sistema.
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>