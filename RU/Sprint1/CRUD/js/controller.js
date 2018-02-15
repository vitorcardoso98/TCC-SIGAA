var electron = require('electron')

function realizarCadastro(){
	var nome = document.getElementById('nome').value;
	
	var cadCon = new CadastroController();
	
	cadCon.saveUsuario(
		nome,
		function (result){
			if(result==true){
				alert('Cadastro realizado com sucesso');
				location.href = "/index.html";
			}else{
				alert('Erro no cadastro');
			}
		}
	);
}


