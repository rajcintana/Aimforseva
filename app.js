const express = require('express');

const fs = require('fs');
//const favicon = require('serve-favicon');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
var cons = require('consolidate');
const logger = require('./logger');
const config = require('./model/config');
const index = require('./routes/index');
var router=express.Router();
// changes by rajesh(t0007)
var appRoutes = require('./routes/master/country_master')(router);
var appRoutes = require('./routes/master/state_master')(router);
var appRoutes=require('./routes/master/user_master')(router);
//end of rajesh(t0007)
var app = express();
 
///////////pavithra  //////

require('dotenv').config();
  var path = require('./bin/dev');

///////////////////end pavithra//////

var path1 = require('path');
// view engine setup
app.engine('html', cons.swig)
app.set('views', path1.join(__dirname, 'views'));
app.set('view engine', 'html');

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path1.join(__dirname, 'public')));
app.use('/api',appRoutes);
app.use('/', index);
//app.use('/country', country);
//app.use('/state', state);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {

  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
