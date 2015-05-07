<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cátedra Unesco para la Lectura y la Escritura</title>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,700' rel='stylesheet' type='text/css'>
        <style type="text/css">
            .morris-hover{position:absolute;z-index:1000;}
            .morris-hover.morris-default-style{border-radius:10px;padding:6px;color:#666;background:rgba(255, 255, 255, 0.8);border:solid 2px rgba(230, 230, 230, 0.8);font-family:sans-serif;font-size:12px;text-align:center;}
            .morris-hover.morris-default-style .morris-hover-row-label{font-weight:bold;margin:0.25em 0;}
            .morris-hover.morris-default-style .morris-hover-point{white-space:nowrap;margin:0.1em 0;} 
            #loader-img{
                margin: 0 auto;
                display: block;
            }
        </style>
        <link href="assets/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">        <!-- Font Awesome -->
        <link href="assets/css/styles.css" type="text/css" rel="stylesheet">                                     <!-- Core CSS with all styles -->
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script> 
    </head>
    <body>
        <header id="topnav" class="navbar navbar-default navbar-fixed-top clearfix" role="banner">
            <div class="yamm navbar-left navbar-collapse collapse in">
                <ul class="nav navbar-nav">
                    <li><a href="<%=request.getContextPath()%>/"><strong>Inicio</strong></a></li>

                    <c:choose>
                        <c:when test="${fuente == '2'}">
                            <li>
                                <select class="form-control" style="margin-top: 10px" id="facultad">
                                    <option value="NA">Seleccione una facultad...</option>
                                    <c:forEach items="${facultades}" var="facultad" varStatus="fac">
                                        <option value="${facultad.idfacultad}">${facultad.facultad}</option>
                                    </c:forEach>    

                                </select>
                            </li>
                            <li>
                                <select class="form-control" style="margin-top: 10px" id="programa">
                                    <option value="NA">Seleccione un programa...</option>
                                </select>
                            </li>
                            <li>
                                <select id="semestre" class="form-control" name="semestre" style="margin-top: 10px">
                                    <option value="NA">Seleccione un semestre...</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
            </div>
        </header>
        <div id="wrapper">
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
                                                            <c:choose>
                                                                <c:when test="${pregunta.getTipo() == '0'}">
                                                                    <c:set var="actual" value="2000"></c:set>
                                                                    <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                        ${respuesta.respuesta} : ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} <br/>
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
                                                                        ${respuesta.respuesta} : ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} 
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
                                                                            ${pregunta.labelOtro} : ${cantidadXrespuestaXPregunta.get(iter.index).get(aux5+1)} 
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
                                                                        ${respuesta.respuesta} : ${cantidadXrespuestaXPregunta.get(iter.index).get(iter2.index)} <br/>
                                                                    </c:forEach>
                                                                </c:when>           
                                                                <c:when test="${pregunta.getTipo() == '6'}">
                                                                    <c:forEach items="${pregunta.respuestaList}" var="respuesta6" varStatus="iter6">
                                                                        ${respuesta6.respuesta} : ${cantidadXrespuestaXPregunta6.get(iter.index).get(iter6.index)} <br/>
                                                                    </c:forEach>
                                                                    total Respuestas: ${totalrespuestas.get(iter.index)} <br/>
                                                                </c:when>
                                                                <c:when test="${pregunta.getTipo() == '7'}">
                                                                    <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="iter2">
                                                                        ${respuesta.respuesta}  
                                                                        <c:forEach items="${pregunta.respuestaList}" var="otra" varStatus="otraStatus">
                                                                            ${otraStatus.index+1}: ${cantidadXOrdenXrespuestaXPregunta.get(iter.index).get(iter2.index).get(otraStatus.index)}
                                                                        </c:forEach>    
                                                                        <br/>
                                                                    </c:forEach>
                                                                    <br/>    
                                                                    <%--  total Respuestas: ${totalrespuestas.get(iter.index)} <br/>--%>
                                                                </c:when>  
                                                            </c:choose> 
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<script type="text/javascript">
    $(function() {
        $("#facultad").change(function() {
            $.ajax({
                type: 'POST',
                url: "Encuestas?accion=selectorProgramas",
                data: "facultad=" + $('#facultad :selected').val(),
                dataType: "json",
                success: function(datos) {
                    $("#programa").empty();
                    $("#programa").append("<option value='NA'>Seleccione un programa...</option>");
                    $.each(datos.programas, function(posicion, programa) {
                        $("#programa").append("<option value='" +
                                programa.id + "'>" + programa.programa + "</option>");
                    });

                    $("#wrapper").empty();
                    $('#wrapper').html('<img id="loader-img" alt="" src="assets/img/loader-larger.gif" width="100" height="100" align="center" />');
                    $.ajax({
                        type: 'POST',
                        url: "Encuestas?accion=informeXpregunta",
                        data: "facultad=" + $('#facultad :selected').val() + "&programa=" + $('#programa :selected').val() + "&semestre=" + $('#semestre :selected').val() + "&para=2&para2=ajax&para3=para3",
                        success: function(datos) {
                            $("#wrapper").html(datos);
                        }, //fin success
                        error: function(datos) {
                            $("#wrapper").empty();
                            $("#wrapper").append(datos);
                        }

                    }); //fin $.ajax

                }, //fin success
                error: function(datos) {
                    $("#programa").empty();
                    $("#programa").append("<option value='NA'>Seleccione un programa...</option>");
                }

            }); //fin $.ajax
        });

        $("#programa").change(function() {
            $("#wrapper").empty();
            $('#wrapper').html('<img id="loader-img" alt="" src="assets/img/loader-larger.gif" width="100" height="100" align="center" />');
            $.ajax({
                type: 'POST',
                url: "Encuestas?accion=informeXpregunta",
                data: "facultad=" + $('#facultad :selected').val() + "&programa=" + $('#programa :selected').val() + "&semestre=" + $('#semestre :selected').val() + "&para=2&para2=ajax&para3=para3",
                success: function(datos) {
                    $("#wrapper").html(datos);
                }, //fin success
                error: function(datos) {
                    $("#wrapper").empty();
                    $("#wrapper").append(datos);
                }

            }); //fin $.ajax

        }); //fin changeprograma

    });
</script>