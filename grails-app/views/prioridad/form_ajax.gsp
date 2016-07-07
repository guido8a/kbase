<%@ page import="bitacora.Prioridad" %>

<script type="text/javascript" src="${resource(dir: 'js', file: 'ui.js')}"></script>
<g:if test="${!prioridadInstance}">
    <elm:notFound elem="Prioridad" genero="o" />
</g:if>
<g:else>
    <g:form class="form-horizontal" name="frmPrioridad" role="form" action="save" method="POST">
        <g:hiddenField name="id" value="${prioridadInstance?.id}" />
        
        <div class="form-group ${hasErrors(bean: prioridadInstance, field: 'descripcion', 'error')} ">
            <span class="grupo">
                <label for="codigo" class="col-md-2 control-label text-info">
                    Código
                </label>
                <div class="col-md-2">
                    <g:textField name="codigo" class="form-control allCaps" value="${prioridadInstance?.codigo}"/>
                </div>
                
            </span>
            <span class="grupo">
                <label for="descripcion" class="col-md-2 control-label text-info">
                    Descripcion
                </label>
                <div class="col-md-6">
                    <g:select name="descripcion" from="${prioridadInstance.constraints.descripcion.inList}" class="form-control" value="${prioridadInstance?.descripcion}" valueMessagePrefix="prioridad.descripcion" noSelection="['': '']"/>
                </div>

            </span>
        </div>
        
    </g:form>

    <script type="text/javascript">
        var validator = $("#frmPrioridad").validate({
            errorClass     : "help-block",
            errorPlacement : function (error, element) {
                if (element.parent().hasClass("input-group")) {
                    error.insertAfter(element.parent());
                } else {
                    error.insertAfter(element);
                }
                element.parents(".grupo").addClass('has-error');
            },
            success        : function (label) {
                label.parents(".grupo").removeClass('has-error');
            }
        });
        $(".form-control").keydown(function (ev) {
            if (ev.keyCode == 13) {
                submitForm();
                return false;
            }
            return true;
        });
    </script>

</g:else>