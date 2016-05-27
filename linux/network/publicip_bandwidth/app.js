var request = require('request');
var speedTest = require("speedtest-net");

var today = new Date();
var date = today.getFullYear().toString() + '/'+ (today.getMonth()+1).toString() + '/'+ today.getDate().toString() +' '+  today.toLocaleTimeString();
var speeds = speedtest();

function speedtest(){
	console.log("Launching SpeedTest, wait a moment ... ");
	test = speedTest({maxTime : 20000});
	test.on('data',function(data){
		requester(data);
	});
	test.on('error',function(err){
		console.log(err);
	});
}

function requester(data){
	console.log(data);
	request({
		url : 'https://sheetsu.com/apis/<API_KEY>',
		method : 'POST',
		headers : {
			'Conten-Type' : 'application/json'
			},
		json : {
			"date": date ,
			"ip": data.client.ip,
			"ping" : data.server.ping,
			"download" : data.speeds.download,
			"upload" : data.speeds.upload,
			"device" : "Raspberry PI",
			"location" : "Home",
 			}
		}, function(error, reponse, body){
			if(error){
				console.log(error);
			} else {
				console.log(reponse.statusCode, body);
			}
	});
};	

