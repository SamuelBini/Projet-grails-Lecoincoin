package fr.estia.projet_grails

class Annonce {

    String title
    String description
    Date dateCreated
    Date lastUpdated
    Float price

    static belongsTo = [author: User]

    static hasMany = [illustrations: Illustration]

    static constraints = {
        title nullable: false, blank: false, minSize: 10
        description nullable: false, blank: false
        price nullable: false, min: 0F, scale: 2
    }

    static mapping = {
        description type: 'text'
    }
}
