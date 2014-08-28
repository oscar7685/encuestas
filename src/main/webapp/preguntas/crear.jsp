<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Bootstrap core CSS -->
        <link href="<%=request.getContextPath()%>/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Documentation extras -->
        <link href="<%=request.getContextPath()%>/assets/css/docs.min.css" rel="stylesheet">
        <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

        <!-- Favicons -->
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
        <link rel="shortcut icon" href="assets/ico/favicon.ico">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="<%=request.getContextPath()%>/dist/js/bootstrap.min.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/jquery.validate.js"></script>
        <script src="<%=request.getContextPath()%>/assets/js/main.js"></script>
        <script type="text/javascript">
            $(function() {
                $("#formCrearPregunta").validate({
                    submitHandler: function() {
                        $.ajax({
                            type: 'POST',
                            url: "/encuestas/Encuestas?accion=crearPregunta2",
                            data: $("#formCrearPregunta").serialize(),
                            success: function() {
                                location = "preguntas/listar.jsp";
                            } //fin success
                        }); //fin $.ajax
                    }
                });
            });
        </script>
    </head>
    <body>
        <div class="bs-docs-featurette">
            <div class="container">
                <form id="formCrearPregunta" class="form-horizontal" method="post">
                    <fieldset>
                        <legend>Crear Pregunta</legend>
                        <div class="form-group">
                            <label for="encuesta" class="col-sm-1 control-label">Encuestas</label>
                            <div class="col-sm-11">
                                <select id="encuesta" name="idencuesta" class="form-control {required:true}">
                                    <option></option>
                                    <c:forEach items="${listaE}" var="row" varStatus="iter">
                                        <option value="${row.idencuesta}">${row.nombre}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="pregunta" class="col-sm-1 control-label">Pregunta</label>
                            <div class="col-sm-11">
                                <textarea name="pregunta" id="pregunta" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="tipo" class="col-sm-1 control-label">Tipo de la Pregunta</label>
                            <div class="col-sm-11">
                                <select name="tipo" id="tipo" class="form-control">
                                    <option></option>
                                    <option value="0">Pregunta seleccion multiple unica respuesta</option>
                                    <option value="1" >Pregunta seleccion multiple multiple respuesta CON ordenamiento</option>
                                    <optgroup label="Pregunta Abierta">
                                        <option value="2" >Respuesta corta</option>    
                                        <option value="3" >Respuesta Normal</option>    
                                        <option value="4" >Respuesta Larga</option>    
                                    </optgroup>
                                    <option value="5" >Comentario</option>
                                    <option value="6" >Pregunta seleccion multiple multiple respuesta SIN ordenamiento</option>
                                    <option value="7" >Pregunta SOLO ordenamiento</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="respuestas" class="col-sm-1 control-label">Respuestas</label>
                            <div class="col-sm-11">
                                <textarea name="respuestas" id="respuestas" class="form-control" rows="3"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">
                                <input type="checkbox" name="otro" id="otro"> Opcion otro 
                            </label>
                        </div>
                        <div class="form-group">
                            <label for="textoOtro" class="col-sm-1 control-label">Texto para otro</label>
                            <div class="col-sm-11">
                                <input name="textoOtro" id="textoOtro" type="text" class="form-control" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="padre" class="col-sm-1 control-label">Pregunta padre</label>
                            <div class="col-sm-11">
                                <select id="padre" name="padre" class="form-control">
                                    <option></option>
                                    <c:forEach items="${listaP}" var="row" varStatus="iter">
                                        <option value="${row.idpregunta}">${row.pregunta}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button class="btn btn-primary" type="submit">Crear Pregunta</button>
                            <button class="btn" type="reset">Cancelar</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>
