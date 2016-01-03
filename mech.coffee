_ = require('lodash')
Engine = require('./engine.coffee')

class Mech
  constructor: (data)->
    @base = data.base
    @omni = data.omni
    @weight = data.weight
    @chassis = data.chassis
    @walk = data.walk
    @run = _.ceil(data.walk * 1.5)
    @engine = new Engine(data)

  valid: ->
    (@validBase() and
     @validOmni() and
     @validWeight() and
     @validChassis() and
     _.isObject(@engine))
  validBase: ->
    not _.isEmpty(@base) and @base == 'Inner Sphere' or @base == 'Clan'
  validOmni: -> _.isBoolean(@omni)
  validWeight:-> @weight >= 20 and @weight <= 100 and @weight % 5 == 0
  validChassis: -> @chassis == 'Humanoid' or @chassis == 'Quad'

module.exports = Mech
