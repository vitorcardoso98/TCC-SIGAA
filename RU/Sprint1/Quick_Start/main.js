const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')

let janela

function criaJanela(){
	janela = new BrowserWindow({width:800, height:600})
	
	janela.loadURL(url.format({
		pathname: path.join(__dirname, 'index.html'),
		protocol: 'file',
		slashes: true
	}))
	
	janela.webContents.openDevTools()
	
	janela.on('closed', () => {
		janela = null
	})
}
	app.on('ready', criaJanela)

	app.on('window-all-closed', () => {
		if (process.platform !== 'darwin') {
			app.quit()
		}
	})

	app.on('activate', () => {
		if (win === null) {
			criaJanela()
		}
	})
