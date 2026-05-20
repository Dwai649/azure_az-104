var express = require("express");
var bodyParser = require("body-parser");

var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.listen(49146, () => {
    console.log("Server running on port 49146");
});

app.get('/', (request, response) => {
    response.send("Hello World");
});
