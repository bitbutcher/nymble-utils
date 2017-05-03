{ deburr, kebabCase } = require 'lodash'

list_with = (conjunction) -> (head..., tail) ->
  return "'#{tail}'" unless head.length
  head = ( "'#{option}'" for option in head )
  "#{head.join ', '} #{conjunction} '#{tail}'"

criteria_for = list_with 'and'

options_for = list_with 'or'

searchify = (string) ->
  return '' unless string?
  deburr(string).replace(/\s+/g, ' ').toLowerCase()

slugify = (string) ->
  return '' unless string?
  kebabCase deburr(string).replace /\W+/g, ' '

tagify = (string) ->
  return '' unless string?
  deburr(string).replace(/\W+/g, ' ').toLowerCase()

module.exports = { criteria_for, options_for, searchify, slugify, tagify }
