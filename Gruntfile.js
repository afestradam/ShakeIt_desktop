module.exports = function(grunt) {
  grunt.initConfig({
    'create-windows-installer': {
      ia32: {
        appDirectory: './build/shakeitcol-32',
        outputDirectory: './dist/installer32',
        name: 'shakeitcol',
        description: 'Aplicaión de escritorio para facturación y cotrol de sedes.',
        authors: 'Softan Soluciones',
        exe: 'shakeitcol.exe'
      }
    }
  });

  grunt.loadNpmTasks('grunt-electron-installer');
};
