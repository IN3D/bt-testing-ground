_ = require('lodash')

class Engine
  constructor: (data) ->
    @type = data.type
    @rating = _.parseInt(data.tonnage * data.walk)
    # This is a horrible lookup table, formulas are not know,
    # I would replace this if I could
    @_engineWeight =
      ICE: [1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4, 4, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8
       9, 9, 10, 10, 11, 11, 12, 12, 12, 14, 14, 15, 15, 16, 17, 17, 18, 19, 20,
       20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 31, 32, 33, 35, 36, 38, 39, 41,
       43, 45, 47, 49, 51, 54, 57, 59, 63, 66, 69, 73, 77, 82, 87, 92, 98, 105
      ]
      Cell: 1
      Fission: 1
      Compact: 1
      Standard: 1
      Light: 1
      XL: 1

module.exports = Engine
