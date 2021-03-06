package mx.gob.redoaxaca.cednna.seguridad

import mx.gob.redoaxaca.cednna.domino.Dependencia

class Usuario {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Dependencia dependencia
	

	static constraints = {
		username blank: false, unique: true
		password blank: false
		dependencia blank: true,nullable:true
	}
	

	 static mapping = {
        table 'sys_usuario'
        password column: 'password'
		nombreUsuario column: 'nombreusuario'
    }

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
