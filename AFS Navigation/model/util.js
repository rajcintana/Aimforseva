
var utils = {  
  add: function (a, b) {
    return a + b;
  },
  sub: function(a,b){
    var val=a-b;
  	return val;
  },
  setUserMaster: function(userMaster,connection,callback)
  {
  	//return country;
    //console.log(userMaster);
  	var sql='call sp_user_master('+"'"+JSON.stringify(userMaster)+"',"+"'Insert',"+"000"+')';///this is store procedure to store the data by using into the json format
  	connection.query(sql,function (error, results, fields) {
      if (error) {
        
        callback(error);

      }
      else
      {
        callback(null,results[0]);
      }
    });
  },	
  showUserMaster: function(userEmail,connection,callback)
  {
    //return country;
    
    var sql='call sp_user_master('+"'"+JSON.stringify(userEmail)+"',"+"'Select',"+"000"+')';
    connection.query(sql,function (error, results, fields) {
      if (error) {
        console.log(error);
       callback(error,null);      
     }
     else
     {
      //console.log(results[0],null);
      callback(results[0],null);
      
    }
    });
  },
  updateLoginTime: function(loginData,connection,callback)
  {
    var sql='call sp_login_master('+"'"+JSON.stringify(loginData)+"',"+"1,"+"000"+')';
   
    connection.query(sql,function (error, results, fields) {
      if (error) {
          callback(error);
         }
     else
     {
      //var val=results.toString();
       callback(results[0]);
      
      
    }
    });
  },
  changePassword:function(emailId,connection,callback)
  {
    var sql='call sp_change_password('+"'"+JSON.stringify(emailId)+"',"+"1,"+"000"+')';
    connection.query(sql,function (error, results, fields) {
      if (error) {
          callback(error);
         }
     else
     {
      //var val=results.toString();
       callback(results[0]);
      
      
    }
    });
  },
  /////////////////////////////////start///////////////////////////////////////////////////
  invokeAllCountryMaster: function(flag,connection,callback)
  {
     var sql='call sp_all_country('+"'"+JSON.stringify({})+"',"+flag+')';
      connection.query(sql,function (error, results) {
        if(error) {
         callback(error,null);
       }else{
       callback(null,results[0]);
      }
      
  });        
  },
  invokeCountryMaster : function(country_code,flag,connection,mycallback)
  { 

      var sql='call sp_country_master('+"'"+JSON.stringify({})+"',"+flag+","+country_code+')';
      connection.query(sql,function (error, results) {
        if(error) {
         mycallback(error,null);
       }else{
       mycallback(null,results[0]);
      }
      
  });                                                 
},
 invokeCountryMasterInsert : function(country_master,country_code,flag,connection,mycallback)
{ 
     
      var sql='call sp_country_master('+"'"+JSON.stringify(country_master)+"',"+flag+","+country_code+')';
      
      connection.query(sql,function (error, results) {
        if(error) {
         mycallback(error);
       }else{
       mycallback(null,results[0]);
      }
      
  });                                                 
},


//end of utils
//end by rajesh kumar ranjan (t0007)

invokeStateMaster : function(state_code,flag,connection,mycallback)
{ 

      var sql='call sp_state_master('+"'"+JSON.stringify({})+"',"+flag+","+country_code+')';
      connection.query(sql,function (error, results) {
        if(error) {
         mycallback(error,null);
       }else{
       mycallback(null,results[0]);
      }
      
  });                                                 
},

invokeStateMasterInsert : function(state_master,state_code,flag,connection,mycallback)
{ 
     
      var sql='call sp_state_master('+"'"+JSON.stringify(state_master)+"',"+flag+","+state_code+')';
      connection.query(sql,function (error, results) {
        if(error) {
         mycallback(error);
       }else{
       mycallback(null,results[0]);
      }
      
  });                                                 
},
invokeStateMaster : function(state_code,flag,connection,mycallback)
{ 
     
      var sql='call sp_state_master('+"'"+JSON.stringify({})+"',"+flag+","+state_code+')';
      connection.query(sql,function (error, results) {
        if(error) {
         mycallback(error);
       }else{
       mycallback(null,results[0]);
      }
      
  });                                                 
},

  ////////////////////////////////////////////////////////////////////////////////////

}
module.exports = utils;  