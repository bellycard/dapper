module.exports = ( grunt ) ->

  # All directories used to store temporary files and data. 
  # These directories should be ignored from git.
  sass_cache = 'tmp/cache/sass'
  build_dir = 'tmp/build'
  tmp_dirs = [
    sass_cache
    build_dir
  ]

  # Default port to listen to live-reloads from grunt-contrib-watch
  live_port = 35729

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    # Clean all temporary directories
    clean: tmp_dirs

    # Create temporary directories
    mkdir: all: options: create: tmp_dirs

    # start a light-weight server for development
    connect: server: options:
      port: 3000
      base: build_dir

    # Copy & Compile Client-Side Assets
    # This will Copy and Compile all of our client-side
    # source assets including images, sass, coffeescript, 
    # and jade templates. After this is done, it will parse
    # the main layout HTML and add the compiled scripts.

    # Copy imgage assets
    copy: images:
      src: 'source/images'
      dest: 'tmp/build/images'

    # Compile Coffeescript assets
    coffee: glob_to_multiple:
      expand: true
      flatten: true
      src: ['source/*.coffee']
      dest: build_dir
      ext: '.js'

    # Compile Sass assets
    sass: 
      dist: 
        options:
          style: 'compressed'
          cacheLocation: 'tmp/cache/sass'
        files:
          build_dir + '/styles/main.css': 'source/styles/main.scss'

    # Compile jade to html
    jade: html:
      src: ['source/*.jade']
      dest: build_dir
      options:
        pretty: true
        client: false

    # Parse the html and add compiled scripts into script tags
    scriptlinker:
      defaultOptions:
        options:
          startTag: '<!-- * scripts -->'
          endTag: '<!-- * end -->'
          fileTmpl: "<script src=\"http://localhost:#{live_port}%s\"></script>"
          appRoot: build_dir
        files:
          'tmp/build/index.html': [build_dir + '/**/*.js']

    # Watch source files for changes, recompile when changed
    watch:
      coffee:
        files: ['source/*.coffee']
        tasks: ['coffee']
        options: spawn: false
      jade:
        files: ['source/*.jade']
        tasks: ['jade']
        options: spawn: false
      sass:
        files: ['source/*.scss']
        tasks: ['sass']
        options: spawn: false

  # Load the plugins
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

  # Default task(s).
  grunt.registerTask 'default', ['clean', 'mkdir', 'jade', 'coffee', 'scriptlinker', 'connect', 'watch']