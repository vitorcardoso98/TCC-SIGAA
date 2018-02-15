function UsuarioDAO(){

	var connection = new ConexaoBanco();
	
	this.save = function (user, callback){
		var c = connection.connected();
		
		c.query('INSERT INTO usuario SET ?', [user], function(err, result){
			if(err){
				console.log("[ERROR]" + err.message);
				callback(false);
			}else{
				callback(true);
				c.end;
			}
		});
	}
}