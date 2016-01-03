_ = require('lodash')
EngineLookUp = require('./engineLookup.coffee')

class Engine
  constructor: (data) ->
    @type = data.type || 'Standard'
    @rating = _.parseInt(data.tonnage * data.walk)
    @weight = EngineLookUp.weight(@type, @rating)

module.exports = Engine
