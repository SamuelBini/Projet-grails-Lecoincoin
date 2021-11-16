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
                            <h3 class="mb-0">Détails de l'annonce</h3>
                        </div>
                        <div class="col-4 text-right">
                            <a href="/annonce/edit/${annonce.id}" class="btn btn-sm btn-primary">Modifier</a>
                            <a class="btn btn-sm btn-primary text-white" data-toggle="modal" data-target="#deleteModal" data-id="${annonce.id}">Supprimer</a>
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form>
                        <div class="pl-lg-4">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-address">Titre</label>
                                        <input id="input-address" class="form-control" placeholder="Home Address"
                                            value="${annonce.title}" type="text" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-username">Prix</label>
                                        <input type="text" id="input-username" class="form-control"
                                            value="${annonce.price} €" disabled>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label class="form-control-label" for="input-email">Date de création</label>
                                        <input type="email" id="input-email" class="form-control"
                                            value="${annonce.dateCreated}" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="pl-lg-4 col-lg-12">
                                    <div class="form-group">
                                        <label class="form-control-label">Description</label>
                                        <textarea rows="5" class="form-control" placeholder="A few words about you ..."
                                            disabled>${annonce.description}</textarea>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="pl-lg-4 col-lg-12">
                                        <label class="form-control-label">Illustrations</label>
                                        <div class="row">
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirmation de suppression</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Voulez-vous vraiment supprimer cette annonce ?
                </div>
                <div class="modal-footer">
                    <a type="button" class="btn btn-danger" href="/annonce/delete/${annonce.id}" data-dismiss="modal">Supprimer</a>
                    <a type="button" href="#" class="btn btn-primary" data-dismiss="modal">Annuler</a>
                </div>
            </div>
        </div>
    </div>

</body>

</html>