
<%@ page import="bitacora.Documento" %>

<g:if test="${!documentoInstance}">
    <elm:notFound elem="Documento" genero="o" />
</g:if>
<g:else>
    <div class="modal-contenido">

        <g:if test="${documentoInstance?.descripcion}">
            <div class="row">
                <div class="col-md-3 show-label">
                    Descripcion
                </div>
                
                <div class="col-md-4 text-info">
                    <g:fieldValue bean="${documentoInstance}" field="descripcion"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${documentoInstance?.clave}">
            <div class="row">
                <div class="col-md-3 show-label">
                    Clave
                </div>
                
                <div class="col-md-4 text-info">
                    <g:fieldValue bean="${documentoInstance}" field="clave"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${documentoInstance?.resumen}">
            <div class="row">
                <div class="col-md-3 show-label">
                    Resumen
                </div>
                
                <div class="col-md-4 text-info">
                    <g:fieldValue bean="${documentoInstance}" field="resumen"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${documentoInstance?.ruta}">
            <div class="row">
                <div class="col-md-3 show-label">
                    Documento
                </div>
                
                <div class="col-md-4 text-info">
                    <g:fieldValue bean="${documentoInstance}" field="ruta"/>
                </div>
                
            </div>
        </g:if>
    
        <g:if test="${documentoInstance?.departamento}">
            <div class="row">
                <div class="col-md-3 show-label">
                    Área de gestión
                </div>
                
                <div class="col-md-4 text-info">
                    ${documentoInstance?.departamento?.encodeAsHTML()}
                </div>
                
            </div>
        </g:if>
    
    </div>
</g:else>