Mech = require('../mech.coffee')

describe 'A Mech', ->
  it 'Should be a valid design', ->
    base =
      base: 'Inner Sphere'
      omni: false
      weight: 55
      chassis: 'Humanoid'

    mech = new Mech(base)
    expect(mech.validBase()).toEqual(true)
    expect(mech.validOmni()).toEqual(true)
    expect(mech.validWeight()).toEqual(true)
    expect(mech.validChassis()).toEqual(true)
    expect(mech.valid()).toEqual(true)

  # mildly redundant, but has more detail
  it 'Must have a valid weight', ->
    lightMech = new Mech({weight: 20})
    assaultMech = new Mech({weight: 100})
    invalidMech = new Mech({weight: 200})
    otherInvalidMech = new Mech({weight: 10})

    expect(lightMech.validWeight()).toBe(true)
    expect(assaultMech.validWeight()).toBe(true)
    expect(invalidMech.validWeight()).toBe(false)
    expect(otherInvalidMech.validWeight()).toBe(false)

  it 'Must have a weight which is a factor of 5', ->
    invalidMech = new Mech({weight: 33})
    expect(invalidMech.validWeight()).toBe(false)
