gulp= require 'gulp'
apidoc= require 'gulp-apidoc'
coffee= require 'gulp-coffee'
coffeelint = require('gulp-coffeelint')
concat= require 'gulp-concat'
uglify= require 'gulp-uglify'
coffeeSrc=['api*.coffee']
gulp.task 'lint',->
  gulp.src coffeeSrc
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffeelint.reporter('fail'))
gulp.task 'build',['lint'],->
  gulp.src coffeeSrc
  .pipe coffee bare:true
  .pipe uglify()
  .pipe concat 'index.js'
  .pipe gulp.dest './'
gulp.task 'default',->
  gulp.watch coffeeSrc,['build']
