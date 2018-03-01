/*
Guidelines for Comments

Header comments for the Files
*/
/****************************************************/

// Filename : server.js*

//Purpose /Functionality: create the connection pool to mysql database
              

// Author : Rajesh Kumar Ranjan(T0007) and pavithra

// Createdon: 17-feb-1018

// Change history:

// v1.10 date of change /Author name

/****************************************************/
/*
Block level Comments:

Block comments to document a method
*/

/**

* Author : Rajesh Kumar Ranjan(T0007) and Pavithra, Created on:17-feb-2018 , Purpose:
* @param
      
* @return

* Change history

: **/
var express=require("express");
var bodyParser=require('body-parser');
var winston = require('winston');
var app = express();
///////////pavithra  //////

require('dotenv').config();
  var path = require('./bin/dev');

///////////////////end pavithra//////
var router=express.Router();


var appRoutes=require('./app/model/country_master')(router);
var appRoutes=require('./app/model/state_master')(router);
var appRoutes=require('./app/model/user_master')(router);
var bodyParser=require('body-parser');
var path=require('path');

app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());
app.use(express.static(__dirname+'/public'));
app.use('/api',appRoutes);
app.get('*',function(req,res)
{
	res.sendFile(path.join(__dirname+'/public/app/views/home.html'));
});
app.listen(process.env.DB_PORT);
console.log('server is running '+process.env.DB_PORT);