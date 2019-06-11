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
  database: "shakeitdata_loc",
  multipleStatements: true
});

function createDatabase() {
  debugger
  $("#msg").html('<br><center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-0" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div>\n\
  </div><br><br><h5>Creando base de datos...</h5></center>');

  $("#modal_msg").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

  var mysql = require('mysql');

  var conCreate = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root"
  });

  var val = 0
  var sql = "CREATE DATABASE IF NOT EXISTS shakeitdata_loc /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;";
  conCreate.query(sql, function (err, result) {
    if (err) {
      val++
    }
  });
  if (val > 0) {
    MensajeError1('Error al crear Base de datos.')
  } else {
    $("#msg").html('<br><center>\n\
    <div class="progress">\n\
      <div class="progress-bar w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>\n\
    </div>\n\
    </div><br><br><h5>Creando base de datos...</h5></center>');
    crearEstructura()
  }
}

function crearEstructura28() {
  debugger
  $("#msg").html('<br><center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div>\n\
  </div><br><br><h5>Creando estructura de base de datos...</h5></center>');

  var val = 0
  var execsql = require('execsql'),
    dbConfig = {
      host: 'localhost',
      user: 'root',
      password: 'root'
    },
    sql = 'use shakeitdata_loc;',
    sqlFile = 'C:/SoftanSol/Shake_It/Saves/Bin/Backups/dbEstructure.sql';
  execsql.config(dbConfig)
    .exec(sql)
    .execFile(sqlFile, function (err, results) {
      if (err) {
        val++;
      }
    }).end();
  if (val > 0) {
    MensajeError1('Error al crear estructura');
  } else {
    $("#msg").html('<br><center>\n\
        <div class="progress">\n\
          <div class="progress-bar w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>\n\
        </div>\n\
        </div><br><br><h5>Base de datos creada</h5></center>');
    dropTables();
  }
}

function crearEstructura() {
  debugger
  $("#msg").html('<br><center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div>\n\
  </div><br><br><h5>Creando estructura de base de datos...</h5></center>');

  var val = 0
  var fs = require('fs');

  var val = 0
  var sql = fs.readFileSync('C:/SoftanSol/Shake_It/Saves/Bin/Backups/dbEstructure.sql', 'utf8');
  con.query(sql, function (err, result) {
    if (err) {
      val++
      MensajeError1(err)
    }
  });

  if (val > 0) {
    //MensajeError1('Error al crear estructura');
  } else {
    $("#msg").html('<br><center>\n\
        <div class="progress">\n\
          <div class="progress-bar w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>\n\
        </div>\n\
        </div><br><br><h5>Base de datos creada</h5></center>');
    dropTables();
  }
}

function descargarScript() {
  debugger
  const http = require('https');
  const fs = require('fs');

  const file = fs.createWriteStream("C:/SoftanSol/Shake_It/Saves/Bin/Backups/dbEstructure.sql");
  const request = http.get("https://shakeitcol.co/Archivos/MySql/dbEstructure.sql", function (response) {
    response.pipe(file);
  });

}

function dropTables() {

  $("#msg").html('<br><center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-0" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div>\n\
  </div><br><br><h5>Modificando tablas</h5></center>');

  $("#modal_msg").modal({
    backdrop: 'static',
    keyboard: true,
    show: true
  });

  var val = 0
  var sqli = "DROP TABLE IF EXISTS caja, categorias, consumo, entidadespago, estados_generales, insumos, insumos_rel, inventario, medio_pago, movimientos_concepto, movimientos_tipo, productos, sedes, unidades, usuarios, usuarios_tipo;";
  con.query(sqli, function (err, result) {
    if (err) {
      val++
    }
  });

  if (val > 0) {
    MensajeError('Error al modificar tablas.')
  } else {
    $("#msg").html('<center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-25" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div><br>\n\
  </div><br><br><h5>Tablas Modificadas</h5></center>');
    createRemoteBackUp();
  }
}

function createRemoteBackUp() {

  $("#msg").html('<center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-50" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div><br>\n\
  </div><br><br><h5>Creando respaldo de base de datos.</h5></center>');

  var mysqlDump = require('mysqldump');
  var fs = require('fs');

  mysqlDump({
    connection: {
      //host: '190.8.176.71',
      //user: 'shakei_userbd',
      //password: 'Usuario01',
      //database: 'shakei_shakeit_prod',
      host: 'localhost',
      user: 'root',
      password: 'root',
      database: 'shakeitdata_des',
    },
    dump: {
      tables: ['caja', 'categorias', 'consumo', 'entidadespago', 'estados_generales', 'insumos', 'insumos_rel', 'inventario', 'medio_pago', 'movimientos_concepto', 'movimientos_tipo', 'productos', 'sedes', 'unidades', 'usuarios', 'usuarios_tipo'],
    },
    dumpToFile: 'C:/SoftanSol/Shake_It/Saves/Bin/Backups/backUpR.sql',
  }).then(dump => {
    $("#msg").html('<center>\n\
    <div class="progress">\n\
      <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>\n\
    </div><br>\n\
    </div><br><br><h5>Respaldo de base de datos creado.</h5></center>');
    restoreBackUp();
  })

}

function restoreBackUp() {

  $("#msg").html('<center>\n\
  <div class="progress">\n\
    <div class="progress-bar w-75" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>\n\
  </div><br>\n\
  </div><br><br><h5>Guardando datos locales.</h5></center>');

  require('mysql-import').config({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'shakeitdata_loc',
    onerror: err => MensajeError(err.message)
  }).import('C:/SoftanSol/Shake_It/Saves/Bin/Backups/backUpR.sql').then(() => {
    $("#msg").html('<center>\n\
    <div class="progress">\n\
      <div class="progress-bar w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>\n\
    </div><br>\n\
    </div><br><br><h5>Datos locales guardados.</h5></center>');
    localStorage.setItem("backup", 1);
    localStorage.setItem("backupDete", fechaAhora);
    $("#modal_msg").modal('hide');
    validaLicencia();
  });
}

function MensajeError(err) {

  $("#msg").html('<center>\n\
    <i class="fas fa-exclamation-triangle"></i>\n\
    </div><br><br><h5>Error al guardar los datos: ' + err + '</h5></center>');
  $("#btns").html("<center>\n\
   <a class='btn btn-danger btn-sm' href='javascript: dropTables()' role='button'>Reintentar</a>\n\
   </center>");

}

function MensajeError1(err) {

  $("#msg").html('<center>\n\
    <i class="fas fa-exclamation-triangle"></i>\n\
    </div><br><br><h5>Error al guardar los datos: ' + err + '</h5></center>');
  $("#btns").html("<center>\n\
   <a class='btn btn-danger btn-sm' href='javascript: createDatabase()' role='button'>Reintentar</a>\n\
   </center>");

}
