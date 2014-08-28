<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    ol.example li{
        background-color: #E6E6E6;
        margin-bottom: 1px;
        margin-left: 3px;
        margin-right: 20px;
        margin-top: 0;
        padding-bottom: 0;
        padding-left: 1.5em;
        padding-right: 0.4em;
        padding-top: 0;
        cursor: move; 
    }
    ol.example li.placeholder {
        position: relative;
        /** More li styles **/
    }
    ol.example li.placeholder:before {
        position: absolute;
        /** Define arrowhead **/
    }

</style>
<div class="hero-unit">
    <div class="row">
        <div id="conte" class="span10">
            <form method="post" action="">
                <h3 style="margin: 0;">Ordenar preguntas</h3>
                <c:choose>
                    <c:when test="${fn:length(preguntas)!= 0}">
                        <ol class='example'>
                            <c:forEach items="${preguntas}" var="row" varStatus="iter">
                                <li name="${row.idpregunta}" id="${row.idpregunta}">${row.pregunta}</li>
                                </c:forEach>
                        </ol>
                        <input id="guardarOrden" type="button" value="guardar orden de preguntas">

                    </c:when>
                    <c:otherwise>
                        No existen Encuestas registradas en el sistema.
                    </c:otherwise>
                </c:choose>
            </form>
        </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="dist/js/bootstrap.min.js"></script>
<script src='//code.jquery.com/ui/1.10.4/jquery-ui.js'></script>
<script type="text/javascript">
    var order1;
    $(function() {
        $("ol.example").sortable({
            update: function() {
               order1  = $(this).sortable('toArray').toString();
           }
        });
        $("#guardarOrden").click(function(){
            $.post('Encuestas?accion=ordenarPreguntas', {order:order1});
        });
    });

</script>
