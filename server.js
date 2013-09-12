var fs = require("fs"),
	cnf = JSON.parse(fs.readFileSync("config.json")),
	express = require("express"),
	app = express();


app.use(app.router);
app.use(express.static(__dirname + "/public"));

app.get("/", function(req, res){
	res.send("root of the server");
});


app.listen( cnf.port, cnf.host );
console.log("server started at: " + cnf.host + ":" + cnf.port +" ...");