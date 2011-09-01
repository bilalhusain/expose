fs = require 'fs'
exposeConfig = require './exposeConfig'

# expose.coffee
content = fs.readFileSync('./templates/expose.coffee.template').toString()
editReplacementArray = new Array()
editReplacementArray.push("#{item}: $('#edit-input-#{item}')[0].value") for item in exposeConfig.edit
editReplacement = '{' + editReplacementArray.join(', ') + '}'
content = content.replace /{{EDIT_TEMPLATE}}/, editReplacement.replace(/\$/g, '$$$$')
fs.writeFileSync './expose.coffee', content
console.log '[GENERATED] expose.coffee'

# app.coffee
content = fs.readFileSync('./templates/app.coffee.template').toString()
listReplacement = ''
listReplacement += ", '#{item}'" for item in exposeConfig.list
editReplacement = ''
editReplacement += ", '#{item}'" for item in exposeConfig.edit
content = content.replace /{{LIST_TEMPLATE}}/, listReplacement.replace(/\$/g, '$$$$')
content = content.replace /{{EDIT_TEMPLATE}}/, editReplacement.replace(/\$/g, '$$$$')
content = content.replace /{{COLLECTION}}/g, exposeConfig.collection.replace(/\$/g, '$$$$')
fs.writeFileSync './app.coffee', content
console.log '[GENERATED] app.coffee'

# index.jade
content = fs.readFileSync('./templates/index.jade.template').toString()
listReplacement = ''
listReplacement += "<div><%= #{item} %></div>" for item in exposeConfig.list
editReplacement = ''
editReplacement += "<input id='edit-input-#{item}' type='text' value='<%= #{item} %>'></input>" for item in exposeConfig.edit
content = content.replace /{{LIST_TEMPLATE}}/, listReplacement.replace(/\$/g, '$$$$')
content = content.replace /{{EDIT_TEMPLATE}}/, editReplacement.replace(/\$/g, '$$$$')
fs.writeFileSync './index.jade', content
console.log '[GENERATED] index.jade'

