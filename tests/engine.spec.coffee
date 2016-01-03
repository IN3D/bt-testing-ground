Engine = require('../engine.coffee')

describe 'An Engine', ->
  it 'Should have a type', ->
    engine = new Engine({type: 'standard'})
    expect(engine.type).toBe('standard')

  it 'Should produce the correct rating', ->
    engine = new Engine({tonnage: 25, walk: 8})
    engine2 = new Engine({tonnage: 95, walk: 4})
    expect(engine.rating).toBe(200)
    expect(engine2.rating).toBe(380)
    expect(engine._engineWeight['ICE'].length).toBe(79)
