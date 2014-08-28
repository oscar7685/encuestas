<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            $(function() {
                $("#formCrearEncuesta").validate({
                    submitHandler: function() {
                        $.ajax({
                            type: 'POST',
                            url: "controladorCC?action=crearEncuesta",
                            data: $("#formCrearEncuesta").serialize(),
                            success: function() {
                                location = "/sap/#listarEncuestas";
                            } //fin success
                        }); //fin $.ajax
                    }
                });
            });
        </script>
    </head>
    <body>
        <form method="post" class="form-horizontal" id="formCrearEncuesta">
            <fieldset>
                <legend>Crear Encuesta</legend>
                <div class="control-group">
                    <label class="control-label" for="nombre">Nombre</label>
                    <div class="controls">
                        <input type="text" value="" class="input-xlarge {required:true}" id="nombre" name="nombre">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="objetivo">Objetivo</label>
                    <div class="controls">
                        <textarea class="input-xxlarge {required:true}" id="objetivo" name="objetivo" rows="3"></textarea>
                    </div>
                </div>
                <div class="form-actions">
                    <button type="submit" class="btn btn-primary">Crear Encuesta</button>
                    <button type="reset" class="btn">Cancelar</button>
                </div>
            </fieldset>
        </form>
    </body>
</html>
