delegate = require 'url'
{ endsWith } = require 'lodash'

local = (uri) ->
  uri.hostname in ['localhost', '127.0.0.1'] or endsWith(uri.hostname, '.local')

module.exports =

  local: local

  parse: (string) ->
    uri = delegate.parse string
    [ uri.pathname, uri.fragment ] = uri.pathname.split ';' if uri.pathname?
    [ uri.query, uri.fragment ] = uri.query.split ';' if uri.query?
    uri.scheme = uri.protocol[0..-2] if uri.protocol?
    uri.local = local uri
    uri

  resolve: delegate.resolve

  format: delegate.format
