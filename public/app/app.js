//console.log('testing the app file');
angular.module('userApp',['appRoutes','mainController','authServices','usermasterctrl','countryMasterServices','countrymasterctrl', 'angularUtils.directives.dirPagination'])
.config(function($httpProvider)
{
	$httpProvider.interceptors.push('AuthInterceptors');
	//$httpProvider.responseInterceptors.push('AuthInterceptors');
});

/*
Guidelines for Comments

Header comments for the Files
*/
/****************************************************/

// Filename : app.js.*

//Purpose /Functionality: this file is used to store all the controller,app, services and header also
						  

// Author : Rajesh kumar ranjan(id:T0007)

// Createdon: 17-feb-1018

// Change history:

// v1.10 date of change /Author name

/****************************************************/
/*
Block level Comments:

Block comments to document a method
*/

/**

* Author : Rajesh Kumar Ranjan(T0007) , Created on:17-feb-2018 , Purpose:
* @param
       
* @return

* Change history

: **/