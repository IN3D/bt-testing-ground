//import _ from 'lodash'
var _ = require('lodash')


export class Mech {
  constructor(data) {
    this.base = data.base
    this.omni = data.omni
    this.weight = data.weight
    this.chassis = data.chassis
  }
  valid() {
    this.validBase() &&
    this.validOmni() &&
    this.validWeight() &&
    this.validChassis()
  }
  validBase() {
    return !_.isEmpty(this.base) &&
      this.base === 'Inner Sphere' ||
      this.base === 'Clan'
  }
  validOmni() {
    return _.isBoolean(this.omni)
  }
  validWeight() {
    this.weight >= 20 && this.weight <= 100
  }
  validChassis() {
    this.chassis === 'Humanoid' || this.chassis === 'Quad'
  }
}
