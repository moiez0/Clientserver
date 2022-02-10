"use strict";

const serverPort = 8080,
    http = require("http"),
    express = require("express"),
    app = express(),
    server = http.createServer(app),
    WebSocket = require("ws"),
    websocketServer = new WebSocket.Server({ server });

//when a websocket connection is established
websocketServer.on('connection', (webSocketClient) => {
    //send feedback to the incoming connection
    webSocketClient.send('{ "connection" : "ok"}');
    
    //when a message is received
    webSocketClient.on('message', (message) => {

        //for each websocket client
        websocketServer
        .client
        .forEach( client => {
            //send the client the current message
            client.send(`${message}`);
        });
    });
});

//start the web server
server.listen(serverPort, () => {
    console.log(`Websocket server started on port ` + serverPort);
});


const port = process.env.PORT || 3000
const bodyParser = require("body-parser");
const fs = require("fs");

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use(express.static("public"))
app.use(express.static("node_modules"))

app.get('/', (a, b) => {
  fs.createReadStream("public/index.html").pipe(b)
});

app.listen(port, () => {
  console.log(`Clientserver has opened on http://localhost:${port}`);
  console.log("Everything up and running!")
  console.warn("Do not close this, doing so will result in disconnection between the script and external UI.")
  console.log(`
                                                                           
 
                                                                                                  
                                                                                                                                                                                                                         
  `);
});