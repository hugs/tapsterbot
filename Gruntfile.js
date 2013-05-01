module.exports = function(grunt) {
  'use strict';

  // Project configuration.
  grunt.initConfig({
    jasmine: {
      src: 'src/**/*.js',
      options: {
        specs: 'spec/**/*.js'
      }
    },
    jshint: {
      all: [
        'Gruntfile.js',
        'src/**/*.js',
        'spec/**/*.js'],
      options: {
        jshintrc: '.jshintrc'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-jasmine');
  grunt.loadNpmTasks('grunt-contrib-jshint');

  grunt.registerTask('test', ['jshint', 'jasmine']);

  grunt.registerTask('default', ['test']);

};
