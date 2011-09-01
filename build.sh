#!/bin/bash

# generate files from templates
coffee exposeSetup.coffee

# generate the html and javascript file
jade index.jade
coffee -c expose.coffee

# move to the folder where it is accessible on web
mv index.html static/
mv expose.js static/

# run the server
#coffee app.coffee

