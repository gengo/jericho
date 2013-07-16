'use strict';

LIVERELOAD_PORT = 35729;
lrSnippet = require('connect-livereload')({port: LIVERELOAD_PORT})

path = require 'path'

# Build configurations.
module.exports = (grunt) ->

    # load all grunt tasks
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.initConfig

        # Sets up file watchers and runs tasks when watched files are changed.
        watch:
            options:
                livereload: true
            styles:
                files: './lib/{,*/}*.{scss,sass}'
                tasks: [
                    'compass:dev'
                    'concat:dev'
                    'copy:dev'
                    'copy:docs'
                ]
            livereload:
                options:
                    livereload: LIVERELOAD_PORT
                files: '.tmp/{,*/}*.css'

        connect:
            options:
                port: 9000
                 # change this to '0.0.0.0' to access the server from outside
                hostname: 'localhost'
            livereload:
                options:
                    middleware: (connect) ->
                        return [
                            lrSnippet
                            connect.static( require('path').resolve('.tmp') )
                            connect.static( require('path').resolve('docs') )
                        ]

        open:
            server:
                path: 'http://<%= connect.options.hostname %>:<%= connect.options.port %>'

        # RequireJS optimizer configuration for both scripts and styles.
        # This configuration is only used in the 'prod' build.
        # The optimizer will scan the main file, walk the dependency tree, and write the output in dependent sequence to a single file.
        # Since RequireJS is not being used outside of the main file or for dependency resolution (this is handled by AngularJS), RequireJS is not needed for final output and is excluded.
        # RequireJS is still used for the 'dev' build.
        # The main file is used only to establish the proper loading sequence.
        requirejs:
            styles:
                options:
                    baseUrl: './'
                    cssIn: './jericho.css'
                    logLevel: 0
                    optimizeCss: 'standard'
                    out: './jericho.min.css'

        compass:
            options:
                sassDir       : 'lib'
                cssDir        : '.tmp'
                imagesDir     : 'img'
                # fontsDir      : ''
                relativeAssets: true
            dev:
                options:
                    debugInfo: true
                    outputStyle: 'expanded'
                    noLineComments: false
                    relativeAssets: true
            prod:
                options:
                    debugInfo: false
                    outputStyle: 'expanded'
                    noLineComments: true
                    relativeAssets: true

        clean: ['css']

        copy:
            dev:
                files: [
                    cwd: '.tmp'
                    src: [
                        'jericho.css'
                    ]
                    dest: './'
                    expand: true
                ]
            prod:
                files: [
                    cwd: '.tmp'
                    src: [
                        'jericho.css'
                        'jericho.min.css'
                    ]
                    dest: './'
                    expand: true
                ]
            docs:
                files: [
                    cwd: './'
                    src: [
                        'jericho.css'
                    ]
                    dest: './docs/assets/css'
                    expand: true
                ]

        concat:
            options:
              separator: ';'
            dev:
              src: ['.tmp/jericho.css', '.tmp/responsive.css']
              dest: '.tmp/jericho.css'
            prod:
              src: ['.tmp/jericho.css', '.tmp/responsive.css']
              dest: '.tmp/jericho.css'



    grunt.registerTask 'server', (target) ->
        grunt.task.run([
            'compass:dev'
            'concat:dev'
            'copy:dev'
            'copy:docs'
            'connect:livereload'
            'open'
            'watch'
        ])


    # Compiles the app with non-optimized build settings and places the build artifacts in the dist directory.
    # Enter the following command at the command line to execute this build task:
    # grunt
    grunt.registerTask 'default', [
        'dev'
    ]

    grunt.registerTask 'dev', [
        'compass:dev'
        'concat:dev'
        'copy:dev'
        'copy:docs'
        'watch'
    ]

    # Compiles the app with optimized build settings and places the build artifacts in the dist directory.
    # Enter the following command at the command line to execute this build task:
    # grunt prod
    grunt.registerTask 'build', [
        'clean'
        'compass:prod'
        'concat:prod'
        'copy:prod'
        'copy:docs'
        'requirejs:styles'
    ]