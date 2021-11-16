package fr.estia.projet_grails


import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class ApiController {
//    Accessible sur /api/user/**
//    Gestion de : GET / PUT / PATCH / DELETE<
    def user()
    {
        switch (request.getMethod())
        {
            case "GET":
                if (!params.id)
                    return response.status = 400
                def userInstance = User.get(params.id)
                if (!userInstance)
                    return response.status = 404
//                respond userInstance
                renderThis(userInstance, request.getHeader('Accept'))
            break;
            case "POST":
                // 0. verification des parametres : 400
                Map data = request.JSON
                if (!data.username || !data.password || !data.role || data.username == "" || data.password == "" || data.role == "") {
                    respond([message: "Certains paramètres manquent"], status: 404)
                }
                // 1. on crée un nouvel utilisateur
                //     1.1 verifier que l'utilisateur se sauvegarde bien sinon 400
                def userInstance = new User(username: data.username, password: data.password);
                if (!userInstance.save(flush: true)) {
                    respond([message: "Erreur lors de la création de l'utilisateur", errors: userInstance.errors.allErrors], status: 400)
                    return
                }

                // 2. on recupere le role
                //     2.1 si le role n'existe pas 404
                def userRole = Role.findByAuthority(data.role)
                if(!userRole) {
                    respond([message: "Le rôle défini n'a pas été trouvé"], status: 404)
                    return
                }
                
                // 3. associer le role a l'utilisateur
                //     3.1 verifier que l'attribution s'est bien passée
                UserRole.create(userInstance, userRole, true)

                // 4. sauvegarde
                //     4.1 sauvegarde echoue: 400
                if (!userInstance.save(flush: true)) {
                    respond([message: "Erreur lors de la création de l'utilisateur", errors: userInstance.errors.allErrors], status: 400)
                    return
                }



                // 5. créé : 200
                // 6. on recupere l'user créé
                respond([userId: userInstance.id], status: 200)

            break;
            case "PUT":
            break;
            case "PATCH":
            break;
            case "DELETE":
            break;
            default:
            break;
        }
    }

//    Accessible sur /api/users/**
    def users()
    {

    }

    def annonce()
    {

    }

    def annonces()
    {

    }

    def renderThis(Object instance, String acceptHeader)
    {
        switch (acceptHeader)
        {
            case "json":
            case "application/json":
            case "text/json":
                render instance as JSON
                return
                break;
            case "xml":
            case "application/xml":
            case "text/xml":
                render instance as XML
                return
                break;
            default:
                return response.status = 406
            break;
        }
    }
}
