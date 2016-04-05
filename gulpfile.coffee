gulp= require 'gulp'
coffee= require 'gulp-coffee'
coffeelint = require('gulp-coffeelint')
uglify= require 'gulp-uglify'
coffeeSrc=['src/*.coffee']
gulp.task 'lint',->
  gulp.src coffeeSrc
  .pipe(coffeelint())
  .pipe(coffeelint.reporter())
  .pipe(coffeelint.reporter('fail'))
gulp.task 'build',['lint'],->
  gulp.src coffeeSrc
  .pipe coffee bare:true
  # .pipe uglify()
  .pipe gulp.dest 'dist/'
gulp.task 'default',->
  gulp.watch coffeeSrc,['build']
