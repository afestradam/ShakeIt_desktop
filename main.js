if (require('electron-squirrel-startup')) return;

require('update-electron-app')({
  repo: 'afestradam/ShakeIt_desktop',
  //host: 'C:/wamp64/www/ShakeIt_desktop/dist',
  updateInterval: '5 minutes',
  logger: require('electron-log')
});
//const { autoUpdater, dialog } = require("electron-updater")
const electron = require('electron')
const {app, BrowserWindow} = electron

const path = require('path')
const url = require('url')
//const feed ='http://shakeitcol.co/Archivos/Updates'

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

//app.on('ready', createWindow)

app.on('ready', () => {

  createWindow()

//autoUpdater.setFeedURL(feed)
//autoUpdater.checkForUpdates()

})

app.on('window-all-closed', () => {
  app.quit()
})

//autoUpdater.on('update-downloaded', (event, releaseNotes, releaseName) => {
//  const dialogOpts = {
    //type: 'información',
    //buttons: ['Reiniciar', 'Despues'],
    //title: 'Actualización de aplicación',
    //message: 'Una nueva versión ha sido descargada. Reiniciar la aplicación para aplicar las actualizaciones .'
//}

//dialog.showMessageBox(dialogOpts, (response) => {
//  if (response === 0) autoUpdater.quitAndInstall()
//})
//})

//autoUpdater.on('error', message => {
  //console.error('There was a problem updating the application')
  //console.error(message)
//})
