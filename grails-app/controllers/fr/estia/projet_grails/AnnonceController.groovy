package fr.estia.projet_grails

import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*

import grails.plugin.springsecurity.annotation.Secured
import grails.plugin.springsecurity.SpringSecurityService


class AnnonceController {

    AnnonceService annonceService
    
    def springSecurityService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    @Secured(['ROLE_ADMIN', 'ROLE_MODO', 'ROLE_USER'])
    def index(Integer page) {
        def user = springSecurityService.currentUser
        def annonces = Annonce.getAll()
        render (view: '/annonce/index', model: [user: user, link: "annonce", pageTitle: "Voir les annonces", layoutParentTitle: "Annonces", annonces: annonces])
    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO', 'ROLE_USER'])
    def show(Long id) {
        def user = springSecurityService.currentUser
        def annonce = Annonce.get(id)
        render (view: '/annonce/show', model: [user: user, link: "annonce", pageTitle: "Détails annonce", layoutParentTitle: "Annonces", annonce: annonce])

    }

    @Secured(['ROLE_ADMIN', 'ROLE_MODO', 'ROLE_USER'])
    def create() {
        if(request.get)
        def user = springSecurityService.currentUser
        render (view: '/annonce/create', model: [user: user, link: "annonce", pageTitle: "Nouvelle annonce", layoutParentTitle: "Annonces"])
    }


    def save(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*' { respond annonce, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond annonceService.get(id)
    }

    def update(Annonce annonce) {
        if (annonce == null) {
            notFound()
            return
        }

        try {
            annonceService.save(annonce)
        } catch (ValidationException e) {
            respond annonce.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'annonce.label', default: 'Annonce'), annonce.id])
                redirect annonce
            }
            '*'{ respond annonce, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        annonceService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'annonce.label', default: 'Annonce'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'annonce.label', default: 'Annonce'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

}
