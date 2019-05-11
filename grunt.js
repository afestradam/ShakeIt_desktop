module.exports = function(grunt) {
  grunt.initConfig({
    'create-windows-installer': {
      ia32: {
        appDirectory: './MyApp-win32-ia32',
        outputDirectory: './dist',
        name: 'shakeitcol',
        description: 'Aplicaión de escritorio para facturación y cotrol de sedes.',
        authors: 'Softan Soluciones',
        exe: 'shakeitcol.exe'
      }
    }
  });

  grunt.loadNpmTasks('grunt-electron-installer');
};
