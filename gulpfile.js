var gulp = require('gulp'),
    browserify = require('browserify'),
    source = require('vinyl-source-stream'),
    istanbul = require('gulp-istanbul'),
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

gulp.task('pre-test', function() {
  return gulp.src('./tests/specs.js')
    .pipe(istanbul())
    .pipe(istanbul.hookRequire());
});

gulp.task('runTests', ['browserify:tests', 'pre-test'], function() {
  return gulp.src('./tests/specs.js')
    .pipe(jasmine())
    .pipe(istanbul.writeReports());
});

gulp.task('default', function() {
  gulp.watch('./tests/*.spec.coffee', ['browserify:tests', 'runTests']);
  gulp.watch('./*.coffee', ['browserify:tests', 'runTests']);
});
