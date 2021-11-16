<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="dashboard_template" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>Annonces</title>
</head>

<body>
    <div class="container-fluid mt--6">
        <div class="row d-flex justify-content-center">
            <div class="card w-75">
                <div class="card-header">
                    <div class="row align-items-center">
                        <div class="col-8">
                            <h3 class="mb-0">Créer une annonce</h3>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form action="/annonce/save" method="POST">
                        <div class="pl-lg-4">
                            <g:if test="${flash.message}">
                            <div class="message" role="status">${flash.message}</div>
                            </g:if>
                            <g:hasErrors bean="${this.annonce}">
                            <div class="row">
                                <ul class="errors" role="alert">
                                    <g:eachError bean="${this.annonce}" var="error">
                                    <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"></g:if>><g:message error="${error}"/></li>
                                    </g:eachError>
                                </ul>
                            </div>
                            </g:hasErrors>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-address">Titre</label>
                                        <input id="input-address" class="form-control" placeholder="Titre de l'annonce" type="text">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-username">Prix</label>
                                        <input type="number" id="input-username" placeholder="Pix de l'annonce" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="pl-lg-4 col-lg-12">
                                    <div class="form-group">
                                        <label class="form-control-label">Description</label>
                                        <textarea rows="5" class="form-control" placeholder="Queslques mots sur l'annonce ..."></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="illustrations">Illustrations</label>
                                        <input type="file" multiple id="illustrations" placeholder="" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="form-group d-flex justify-content-end">
                                        <input type="submit" id="illustrations" placeholder="" class="btn btn-primary" value="Enregistrer">
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

</body>

</html>