Engine = require('../engine.coffee')

describe 'An Engine', ->
  it 'should have a type', ->
    engine = new Engine({type: 'Standard'})
    expect(engine.type).toBe('Standard')

  it 'should produce the correct rating', ->
    engine = new Engine({tonnage: 25, walk: 8})
    engine2 = new Engine({tonnage: 95, walk: 4})
    expect(engine.rating).toBe(200)
    expect(engine2.rating).toBe(380)

  it 'should have correct lookup tables', ->
    engine = new Engine({tonnage: 25, walk: 8, type: 'Standard'})
    expect(engine.weight).toBe(8.5)
