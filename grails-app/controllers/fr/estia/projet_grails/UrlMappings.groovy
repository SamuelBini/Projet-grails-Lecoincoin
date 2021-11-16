package fr.estia.projet_grails

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{

            http://localhost:8080/annonce/show/4
            constraints {
                // apply constraints here
            }
        }

        "/annonce" (resources:'annonce')

        '/admin' (controller: 'admin', action:'index')

        "/" (view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
