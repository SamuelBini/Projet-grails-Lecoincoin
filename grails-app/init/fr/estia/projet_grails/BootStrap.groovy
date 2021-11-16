package fr.estia.projet_grails

class BootStrap {

    def init = { servletContext ->
        //        Je crée les rôles que je vais utiliser dans mon application
        def adminRole = new Role(authority: "ROLE_ADMIN").save(flush: true)
        def modoRole = new Role(authority: "ROLE_MODO").save(flush: true)
        def userRole = new Role(authority: "ROLE_USER").save(flush: true)

//        Je crée l'utilisateur administrateur
        def adminUserInstance = new User(username: "admin", password: "admin").save()

//        J'associe le role admin à l'utilisateur correspondant
        UserRole.create(adminUserInstance, adminRole, true)

//        Création de 5 utilisateurs
        ["Alice", "Bob", "Charly", "Denis", "Etienne"].each {
            String username ->
                def userInstance = new User(username: username, password: "password").save()
//                On ajoute 5 annonce par utilisateur
                (1..5).each {
                    Integer annonceIdx ->
                        def annonceInstance =
                                new Annonce(title: "Title Annonce $annonceIdx $username",
                                        description: "Description de l'annonce",
                                        price: 100 * annonceIdx)
//                        On ajoute 5 illustrations par annonce
                        (1..5).each {
                            annonceInstance.addToIllustrations(new Illustration(filename: "grails.svg", size: 100))
                        }
                        userInstance.addToAnnonces(annonceInstance)
                        userInstance.save(flush: true)
                }
        }

    }
    def destroy = {
    }
}
