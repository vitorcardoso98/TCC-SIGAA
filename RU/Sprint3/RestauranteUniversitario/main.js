const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')
//const mysql = require('mysql');
const appE = require('./config/express')();
const http = require('http').Server(appE);

/*const connection = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root',
  password: '',
  database: 'restauranteuniversitario',
});*/

http.listen(8080, function(){
	console.log('Servidor rodando');
});

let janela;

function criaJanela(){
	janela = new BrowserWindow({width:1000, height:600});
	
	janela.loadURL(url.format({
		pathname: path.join(__dirname, 'app/views/index.html'),
		protocol: 'file',
		//slashes: false,
	}));
	
	janela.on('closed', () => {
		janela = null
	});
}
	app.on('ready', criaJanela);

	app.on('window-all-closed', () => {
		if (process.platform !== 'darwin') {
			app.quit()
		}
	});

	app.on('activate', () => {
		if (win === null) {
			criaJanela()
		}
	});