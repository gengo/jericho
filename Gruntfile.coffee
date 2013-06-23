path = require 'path'

# Build configurations.
module.exports = (grunt) ->

    # load all grunt tasks
    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.initConfig

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
            files: ['scss/jericho.scss']
            dev:
                importPath: '/../..'
                src: 'scss'
                dest: 'css'
                noLineComments: false
                forcecompile: false
                debugsass: true
                relativeassets: true
            prod:
                importPath: '/../..'
                src: 'scss'
                dest: 'css'
                noLineComments: true
                forcecompile: true
                debugsass: false
                relativeassets: true

        # Sets up file watchers and runs tasks when watched files are changed.
        watch:
            styles:
                files: './scss/**/*.scss'
                tasks: [
                    'compass:dev'
                    'concat:dev'
                    'copy:dev'
                ]

        copy:
            dev:
                files: [
                    cwd: './css'
                    src: [
                        'jericho.css'
                    ]
                    dest: './'
                    expand: true
                ]
            prod:
                files: [
                    cwd: './css'
                    src: [
                        'jericho.css'
                        'jericho.min.css'
                    ]
                    dest: './'
                    expand: true
                ]

        concat:
            options:
              separator: ';'
            dev:
              src: ['css/jericho.css', 'css/responsive.css']
              dest: 'css/jericho.css'
            prod:
              src: ['css/jericho.css', 'css/responsive.css']
              dest: 'css/jericho.css'

    # Compiles the app with non-optimized build settings and places the build artifacts in the dist directory.
    # Enter the following command at the command line to execute this build task:
    # grunt
    grunt.registerTask 'default', [
        'compass:dev'
        'concat:dev'
        'copy:dev'
        'watch'
    ]
    grunt.registerTask 'dev', [
        'compass:dev'
        'concat:dev'
        'copy:dev'
        'watch'
    ]

    # Compiles the app with optimized build settings and places the build artifacts in the dist directory.
    # Enter the following command at the command line to execute this build task:
    # grunt prod
    grunt.registerTask 'build', [
        'compass:prod'
        'concat:prod'
        'copy:prod'
        'requirejs:styles'
    ]