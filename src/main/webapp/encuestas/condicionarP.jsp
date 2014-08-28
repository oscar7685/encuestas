<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <style type="text/css">
       table{
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size:10px !important;
        }




    </style>
    <body>
        <div class="hero-unit">
            <div class="row" style="margin-left: 0px;">
                <div id="conte" class="span10">
                    <form method="post" action="">
                        <h3 style="margin: 0;">Condicionar preguntas</h3>
                        <c:choose>
                            <c:when test="${fn:length(preguntas)!= 0}">
                                <table class="table table-striped">
                                    <thead>
                                    <th style="width: 60%;">Pregunta</th>
                                    <th>Condicion</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${preguntas}" var="row" varStatus="iter">
                                            <tr> 
                                                <td>${row.pregunta}</td>
                                                <td><a href="#agregarC">Agregar condicion</a></td>
                                            </tr>    
                                        </c:forEach>
                                    </tbody>
                                </table>    
                                <input id="guardarOrden" type="button" value="guardar condiciones de preguntas">

                            </c:when>
                            <c:otherwise>
                                No existen Preguntas registradas en el sistema.
                            </c:otherwise>
                        </c:choose>
                    </form>
                </div>
            </div>
        </div>
    </body>   
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
<script src='//code.jquery.com/ui/1.10.4/jquery-ui.js'></script>
<script type="text/javascript">
    $(function() {

        $("#guardarOrden").click(function() {
            $.post('Encuestas?accion=ordenarPreguntas', {order: order1});
        });
    });

</script>