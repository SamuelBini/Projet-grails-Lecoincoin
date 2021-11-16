<!DOCTYPE html>
<html>

<head>
    <meta name="layout" content="dashboard_template" />
    <g:set var="entityName" value="${message(code: 'annonce.label', default: 'Annonce')}" />
    <title>Annonces</title>
</head>

<body>
    <div id="list-annonce" class="content scaffold-list" role="main">


        <!-- Dark table -->
        <div class="row">
            <div class="col">
                <div class="card bg-default shadow">
                    <div class="card-header bg-transparent border-0">
                        <h3 class="text-white mb-0">Liste des annonces</h3>
                    </div>
                    <div class="table-responsive">
                        <table class="table align-items-center table-dark table-flush">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col" class="sort" data-sort="titre">Titre</th>
                                    <th scope="col" class="sort" data-sort="price">Prix</th>
                                    <th scope="col" class="sort" data-sort="author">Auteur</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                <g:each var="annonce" in="${annonces}">
                                    <tr>
                                        <th scope="row">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <span class="name mb-0 text-sm">${annonce.title}</span>
                                                </div>
                                            </div>
                                        </th>
                                        <td class="budget">
                                            ${annonce.price} €
                                        </td>
                                        <td>
                                            <div class="avatar-group">
                                                <a href="#" class="d-flex align-items-center">
                                                    <asset:image class="avatar avatar-sm rounded-circle"
                                                        src="template/theme/team-1.jpg" alt="Auteur 1" />
                                                    <span class="ml-2 text-white"
                                                        style="font-size:1.2em">${annonce.author.username}</span>
                                                </a>
                                            </div>
                                        </td>
                                        <td class="text-right">
                                            <div class="dropdown">
                                                <a class="btn btn-sm btn-icon-only text-light" href="#" role="button"
                                                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <i class="fas fa-ellipsis-v"></i>
                                                </a>
                                                <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                    <a class="dropdown-item" href="/annonce/show/${annonce.id}">Voir</a>
                                                    <a class="dropdown-item"
                                                        href="/annonce/edit/${annonce.id}">Modifier</a>
                                                    <a class="dropdown-item alert-danger deleteButton"
                                                        data-toggle="modal" data-deleteId="${annonce.id}"
                                                        data-target="#deleteModal" href="#">Supprimer</a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </g:each>
                            </tbody>
                        </table>
                    </div>
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
                    <a type="button" class="btn btn-danger" data-dismiss="modal" id="deleteModalButton" >Supprimer</a>
                    <a type="button" class="btn btn-primary" href="#" data-dismiss="modal">Annuler</a>
                </div>
            </div>
        </div>
    </div>


    <script>
        document.querySelectorAll('.deleteButton').forEach(element => {
            element.addEventListener('click', event => {
                document.getElementById("deleteModalButton").setAttribute("href", "/annonce/delete/" + event.target.getAttribute("data-deleteId"));
            })
        });

    </script>
</body>

</html>