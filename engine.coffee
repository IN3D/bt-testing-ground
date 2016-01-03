_ = require('lodash')
EngineLookUp = require('./engineLookup.coffee')

class Engine
  constructor: (data) ->
    @type = data.type || 'Standard'
    @rating = _.parseInt(data.weight * data.walk)
    @weight = EngineLookUp.weight(@type, @rating)

module.exports = Engine
