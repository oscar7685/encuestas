<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <title>

            Cátedra Unesco para la Lectura y la Escritura

        </title>

        <!-- Bootstrap core CSS -->
        <link href="dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Documentation extras -->
        <link href="assets/css/docs.min.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->    

        <!-- Favicons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <style type="text/css">
            @media all {
                #insp{
                    line-height: 22px;
                }
            }
            body{
                font-size:14px;
                line-height: 18px;
            }
            body.dragging, body.dragging * {
                cursor: move !important;
            }

            .dragged {
                position: absolute;
                opacity: 0.5;
                z-index: 2000;
            }


        </style>
    </head>
    <!--<body style="background-image: url(assets/img/blue.jpg);background-repeat: repeat">-->
    <body>
        <div class="container bs-docs-container" style="padding:30px 100px;">
            <form class="form-horizontal" id="form_encuesta" method="post">
                <h1 style="font-size: 30px;font-weight: bold;margin-bottom: 5px;">${encuesta.getNombre()}</h1>
                <hr style="margin-top: 0px;"/>
                <div class="alert alert-info">
                    ${encuesta.getObjetivo()}
                </div>
                <br/>


                <div class="form-group">
                    <label for="facultad" class="col-sm-1 control-label">Facultad</label>
                    <div class="col-sm-4">
                        <select id="facultad" class="form-control input-sm required" name="facultad">
                            <option value=""></option>
                            <c:forEach items="${listaF}" var="row" varStatus="iter">
                                <option value="${row.idfacultad}">${row.facultad}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <label for="programa" class="col-sm-2 control-label">Programa</label>
                    <div class="col-sm-5">
                        <select id="programa" class="form-control input-sm required" name="programa">
                            <option value=""></option>
                        </select>
                    </div>
                </div>
                <c:choose>
                    <c:when test="${encuesta.idencuesta==1}">
                        <div class="form-group">
                            <label for="nombre" class="col-sm-1 control-label">Docente</label>
                            <div class="col-sm-11">
                                <input type="text" class="form-control input-sm  required" id="nombre" placeholder="Nombre" name="nombre">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="vinculacion" class="col-sm-1 control-label">Vinculaci&oacute;n</label>
                            <div class="col-sm-4">
                                <select id="vinculacion" class="form-control input-sm required" name="vinculacion">
                                    <option value=""></option>
                                    <option value="Tiempo completo">Tiempo completo</option>
                                    <option value="Medio tiempo">Medio tiempo</option>
                                    <option value="Catedra">C&aacute;tedra</option>
                                </select>
                            </div>
                            <label for="tiempo" class="col-sm-2 control-label">Tiempo de vinculaci&oacute;n</label>
                            <div class="col-sm-5">
                                <select id="tiempo" class="form-control input-sm required" name="tiempo">
                                    <option value=""></option>
                                    <option value="menos1">Menos de un a&nacute;o</option>
                                    <option value="entre1y2">Entre 1 y 2 a&nacute;os</option>
                                    <option value="entre2y5">Entre 2 y 5 a&nacute;os</option>
                                    <option value="entre5y10">Entre 5 y 10 a&nacute;os</option>
                                    <option value="entre10y15">Entre 10 y 15 a&nacute;os</option>
                                    <option value="mas15">M&aacute;s de 15 a&nacute;os</option>
                                </select>
                            </div>
                        </div>
                    </c:when>
                    <c:when test="${encuesta.idencuesta==2}">
                        <div class="form-group">
                            <label for="nombre" class="col-sm-1 control-label">Estudiante</label>
                            <div class="col-sm-11">
                                <input type="text" name="nombre" class="form-control input-sm required" id="nombre"  placeholder="Nombre"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="semestre" class="col-sm-1 control-label">Semestre</label>
                            <div class="col-sm-4">
                                <select id="semestre" class="form-control input-sm required" name="semestre">
                                    <option value=""></option>
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
                            </div>
                            <label for="codigo" class="col-sm-2 control-label">Código estudiantil</label>
                            <div class="col-sm-5">
                                <input type="text" name="codigo" class="form-control input-sm required" id="codigo"  placeholder="Codigo estudiantil"/>
                            </div>
                        </div>
                    </c:when>
                </c:choose>
                <div class="form-group">
                    <label>&nbsp;</label>
                </div>

                <c:forEach items="${preguntas}" var="pregunta" varStatus="status">
                    <c:choose>
                        <%--Pregunta seleccion multiple multiple respuesta SIN ordenamiento--%>
                        <c:when test="${pregunta.getTipo() == '6'}">
                            <c:choose>
                                <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                    <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                    </c:when>
                                    <c:otherwise>
                                        <div class="row" id="pregunta${pregunta.idpregunta}">
                                        </c:otherwise>        
                                    </c:choose>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>${pregunta.pregunta}</label>
                                            <c:forEach items="${pregunta.respuestaList}" var="respuesta">
                                                <div class="checkbox">
                                                    <label>
                                                        ${respuesta.respuesta}
                                                        <select name="respuesta${respuesta.idrespuesta}" class="required">
                                                            <option></option>
                                                            <option value="Si">Si</option>
                                                            <option value="No">No</option>
                                                        </select> 
                                                    </label>
                                                </div>
                                            </c:forEach>
                                            <c:choose>
                                                <c:when test="${pregunta.otro=='true'}">
                                                    <div class="checkbox">
                                                        <label>
                                                            ${pregunta.labelOtro}
                                                        </label>
                                                        <input type="text" name="preguntaOtro${pregunta.idpregunta}" class="required" disabled="disabled"/>
                                                    </div>
                                                </c:when>
                                            </c:choose>
                                        </div>
                                    </div>
                                </div>     
                            </c:when>
                            <%--Pregunta seleccion multiple unica respuesta--%>            
                            <c:when test="${pregunta.getTipo() == '0'}">
                                <c:choose>
                                    <c:when test="${fn:length(pregunta.condicionList1)>0 && pregunta.condicionList1[0].tipo=='MostrarSI'}">
                                        <div class="row hide" id="pregunta${pregunta.idpregunta}" > 
                                        </c:when>
                                        <c:otherwise>
                                            <div class="row" id="pregunta${pregunta.idpregunta}">
                                            </c:otherwise>        
                                        </c:choose>
                                        <c:choose>
                                            <c:when test="${fn:length(pregunta.condicionList)>0 && pregunta.condicionList[0].tipo=='MostrarSI'}">
                                                <div class="col-md-12 condicionador">
                                                </c:when>
                                                <c:when test="${fn:length(pregunta.condicionList)>0 && pregunta.condicionList[0].tipo=='OcultarSI'}">
                                                    <div class="col-md-12 condicionador3">
                                                    </c:when>    
                                                    <c:otherwise>
                                                        <div class="col-md-12">
                                                        </c:otherwise>        
                                                    </c:choose>

                                                    <div class="form-group">
                                                        <label>${pregunta.pregunta}</label>
                                                        <c:forEach items="${pregunta.respuestaList}" var="respuesta">
                                                            <div class="radio">
                                                                <c:choose>
                                                                    <c:when test="${fn:length(respuesta.condicionList)>0}">
                                                                        <label>
                                                                            <input type="radio" value="respuesta${respuesta.idrespuesta}" id="respuesta${respuesta.idrespuesta}" name="pregunta${pregunta.idpregunta}" class="datacondicion required"
                                                                                   datacondicion="<c:forEach items='${respuesta.condicionList}' var='condicion' varStatus='status'>
                                                                                       <c:choose>
                                                                                           <c:when test='${status.index+1 == fn:length(respuesta.condicionList)}'>
                                                                                               pregunta${condicion.preguntaCondicionada.idpregunta}
                                                                                           </c:when>
                                                                                           <c:otherwise>
                                                                                               pregunta${condicion.preguntaCondicionada.idpregunta},

                                                                                           </c:otherwise>    
                                                                                       </c:choose>
                                                                                   </c:forEach>">
                                                                            ${respuesta.respuesta}
                                                                        </label>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <label>
                                                                            <input type="radio" value="${respuesta.idrespuesta}" id="respuesta${respuesta.idrespuesta}" name="pregunta${pregunta.idpregunta}" class="required">
                                                                            ${respuesta.respuesta}
                                                                        </label>
                                                                    </c:otherwise>        
                                                                </c:choose>

                                                            </div>
                                                        </c:forEach>
                                                        <c:choose>
                                                            <c:when test="${pregunta.otro=='true'}">
                                                                <div class="radio">
                                                                    <label class="otroRadio">
                                                                        <input type="radio"  value="otro" id="otro${pregunta.idpregunta}" name="pregunta${pregunta.idpregunta}">
                                                                        ${pregunta.labelOtro}
                                                                    </label>
                                                                    <input type="text" name="preguntaOtro${pregunta.idpregunta}" class="required" disabled="disabled"/>
                                                                </div>

                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </div> 
                                            </div>
                                        </c:when>

                                        <%--Pregunta SOLO ordenamiento--%>
                                        <c:when test="${pregunta.getTipo() == '7'}">
                                            <c:choose>
                                                <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                                    <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="row" id="pregunta${pregunta.idpregunta}">
                                                        </c:otherwise>        
                                                    </c:choose>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label>${pregunta.pregunta}</label>
                                                            <c:forEach items="${pregunta.respuestaList}" var="respuesta">
                                                                <div class="checkbox" style="padding-left: 0px;">
                                                                    <label>
                                                                        ${respuesta.respuesta}
                                                                    </label>
                                                                    <select name="ordenamiR${respuesta.idrespuesta}" id="ordenamiR${respuesta.idrespuesta}" class="required">
                                                                        <option value=""></option>
                                                                        <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="status">
                                                                            <option value="${status.index + 1}">${status.index + 1}</option>
                                                                        </c:forEach>  
                                                                    </select>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div> 
                                                </div>
                                            </c:when>

                                            <%--Pregunta seleccion multiple multiple respuesta CON ordenamiento--%>            
                                            <c:when test="${pregunta.getTipo() == '1'}">
                                                <c:choose>
                                                    <c:when test="${fn:length(pregunta.condicionList1)>0 && pregunta.condicionList1[0].tipo=='MostrarSI'}">
                                                        <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="row" id="pregunta${pregunta.idpregunta}">
                                                            </c:otherwise>        
                                                        </c:choose>
                                                        <div class="col-md-12">
                                                            <div class="form-group">
                                                                <label>${pregunta.pregunta}</label>
                                                                <c:forEach items="${pregunta.respuestaList}" var="respuesta">
                                                                    <div class="checkbox">
                                                                        <label>
                                                                            <c:choose>
                                                                                <c:when test="${fn:length(respuesta.condicionList)>0 && respuesta.condicionList[0].tipo=='OcultarSI'}">
                                                                                    <input type="checkbox"  value="${respuesta.idrespuesta}" id="${respuesta.idrespuesta}" name="pregunta${pregunta.idpregunta}[]" class="tipo1 required condicionador2" datacondicion2="pregunta${respuesta.condicionList[0].preguntaCondicionada.idpregunta}">
                                                                                </c:when>
                                                                                <c:otherwise>
                                                                                    <input type="checkbox"  value="${respuesta.idrespuesta}" id="respuesta${respuesta.idrespuesta}" name="pregunta${pregunta.idpregunta}[]" class="tipo1 required">
                                                                                </c:otherwise>    
                                                                            </c:choose> 

                                                                            ${respuesta.respuesta}
                                                                        </label>
                                                                        <select name="ordenR${respuesta.idrespuesta}" id="ordenR${respuesta.idrespuesta}" disabled="disabled" class="required">
                                                                            <option value=""></option>
                                                                            <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="status">
                                                                                <option value="${status.index + 1}">${status.index + 1}</option>
                                                                            </c:forEach>  
                                                                            <c:choose>
                                                                                <c:when test="${pregunta.otro=='true'}">
                                                                                    <option value="${fn:length(pregunta.respuestaList)+1}">${fn:length(pregunta.respuestaList)+1}</option>
                                                                                </c:when>
                                                                            </c:choose>
                                                                        </select>
                                                                    </div>
                                                                </c:forEach>
                                                                <c:choose>
                                                                    <c:when test="${pregunta.otro=='true'}">

                                                                        <div class="checkbox">
                                                                            <label>
                                                                                <input type="checkbox" value="otro"  name="pregunta${pregunta.idpregunta}[]" class="tipo1 required">
                                                                                ${pregunta.labelOtro}
                                                                            </label>
                                                                            <input type="text" tabindex="-1" name="preguntaOtro${pregunta.idpregunta}" class="required" disabled="disabled"/>
                                                                            <select name="ordenRP${pregunta.idpregunta}" id="ordenRP${pregunta.idpregunta}" disabled="disabled" class="required">
                                                                                <option></option>
                                                                                <c:forEach items="${pregunta.respuestaList}" var="respuesta" varStatus="status">
                                                                                    <option value="${status.index + 1}">${status.index + 1}</option>
                                                                                </c:forEach>
                                                                                <option value="${fn:length(pregunta.respuestaList)+1}">${fn:length(pregunta.respuestaList)+1}</option>
                                                                            </select>   
                                                                        </div>

                                                                    </c:when>
                                                                </c:choose>

                                                            </div>
                                                        </div> 
                                                    </div>
                                                </c:when>

                                                <%--Pregunta Abierta--%>
                                                <c:when test="${pregunta.getTipo() == '2'}">
                                                    <c:choose>
                                                        <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                                            <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                            </c:when>
                                                            <c:otherwise>
                                                                <div class="row" id="pregunta${pregunta.idpregunta}">
                                                                </c:otherwise>        
                                                            </c:choose>
                                                            <div class="col-md-12">
                                                                <div class="form-group">
                                                                    <label>${pregunta.pregunta}</label>
                                                                    <input type="text" class="form-control required" style="width: 90% !important;" name="respuesta${pregunta.idpregunta}">
                                                                </div>
                                                            </div>   
                                                        </div>
                                                    </c:when>
                                                    <%--Pregunta Abierta--%>            
                                                    <c:when test="${pregunta.getTipo() == '3'}">
                                                        <c:choose>
                                                            <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                                                <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <div class="row" id="pregunta${pregunta.idpregunta}">
                                                                    </c:otherwise>        
                                                                </c:choose>
                                                                <div class="col-md-12">
                                                                    <div class="form-group">
                                                                        <label>${pregunta.pregunta}</label>
                                                                        <input type="text" class="form-control required" style="width: 90% !important;" name="respuesta${pregunta.idpregunta}">
                                                                    </div>
                                                                </div>   
                                                            </div>
                                                        </c:when>
                                                        <%--Comentario--%>
                                                        <c:when test="${pregunta.getTipo() == '5'}">
                                                            <c:choose>
                                                                <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                                                    <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="row" id="pregunta${pregunta.idpregunta}">
                                                                        </c:otherwise>        
                                                                    </c:choose>
                                                                    <div class="col-md-12 alert alert-info">
                                                                        ${pregunta.pregunta}
                                                                    </div>  
                                                                </div>       
                                                            </c:when>


                                                            <%--Pregunta Abierta--%>
                                                            <c:when test="${pregunta.getTipo() == '4'}">
                                                                <c:choose>
                                                                    <c:when test="${fn:length(pregunta.condicionList1)>0}">
                                                                        <div class="row hide" id="pregunta${pregunta.idpregunta}"> 
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <div class="row" id="pregunta${pregunta.idpregunta}">
                                                                            </c:otherwise>        
                                                                        </c:choose>    
                                                                        <div class="col-md-12">
                                                                            <div class="form-group">
                                                                                <label>${pregunta.pregunta}</label>
                                                                                <textarea class="form-control required" style="width: 90% !important;" rows="4" name="respuesta${pregunta.idpregunta}"></textarea>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </c:when>  

                                                                <c:when test="${pregunta.getTipo() == '9'}">
                                                                    <c:choose>
                                                                        <c:when test="${fn:length(pregunta.condicionList1)>0 && pregunta.condicionList1[0].tipo=='MostrarSI'}">
                                                                            <div class="row hide" id="pregunta${pregunta.idpregunta}" > 
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <div class="row" id="pregunta${pregunta.idpregunta}">
                                                                                </c:otherwise>        
                                                                            </c:choose>
                                                                            <c:choose>
                                                                                <c:when test="${fn:length(pregunta.condicionList)>0 && pregunta.condicionList[0].tipo=='MostrarSI'}">
                                                                                    <div class="col-md-12 condicionador">
                                                                                    </c:when>
                                                                                    <c:when test="${fn:length(pregunta.condicionList)>0 && pregunta.condicionList[0].tipo=='OcultarSI'}">
                                                                                        <div class="col-md-12 condicionador3">
                                                                                        </c:when>    
                                                                                        <c:otherwise>
                                                                                            <div class="col-md-12">
                                                                                            </c:otherwise>        
                                                                                        </c:choose>

                                                                                        <div class="form-group">
                                                                                            <label>${pregunta.pregunta}</label>
                                                                                            <select name="pregunta${pregunta.idpregunta}" class="required">
                                                                                                <option value=""></option>    
                                                                                                <c:forEach items="${pregunta.respuestaList}" var="respuesta">
                                                                                                    <c:choose>
                                                                                                        <c:when test="${fn:length(respuesta.condicionList)>0}">
                                                                                                            <option value="${respuesta.idrespuesta}">${respuesta.respuesta}</option>    
                                                                                                        </c:when>
                                                                                                        <c:otherwise>
                                                                                                            <option value="${respuesta.idrespuesta}">${respuesta.respuesta}</option>    
                                                                                                        </c:otherwise>        
                                                                                                    </c:choose>
                                                                                                </c:forEach>
                                                                                            </select>
                                                                                            <c:choose>
                                                                                                <c:when test="${pregunta.otro=='true'}">
                                                                                                    <div class="radio">
                                                                                                        <label class="otroRadio">
                                                                                                            <input type="radio"  value="otro" id="otro${pregunta.idpregunta}" name="pregunta${pregunta.idpregunta}">
                                                                                                            ${pregunta.labelOtro}
                                                                                                        </label>
                                                                                                        <input type="text" name="preguntaOtro${pregunta.idpregunta}" class="required" disabled="disabled"/>
                                                                                                    </div>

                                                                                                </c:when>
                                                                                            </c:choose>
                                                                                        </div>
                                                                                    </div> 
                                                                                </div>
                                                                            </c:when>            


                                                                        </c:choose>
                                                                    </c:forEach>   

                                                                    <div class="row">   
                                                                        <button id="botonEnviar" class="btn btn-primary" data-content="Env&iacute;a la encuesta evaluada. Verifique que todas las preguntas han sido respondidas correctamente. Esta operación no se podrá deshacer."  value="1" data-original-title="Enviar encuesta" type="button">Enviar</button>
                                                                    </div>

                                                                    </form> 

                                                                </div>
                                                                <!-- Placed at the end of the document so the pages load faster -->
                                                                <!--<script type="text/javascript" src="http://code.jquery.com/jquery.min.js">-->
                                                                <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

                                                                <script src="dist/js/bootstrap.min.js"></script>
                                                                <!--<script src='//code.jquery.com/ui/1.10.4/jquery-ui.js'></script>-->
                                                                <!--<script src="http://jqueryvalidation.org/files/dist/jquery.validate.js"></script>-->
                                                                <!--<script src="<%=request.getContextPath()%>/assets/js/jquery.metadata.js"></script>-->
                                                                <script type = "text/javascript" src = "<%=request.getContextPath()%>/assets/js/jquery.validate.js"></script>
                                                                <script src="dist/js/responder.js"></script>
                                                                </body>
                                                                </html>

                                                                <div class="modal fade" id="myModalGracias" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title" id="myModalLabel">Gracias</h4>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                La encuesta se ha enviado correctamente.
                                                                                Muchas gracias por participar del proceso.
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>


