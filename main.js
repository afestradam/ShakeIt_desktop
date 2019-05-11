// if (require('electron-squirrel-startup')) return;
//
// require('update-electron-app')({
//   repo: 'afestradam/ShakeIt_desktop',
//   //host: 'C:/wamp64/www/ShakeIt_desktop/dist',
//   updateInterval: '5 minutes',
//   logger: require('electron-log')
// });
const {
  autoUpdater
} = require("electron-updater")
const electron = require('electron')
const {
  dialog
} = require('electron')
const {
  app,
  BrowserWindow
} = electron

const path = require('path')
const url = require('url')
const feed = 'http://shakeitcol.co/Archivos/Updates'
const options = {
  type: 'question',
  buttons: ['Cancel', 'Yes, please', 'No, thanks'],
  defaultId: 2,
  title: 'Question',
  message: 'Do you want to do this?',
  detail: 'It does not really matter',
  checkboxLabel: 'Remember my answer',
  checkboxChecked: true,
};

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

  autoUpdater.setFeedURL(feed)
  autoUpdater.checkForUpdates()

})

app.on('window-all-closed', () => {
  app.quit()
})

autoUpdater.on('update-downloaded', (event, releaseNotes, releaseName) => {

autoUpdater.quitAndInstall()

})

    autoUpdater.on('error', message => {
      alert('no');
    })
