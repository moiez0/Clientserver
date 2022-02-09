const WebSocket = require('ws')
const wss = new WebSocket.Server({ port: 8080 })

wss.on('connection', ws => {
  ws.on('message', message => {
    console.log(`Data sent => ${message}`)
  })
  ws.send('connected!')
})

console.log("Connection opened.")

const express = require("express");
const nunjucks = require('nunjucks')

const app = express()
const fs = require('fs').promises;
const port = 8000;

nunjucks.configure('pages', {
  autoescape: true,
  express: app
})

app.set('trust proxy', '127.0.0.1')
app.set('view engine', '.njk')
app.get('/', (req, res) => {
   res.render('main.njk')
})

app.use(express.static(__dirname+'/static'))

app.get('*',async function(req,res){
  res.send("That page does not exist idiot...")
})


app.listen(port, () => {
    console.log(`Clientserver opened`);
    console.log("Everything up and running!")
    console.warn("Do not close this, doing so will result in disconnection between the script and external UI.")
    console.log(`                                                                   
    started                                                                                                                                                                                                           
    `);
});


