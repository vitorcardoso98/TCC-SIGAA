const electron = require('electron');
const path = require('path');
const { ipcMain } = require('electron');

const app = electron.app;

const BrowserWindow = electron.BrowserWindow

const url = require('url')

let mainWindow;
let secondWindow;

function createWindow() {

    mainWindow = new BrowserWindow({ width: 800, height: 600 });
    secondWindow = new BrowserWindow({ width: 800, height: 600 });

    mainWindow.loadURL(url.format({
        pathname: path.join(__dirname, 'index.html'),
        protocol: 'file:',
        slashes: true
    }))

    secondWindow.loadURL(url.format({
        pathname: path.join(__dirname, 'otherfile.html'),
        protocol: 'file:',
        slashes: true
    }))

    ipcMain.on('atualiza-label-pagina-secundaria', (event, arg) => {
        secondWindow.webContents.send('atualiza-label', arg);
    });

    mainWindow.on('closed', function () {
        mainWindow = null;
        secondWindow = null;
    })
}

app.on('ready', createWindow)

app.on('window-all-closed', function () {
    if (process.platform !== 'darwin') {
        app.quit()
    }
})

app.on('activate', function () {
    if (mainWindow === null) {
        createWindow()
    }
})