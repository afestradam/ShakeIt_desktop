require('update-electron-app')({
  repo: 'C:/wamp64/www/ShakeIt_desktop/dist/win-unpacked',
  //host: 'C:/wamp64/www/ShakeIt_desktop/dist',
  updateInterval: '5 minutes',
  logger: require('electron-log')
});

const electron = require('electron')
const {app, BrowserWindow} = electron

const path = require('path')
const url = require('url')

let win

function createWindow() {
    win = new BrowserWindow()
    win.loadURL(url.format({
        pathname: path.join(__dirname, 'Views/index.html'),
        protocol: 'file',
        slashes: true
    }))

    win.maximize();
}

app.on('ready', createWindow)