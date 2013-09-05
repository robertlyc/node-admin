module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-contrib-coffee"
  # grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-sass"
  
  grunt.initConfig
    sass:
      dist:
        files:
          './public/stylesheets/main.css': './app/assets/stylesheets/main.scss'
          
  
  grunt.registerTask 'default', ['sass']