package mx.gob.redoaxaca.cednna.domino

import org.springframework.dao.DataIntegrityViolationException

class DependenciaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [dependenciaInstanceList: Dependencia.list(params), dependenciaInstanceTotal: Dependencia.count()]
    }

    def create() {
        [dependenciaInstance: new Dependencia(params)]
    }

    def save() {
        def dependenciaInstance = new Dependencia(params)
        if (!dependenciaInstance.save(flush: true)) {
            render(view: "create", model: [dependenciaInstance: dependenciaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), dependenciaInstance.id])
        redirect(action: "show", id: dependenciaInstance.id)
    }

    def show(Long id) {
        def dependenciaInstance = Dependencia.get(id)
        if (!dependenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "list")
            return
        }

        [dependenciaInstance: dependenciaInstance]
    }

    def edit(Long id) {
        def dependenciaInstance = Dependencia.get(id)
        if (!dependenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "list")
            return
        }

        [dependenciaInstance: dependenciaInstance]
    }

    def update(Long id, Long version) {
        def dependenciaInstance = Dependencia.get(id)
        if (!dependenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (dependenciaInstance.version > version) {
                dependenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'dependencia.label', default: 'Dependencia')] as Object[],
                          "Another user has updated this Dependencia while you were editing")
                render(view: "edit", model: [dependenciaInstance: dependenciaInstance])
                return
            }
        }

        dependenciaInstance.properties = params

        if (!dependenciaInstance.save(flush: true)) {
            render(view: "edit", model: [dependenciaInstance: dependenciaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), dependenciaInstance.id])
        redirect(action: "show", id: dependenciaInstance.id)
    }

    def delete(Long id) {
        def dependenciaInstance = Dependencia.get(id)
        if (!dependenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "list")
            return
        }

        try {
            dependenciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'dependencia.label', default: 'Dependencia'), id])
            redirect(action: "show", id: id)
        }
    }
}