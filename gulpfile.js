var gulp = require('gulp'),
    browserify = require('browserify'),
    source = require('vinyl-source-stream'),
    uglify = require('gulp-uglify'),
    concat = require('gulp-concat'),
    jasmine = require('gulp-jasmine'),
    glob = require('glob');

gulp.task('browserify:tests', function() {
  browserify({
    entries: glob.sync('./tests/*.spec.coffee'),
    debug: true,
    extensions: [".coffee"],
    transform: ["coffeeify"]
  }).bundle()
    .pipe(source('specs.js'))
    .pipe(gulp.dest('./tests/'));
});

gulp.task('runTest', ['browserify:tests'], function() {
  return gulp.src('./tests/specs.js')
    .pipe(jasmine());
});

gulp.task('default', function() {
  gulp.watch('./tests/*.spec.coffee', ['browserify:tests', 'runTest']);
  gulp.watch('./*.coffee', ['browserify:tests', 'runTest']);
});
