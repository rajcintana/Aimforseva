/*
Guidelines for Comments

Header comments for the Files
*/
/****************************************************/

// Filename : countryMasterCtrls.*

//Purpose /Functionality: it is a controller file of country_master file that is placed in the model for of app
						  //it is a angular file and it have a controller(countryCtrl)
						  //controller :countryCtrl
						  //app  :countrymasterctrl
						  //pagination path :angularUtils.directives.dirPagination

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
       $http : it take the rest api
       $state : it is use to open the new file or go to the new page 
       $timeout: it is use for timeing
       $scope :services 
       this all are the services
* @return

* Change history

: **/


angular.module('countrymasterctrl',['angularUtils.directives.dirPagination','commonServices'])
.controller('countryCtrl',function($http,$state,$timeout,$scope,Country)
{
	var app=this;
$scope.enabledEdit =[];
	$scope.editCountry = function(index){
		$scope.enabledEdit[index] = true;
	}
	////// fetch the all record from database useing the rest api call the country_master.js file from model folder
var refresh=function()
{
	$scope.countryMaster = []; //declare an empty array
	$http.get("/getCountryList").then(function successCallback(response){ 
		$scope.countryMaster = response.data;
	});
	$scope.sort = function(keyname){
		$scope.sortKey = keyname;   //set the sortKey to the param passed
		$scope.reverse = !$scope.reverse; //if true make it false and vice versa
	}
};
var allCountry=function()
{
	$scope.allCountryMaster = []; //declare an empty array
	$http.get("/allCountryList").then(function successCallback(response){ 
		$scope.allCountryMaster = response.data; 
	});
}
	refresh();//calling function
	allCountry();
	//save the record in the database
	// regData parameter is used to collect data from html page
	$scope.setCountryMaster=function(regData)
	{
		var url='insertCountry';
//swal : it is a npm for pop messaging
				swal({
				  title: "Are you sure you want to save ?",
				  icon: "success",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willSave) => {
				  if (willSave) {
				  	//rest api calling the webservices
				  	Country.create(regData,url).then (function(data)
						{
							if(data.data.success)
							{
								$timeout(function()
									{
										$state.go('home.countryMaster');
									},2000)	
								swal("Poof! Your record has been save!", {
							      icon: "success",
							    });
							    refresh();
							}
							else
							{
								swal("Poof! Please check Country or State already available !", {
							      icon: "warning",
							    });
							}
						});
				  } else {
						 swal({
							  title: "Not save!",
							  text: "You clicked the button!",
							  icon: "warning",
							  button: "ok!",
						});
				  }
				});	
	}
	$scope.update=function(user)
	{
		swal({
		  title: "Are you sure?",
		  text: "you want to udpate this record !",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willUpdate) => {
		if (willUpdate) {
		  		url='updateCountryListById';
				Country.updateRecord(user,user.country_code,url).then (function(data){
  				refresh();
  		});
		swal("Poof! Your record has been updated!", {
		      icon: "success",
		    });
		  } else {
		    swal("Your record is safe!");
		  }
		}); 
	}
	////////////////delete///////////////
	$scope.remove = function(country_code) {
  	console.log(country_code);
		swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this record !",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		  		$http.delete('deleteCountryListById/' + country_code).then(function successCallback(response) {
		    		refresh();
		  		});
		    swal("Poof! Your record has been deleted!", {
		      icon: "success",


		    });
		  } else {
		    swal("Your record is safe!");
		  }
		});  	  
	}

	////////////////end of delete.////////////
});