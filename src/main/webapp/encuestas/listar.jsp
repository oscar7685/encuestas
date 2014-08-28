<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
           
            <h3 style="margin: 0;">Listado de  Encuestas</h3>
            <c:choose>
                <c:when test="${fn:length(listaE)!= 0}">

                    <table id="tablaX" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <th class="span8">Encuesta</th>
                        <th class="span1">Acci&oacute;n</th>
                        </thead>
                        <tbody>
                            <c:forEach items="${listaE}" var="row" varStatus="iter">
                                <tr>
                                    <td>   
                                        <c:out value="${row.nombre}"/>
                                    </td>
                                    <td>
                                        <a href="Encuestas?accion=ordenarP&encuesta=${row.idencuesta}" title="Editar">Ordenar preguntas</a>
                                        <a href="Encuestas?accion=Condicionar&encuesta=${row.idencuesta}" title="Editar">Condicionar preguntas</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:when>
                <c:otherwise>
                    No existen Encuestas registradas en el sistema.
                </c:otherwise>
            </c:choose>

        </div>
    </div>
</div>