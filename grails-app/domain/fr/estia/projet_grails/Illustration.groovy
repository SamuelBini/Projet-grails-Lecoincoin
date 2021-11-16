package fr.estia.projet_grails

class Illustration {

    String filename
    Integer size

    static belongsTo = [annonce: Annonce]

    static constraints = {
        filename nullable: false, blank: false
        size nullable: true, min: 0
    }
}
