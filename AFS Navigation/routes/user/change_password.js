var connection = require('./../../model/config');
var utils = require('./../../model/util.js');  
var express = require('express');
var router = express.Router();

router.get('/changePassword',function(err,data)
{
	console.log('changePassword calling');
/*		var emailId={

			"email_id":req.body.email_id
		}
		
	utils.changePassword(emailId,connection,function(err,data)
	{
		if(err)
		{
			res.json(err);
		}
		else
		{
			res.json(data);
		}
	})*/

});

module.exports = router;