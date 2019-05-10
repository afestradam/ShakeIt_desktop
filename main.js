//require('update-electron-app')({
  //repo: 'afestradam/ShakeIt_desktop',
  //host: 'C:/wamp64/www/ShakeIt_desktop/dist',
  //updateInterval: '5 minutes',
  //logger: require('electron-log')
//});
const { autoUpdater } = require("electron-updater")
const electron = require('electron')
const {app, BrowserWindow} = electron

const path = require('path')
const url = require('url')
const feed ='http://shakeitcol.co/Archivos/Updates'

let win

const dispatch = (data) => {
  win.webContents.send('message', data)
}

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

  win.webContents.on('did-finish-load', () => {
    win.webContents.send('version', app.getVersion())
  })

})

app.on('window-all-closed', () => {
  app.quit()
})


autoUpdater.on('checking-for-update', () => {
  dispatch('Checking for update...')
})

autoUpdater.on('update-available', (info) => {
  dispatch('Update available.')
})

autoUpdater.on('update-not-available', (info) => {
  dispatch('Update not available.')
})

autoUpdater.on('error', (err) => {
  dispatch('Error in auto-updater. ' + err)
})

autoUpdater.on('download-progress', (progressObj) => {
  // let log_message = "Download speed: " + progressObj.bytesPerSecond
  // log_message = log_message + ' - Downloaded ' + progressObj.percent + '%'
  // log_message = log_message + ' (' + progressObj.transferred + "/" + progressObj.total + ')'
  // dispatch(log_message)

    win.webContents.send('download-progress', progressObj.percent)

})

autoUpdater.on('update-downloaded', (info) => {
  dispatch('Update downloaded')
})
