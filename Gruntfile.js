module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({

    //make 2 packages and choose zepto if browser if new enough. This choice is made in default.html.eco
    uglify: {
      "jquery-pack": {
        "src": [
          "src/documents/scripts/modernizr.js",
          "node_modules/foundation/js/vendor/jquery.js",
          "node_modules/foundation/js/foundation/foundation.js",
          "node_modules/foundation/js/foundation/foundation.topbar.js",
          "bower_components/iframe-auto-height-jquery-plugin/Src/iframeheight.min.js"
        ],
        "dest": "out/scripts/jquery-pack.min.js"
      },
      "ace-pack": {
        // "src": ['bower_components/ace-builds/src-min/**/*.js'],
        // minimal dependencies... ace is big
        "src": [
          'bower_components/ace-builds/src-min/ace.js',
          'bower_components/ace-builds/src-min/mode-ruby.js',
          'bower_components/ace-builds/src-min/theme-github.js'
        ],
        "dest": "out/scripts/ace-pack.min.js"
      }
    }
  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-uglify');

  // Default task(s).
  grunt.registerTask('default', ['uglify']);

};
