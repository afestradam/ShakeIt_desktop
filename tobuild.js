{
  "name": "ShekeIt",
  "version": "1.0.0",
  "description": "Aplicación para el proceso de facturación y control de inventario de Shake It Milkshake's & Smoothie Bar",
  "main": "./main.js",
  "scripts": {
    "postinstall": "install-app-deps",
    "start": "electron .",
    "pack": "build --dir",
    "dist": "build",
    "release:win": "electron-builder --win"
  },
  "author": "Softan Soluciones",
  "license": "SEE LICENSE IN <T_Licencia.pdf>",
  "build": {
    "appId": "ShakeIt_DesktopV1",
    "asar": true,
    "dmg": {
      "contents": [
        {
          "x": 110,
          "y": 150
        },
        {
          "x": 240,
          "y": 150,
          "type": "link",
          "path": "/Applications"
        }
      ]
    },
    "linux": {
      "target": [
        "AppImage",
        "deb"
      ]
    },
    "win": {
      "target": "NSIS",
      "icon": "build/icon.ico"
    }
  },
  "dependencies": {
    "bootstrap": "^4.1.3",
    "jquery": "^3.4.0",
    "mysql": "^2.16.0",
    "mysql-backup": "^1.0.0",
    "mysql-import": "^2.0.2",
    "mysqldump": "^2.3.0",
    "node-thermal-printer": "^4.0.2",
    "popper": "^1.0.1",
    "popper.js": "^1.15.0",
    "request": "^2.88.0",
    "typescript": "^3.4.5"
  },
  "devDependencies": {
    "electron-builder": "^20.39.0"
  }
}
//----------------------------------------------------------To develop----------------------------------------------------
{
  "name": "ShakeIt",
  "version": "1.0.0",
  "description": "",
  "main": "./main.js",
  "scripts": {
    "start": "electron .",
    "pack": "build --dir",
    "dist": "build",
  },
  "author": "Softan Soluciones",
  "license": "MIT",
    "build": {
    "appId": "SoftanSo_1",
    "asar": true,
    "dmg": {
      "contents": [
        {
          "x": 110,
          "y": 150
        },
        {
          "x": 240,
          "y": 150,
          "type": "link",
          "path": "/Applications"
        }
      ]
    },
    "linux": {
      "target": [
        "AppImage",
        "deb"
      ]
    },
    "win": {
      "target": "NSIS",
      "icon": "build/icon.ico"
    }
  },
  "dependencies": {
    "electron": "^4.1.5",
    "file-system": "^2.2.2",
    "jquery": "^3.4.0",
    "mysql": "^2.17.1",
    "mysql-backup": "^1.0.0",
    "mysql-import": "^2.0.2",
    "mysqldump": "^2.3.0",
    "popper": "^1.0.1",
    "popper.js": "^1.15.0",
    "update-electron-app": "^1.3.0"
  },
  "devDependencies": {
    "electron-builder": "^20.39.0"
  }
}
////////--------------------------------------------------------------
{
  "name": "ShakeIt",
  "version": "1.0.0",
  "description": "Aplicación de escritorio para Shake It",
  "main": "./main.js",
  "scripts": {
    "start": "electron .",
    "pack": "build --dir",
    "dist": "build"
  },
  "author": "Softan Soluciones",
  "license": "MIT",
  "build": {
    "appId": "SoftanSo_1",
    "asar": true,
    "dmg": {
      "contents": [
        {
          "x": 110,
          "y": 150
        },
        {
          "x": 240,
          "y": 150,
          "type": "link",
          "path": "/Applications"
        }
      ]
    },
    "linux": {
      "target": [
        "AppImage",
        "deb"
      ]
    },
    "win": {
      "target": "NSIS",
      "icon": "build/icon.ico"
    }
  },
  "dependencies": {
    "file-system": "^2.2.2",
    "jquery": "^3.4.0",
    "mysql": "^2.17.1",
    "mysql-backup": "^1.0.0",
    "mysql-import": "^2.0.2",
    "mysqldump": "^2.3.0",
    "popper": "^1.0.1",
    "popper.js": "^1.15.0",
    "typescript": "^3.4.5"
  },
  "devDependencies": {
    "electron": "^4.1.5",
    "electron-builder": "^20.39.0",
    "electron-log": "^3.0.5",
    "electron-squirrel-startup": "^1.0.0",
    "squirrel": "^1.0.0",
    "npm ": "^1.3.0"
  }
}
