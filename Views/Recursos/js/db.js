/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var mysql = require('mysql');

var conn = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "shakeitdata_des"
});

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "shakeitdata_loc"
});

function createDatabase() {

  var mysql = require('mysql');

  var conCreate = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root"
  });

  var sql = "CREATE DATABASE IF NOT EXISTS shakeitdata_loc /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;";
  conCreate.query(sql, function(err, result) {
    if (err) {
      alert('Error al crear Base de datos.')
    } else {
      alert('Base de datos creada.')
      restoreBackUp();
    }
  });
}

function RemoteBackUp() {

  $("#msg").html('<center>\n\
  <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">\n\
  <span class="sr-only">Loading...</span>\n\
  </div></center>');

  $("#modal_msg").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

  var mysqldump = require('mysqldump');
  var fs = require('fs');

  mysqldump({
    connection: {
      host: '190.8.176.71',
      user: 'shakei_userbd',
      password: 'Usuario01',
      database: 'shakei_shakeit_prod',
    },
    dumpToFile: 'C:/SoftanSol/Shake_It/Saves/Bin/Backups/backUpR.sql',
  });
  $("#modal_msg").modal('hide');
  //  validaLicencia();

}

function createRemoteBackUp() {

  $("#msg").html('<center>\n\
  <div class="spinner-border" style="width: 3rem; height: 3rem;" role="status">\n\
  <span class="sr-only">Loading...</span>\n\
  </div></center>');

  $("#modal_msg").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

  var mysqlDump = require('mysqldump');
  var fs = require('fs');

  mysqlDump({
    connection: {
      host: '190.8.176.71',
      user: 'shakei_userbd',
      password: 'Usuario01',
      database: 'shakei_shakeit_prod',
    },
    dump:{
      tables: ['caja', 'categorias', ''],
    },
    dumpToFile: 'C:/SoftanSol/Shake_It/Saves/Bin/Backups/backUpR.sql',
    }).then(dump => {
      $("#modal_msg").modal('hide');
    })

  }

  function restoreBackUp() {

    require('mysql-import').config({
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'shakeitdata_loc',
      onerror: err => alert(err.message)
    }).import('C:/SoftanSol/Shake_It/Saves/Bin/Backups/backUpR.sql').then(() => {
      alert('Base de datos restaurada.')
    });

