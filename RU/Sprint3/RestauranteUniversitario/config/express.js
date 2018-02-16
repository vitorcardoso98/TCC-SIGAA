var express = require('express');
var bodyParser = require('body-parser');
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'restauranteuniversitario',
});

module.exports = function(){
	var app = express();
	
	app.set('view engine', 'ejs');
	app.set('views', './app/views');
	
	app.use(bodyParser.urlencoded({extend: true}));
	app.use(bodyParser.json());
	
	app.post('/cadastrar', function(req,res){
		const codigo = req.body.codigo;
		const descricao = req.body.descricao;
		const valor = req.body.valor;
		console.log(codigo);
		console.log(descricao);
		console.log(valor);
		connection.query('INSERT INTO parametros (descricao, valor, codigo) VALUES(?,?,?)', [descricao, valor, codigo], function(err, result){;
			if(err){
				throw err;
			} else {
				res.redirect('/parametros');
			}
		});	
	});
	
	app.get('/cadastrarParametros', function(req,res){
		res.render('cadastraParametros');
	});

	app.get('/inicio', function(req,res){
		res.render('index');
	});
	
	var obj = {};
	app.get('/parametros', function(req, res){

		connection.query('SELECT * FROM parametros', function(err, result) {
			if(err){
				throw err;
			} else {
				obj = {print: result};
				res.render('parametros', obj);                
			}
		});
	});
	
	app.get('/parametros/:id', function(req, res){
		const codigo = req.params.id;
		connection.query('SELECT * FROM parametros WHERE codigo=?', [codigo], function(err, result) {
			if(err){
				throw err;
			} else {
				obj = {print: result};
				res.render('editaParametros', obj);                
			}
		});
	});
	
	app.post('/editar/:id', function(req,res){
		const codigo = req.params.id;
		const descricao = req.body.descricao;
		const valor = req.body.valor;
		connection.query('UPDATE parametros SET descricao=?, valor=? WHERE codigo=?', [descricao, valor, codigo], function(err, result){;
			if(err){
				throw err;
			} else {
				res.redirect('/parametros');
			}
		});	
	});
	
	app.get('/apagar/:id', function(req, res){
		const codigo = req.params.id;
		connection.query('DELETE FROM parametros WHERE codigo=?', [codigo], function(err, result) {
			if(err){
				throw err;
			} else {
				res.redirect('/parametros');                
			}
		});
	});
	
	return app;
}