
var express = require('express')
var stormpath = require('express-stormpath')
var bodyParser = require('body-parser')
var api_keys = require('./keys')
var fs = require('fs')

var app = express();

var dayId = new Date().getDay()
var pathToImg = '/Users/dawnk/Desktop/ESK-backend/images/' + dayId

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use(stormpath.init(app, {
    client: {
        apiKey: {
            file: './config/.stormpath/apikey.properties'
        }
    },
    application: {
        href: 'https://api.stormpath.com/v1/applications/6RtFRJ7nOjU2QeJbiivtNl'
    },
    expand: {
        customData: true,
    },
    web: {
        produces: ['application/json']
    }
}))

// Returns the good image according to difficulty
app.get('/images/:difficulty', function(req,res) {
    var difficulty = req.params.difficulty

    if(difficulty == "beginner")
        res.sendFile(pathToImg + '/beginner.png')
    else if(difficulty == "intermediate")
        res.sendFile(pathToImg + '/intermediate.png')
    else if(difficulty == "advanced")
        res.sendFile(pathToImg + '/advanced.png')
})

// Returns the sources of the images
app.get('/images/source', function(req, res) {
    var source = require('./images/' + dayId + '/source.json')
    res.json(source)
})

// Returns the latest comments about today's sketch 
app.post('/comments', stormpath.apiAuthenticationRequired, function(req, res) {
    if(!req.body.comments || typeof req.body.comments != "string") {
        res.status(400).send("400 Bad Request")
    }

    req.user.customData.comments = req.body.comments
    req.user.customData.help = req.body.help
    req.user.customData.save()
    res.status(200).end()
})

app.listen(3000);
