const verifyToken = require('./verifyToken');
var connection = require('./../../model/config');
var express = require('express');
var router = express.Router();
var utils = require('./../../model/util.js'); 
var jwt=require('jsonwebtoken');
//var secret='harrypotter';
global.config = require('./../../model/secret_code');

var token;
router.get('/add',function(req,res)
{
	
	//console.log(utils.add(10, 10));   	
	//console.log(utils.setUserMaster(10, 10));   	
	// res.json({'result':utils.add(10,10)});
	var result = utils.add(10,10);
	
  	res.json({'output':result});
  	
  
});

router.get('/sub',function(req,res)
{
	
	//console.log(utils.add(10, 10));   	
	//console.log(utils.setUserMaster(10, 10));   	
	// res.json({'result':utils.add(10,10)});
	var result = utils.sub(10,10);
	
  	res.json({'output':result});
  	
  
});
router.post('/user',function(req,res)
{

		//var today = new Date();
		var  today='2018-03-07 14:16:01';
    	var pass='123456';
		var userMaster={
        "country_code":req.body.country_code,
        "state_code":req.body.state_code,
        "first_name":req.body.first_name,
        "last_name":req.body.last_name,
        "address1":req.body.address1,
        "address2":req.body.address2,
        "address3":req.body.address3,
        "city":req.body.city,
        "postal_code":req.body.postal_code,
        "dob":req.body.dob,
        "anniversary":req.body.anniversary,
        "mobile_no":req.body.mobile_no,
        "landline_no":req.body.landline_no,
        "email_id":req.body.email_id,
        "password":pass,
        "active":req.body.active,
        "created_on":today,
        "updated_on":today,
        "created_by":'admin',
        "updated_by":'admin'
    }

    try{
	var result=utils.setUserMaster(userMaster,connection,function(err,data)
        {
            if(err)
                {
                     res.json({
                     success:false,
                     message:'Duplicate value found' })
                }
             else
                {
                    res.json({
                    success:true,
                    message:'Country Inserted sucessfully'
                    })
                }
        });
        }
        catch(ex)
        {
                   console.log('error');
        }
});


router.post('/getUser',function(req,res)
{
    var userEmail={
        "email_id":req.body.email_id,
        "password":req.body.password
    }
   var result=utils.showUserMaster(userEmail,connection,function(err,data)
    {
        if(err)
           {
           // res.json(err);
          //  console.log('err read',err);
               /*   res.json({
                    success:false,
                    message:'Login fail'
                    })*/
                    if(req.body.email_id==null||req.body.email_id==''||req.body.password==null||req.body.password==''){
                                res.json({
                                success:false,    
                                message:"Email does not exits"

                            });
                    }
                    else{

                          if(req.body.password==err[0].password){
                          var first_name=err[0].first_name;
                          var role=err[0].role;

                          token=jwt.sign({first_name,role},global.config.secret,{expiresIn: '24h'});
                            res.json({
                              success:true,
                              data:err,
                              message:'successfully authenticated',token:token
                            })
                            //var today=new Date();
                            if(err[0].role==null||err[0].role=='')
                            {
                              res.json({
                                    success:false,
                                    message:'Role is not define'
                                    });
                            }
                            else{
                            var today='2018-03-07 14:16:03';
                            var loginData={
                              "user_code":err[0].user_code,
                              "login_time":today
                            }

                            var result = utils.updateLoginTime(loginData,connection,function(err,data)
                              {
                                if(err)
                                {
                                  res.json({
                                    success:false,
                                    message:'Email and password field canot be empty'
                                    });
                                }
                                else{
                                  res.json(data);
                                }
                              });
                            //console.log(result);
                         }
                      }else{
                            res.json({
                              success:false,
                              message:"Email, password and Role does not match"
                            });
                        }
                        }

                 }
              else
              {
                  

                  //res.send(data);
                  console.log('data is read=',data);

              }

    });
    //res.status(200).send({ auth: true, token: token });
});

 router.use(function(req,res,next)
  {
    token=req.body.token||req.body.query||req.headers['x-access-token'];

    if(token)
    {
      jwt.verify(token,global.config.secret,function(err,decoded)
        {
          if(err)
          {
            console.log('invalid');
            res.json({success:false,message:'token invalid'});
          }
          else
          {
            req.decoded=decoded;
            next();
          }
        });
    }
    else{
      res.json({success:false,message:'no token provided'});
     //res.json(err);
    }
  });
  router.post('/me',function(req,res)
  {
    res.send(req.decoded);
  });

 
module.exports = router;

