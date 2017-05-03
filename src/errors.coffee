{ isPlainObject } = require 'lodash'

module.exports =
  
  normalize: (errs) ->
    errs = global: errs unless isPlainObject errs
    errors = {}
    for key, value of errs
      value = errors: value unless isPlainObject value
      value.errors = [].concat value.errors
      errors[key] = value
    errors
