var uDAO = new UsuarioDAO();

function CadastroController(){

	this.saveUsuario = function (nome, callback){
	
		var usuario = new Usuario(nome);
		return uDAO.save(usuario, callback);
	};
}