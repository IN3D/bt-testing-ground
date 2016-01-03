_ = require('lodash')

class Mech
  constructor: (data)->
    @base = data.base # TODO: misnomer?
    @omni = data.omni
    @weight = data.weight
    @chassis = data.chassis

  valid: ->
    (@validBase() and
     @validOmni() and
     @validWeight() and
     @validChassis())
  validBase: ->
    not _.isEmpty(@base) and @base == 'Inner Sphere' or @base == 'Clan'
  validOmni: -> _.isBoolean(@omni)
  validWeight:-> @weight >= 20 and @weight <= 100 and @weight % 5 == 0
  validChassis: -> @chassis == 'Humanoid' or @chassis == 'Quad'

module.exports = Mech
