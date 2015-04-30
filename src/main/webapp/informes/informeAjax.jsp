<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="layout-static">
                <div class="static-content-wrapper">
                    <div class="static-content">
                        <div class="page-content">
                            <div class="page-heading">            
                                <h1>Informe por Pregunta</h1>
                            </div>
                            <div class="container-fluid">
                                <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                                    <c:choose>
                                        <c:when test="${pregunta.getTipo() != '5'}">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="panel panel-default">
                                                        <div class="panel-heading">
                                                            <h2>${pregunta.pregunta}</h2>
                                                        </div>
                                                        <div class="panel-body">
                                                            <div id="div${pregunta.idpregunta}">
                                                                <c:choose>
                                                                    <c:when test="${pregunta.getTipo() == '3' || pregunta.getTipo() == '4' || pregunta.getTipo() == '2'}">
                                                                        <c:forEach items="${RespuestasPreguntasAbiertas.get(iter.index)}" var="respuestaxx" varStatus="respuestaStatus">
                                                                            ${respuestaxx} ,
                                                                        </c:forEach>
                                                                    </c:when>
                                                                </c:choose>
                                                            </div>
                                                            <div>
                                                                <c:choose>
                                                                    <c:when test="${pregunta.getTipo() == '1'}">
                                                                        <table class="table">
                                                                            <th>Respuesta/Orden</th>
                                                                                <c:set var="aux5" value="0"></c:set>
                                                                                <c:set var="auxheader" value="0"></c:set>
                                                                                <c:forEach items="${pregunta.respuestaList}" var="resf" varStatus="resStat">
                                                                                <th>${resStat.index + 1}</th>    
                                                                                    <c:set var="auxheader" value="${resStat.index}"></c:set>
                                                                                </c:forEach>
                                                                                <c:choose>
                                                                                    <c:when test="${pregunta.otro == 'true'}">
                                                                                    <th>${auxheader + 2}</th>        
                                                                                    </c:when>
                                                                                </c:choose>
                                                                                <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                                <tr>
                                                                                    <td>${respuesta.respuesta}</td>

                                                                                    <c:set var="aux" value="0"></c:set>
                                                                                    <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                                                                                        <td> ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}</td>

                                                                                        <c:set var="aux" value="${otraStatus.index}"></c:set>
                                                                                    </c:forEach>    
                                                                                    <c:choose>
                                                                                        <c:when test="${pregunta.otro == 'true'}">
                                                                                            <td>  ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(aux+1)} </td>
                                                                                        </c:when>
                                                                                    </c:choose>   
                                                                                </tr>           
                                                                                <c:set var="aux5" value="${iter2.index}"></c:set>
                                                                            </c:forEach>
                                                                            <c:choose>
                                                                                <c:when test="${pregunta.otro == 'true'}">
                                                                                    <tr>
                                                                                        <td>${pregunta.labelOtro}</td>
                                                                                        <c:set var="aux7" value="0"></c:set>
                                                                                        <c:forEach items="${pregunta.respuestaList}" var="otra2" varStatus="otraStatus2">
                                                                                            <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(otraStatus2.index)}</td>
                                                                                            <c:set var="aux7" value="${otraStatus2.index}"></c:set>
                                                                                        </c:forEach>
                                                                                        <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(aux5+1).get(aux7+1)}</td>
                                                                                    </tr>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </table>
                                                                    </c:when>
                                                                    <c:when test="${pregunta.getTipo() == '7'}">
                                                                        <table class="table">
                                                                            <thead>
                                                                            <th>Respuesta/Orden</th>

                                                                            <c:forEach items="${pregunta.respuestaList}" var="resf2" varStatus="resStat2">
                                                                                <th>${resStat2.index + 1}</th>    
                                                                                </c:forEach>
                                                                            </thead>
                                                                            <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>${respuesta.respuesta}</td>

                                                                                        <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                                                                                            <td>${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}</td>
                                                                                        </c:forEach>    
                                                                                    </tr>
                                                                                </tbody>        
                                                                            </c:forEach>
                                                                        </table>   

                                                                        <%--  total Respuestas: ${totalrespuestas.get(iter.index)} <br/>--%>
                                                                    </c:when> 
                                                                </c:choose>
                                                            </div>    
                                                        </div>
                                                    </div>
                                                </div>

                                            </div> 
                                        </c:when>
                                    </c:choose>


                                </c:forEach>



                            </div> <!-- .container-fluid -->
                        </div> <!-- #page-content -->
                    </div>
                    <footer role="contentinfo">
                        <div class="clearfix">
                            <ul class="list-unstyled list-inline pull-left">
                                <li><h6 style="margin: 0;"> &copy; 2014 Avalon</h6></li>
                            </ul>
                            <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
                        </div>
                    </footer>
                </div>
            </div>
            
        

        <!--<script src="assets/js/jquery-1.10.2.min.js"></script> 							<!-- Load jQuery -->
        <!--<script src="assets/js/jqueryui-1.9.2.min.js"></script> 							<!-- Load jQueryUI -->
        <script src="<%=request.getContextPath()%>/assets/js/bootstrap.min.js"></script> 				<!-- Load Bootstrap -->
        <!-- End loading page level scripts-->
       <!-- <script src="<%=request.getContextPath()%>/assets/plugins/sparklines/jquery.sparklines.min.js"></script>  	<!-- Sparkline -->
        <script src="<%=request.getContextPath()%>/assets/js/application2.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/raphael.min.js"></script> <!-- Load Raphael as Dependency -->
        <script src="<%=request.getContextPath()%>/assets/js/morris.min.js"></script>  <!-- Load Morris.js -->


        <script type="text/javascript">
            var datosTF1vsTF2, datos9, datos1, datos6;
            $(function() {

            <c:forEach items="${preguntas}" var="pregunta" varStatus="iter">
                <c:choose>
                    <c:when test="${pregunta.getTipo() == '0'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datosTF1vsTF2 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datosTF1vsTF2,
                            hoverCallback: function(index, options, content) {
                                return(content);
                            },
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            //padding: 100,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>
                    <c:when test="${pregunta.getTipo() == '9'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos9 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos9,
                            xkey: 'y',
                            ykeys: ['a'],
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            //padding: 100,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>


                    <c:when test="${pregunta.getTipo() == '1'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos1 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos1,
                            xkey: 'y',
                            ykeys: ['a'],
                            //padding: 100,
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>

                    <c:when test="${pregunta.getTipo() == '6'}">
                $.ajax({
                    type: "POST",
                    url: 'Encuestas?accion=resultadosP&preguntaid=${iter.index}',
                    dataType: 'json',
                    success: function(dat)
                    {
                        datos6 = dat['0']["datos"];
                        Morris.Bar({
                            element: 'div${pregunta.idpregunta}',
                            data: datos6,
                            xkey: 'y',
                            ykeys: ['a'],
                            //padding: 100,
                            labels: ['Cantidad de respuestas contestadas'],
                            //xLabelAngle: 30,
                            lineColors: [Utility.getBrandColor('inverse'), Utility.getBrandColor('midnightblue')]
                        });
                    } //fin success
                }); //fin del $.ajax


                    </c:when>



                </c:choose>
            </c:forEach>
            });
        </script>
        
