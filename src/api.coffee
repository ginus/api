###
api负责发送请求
###
querystring = require 'querystring'
mergeOptions  = require './mergeOptions'
requestBuilder = require './requestBuilder'
class Api
  request=undefined
  constructor: (useHttps,host,base) ->
    @https=useHttps
    request=requestBuilder useHttps
    @options=
      host:host
    @baseUrl=base

  setHeader:(headers)->
    @options.headers=headers
    return @

  get:(path,query)->
    if typeof path is 'object'
      query=path
      path=''
    query=if query then '?'+querystring.stringify(query) else ''
    request mergeOptions @options,
      method:'GET'
      path:@baseUrl+path+query

  post:(path,body)->
    if typeof path is 'object'
      body=path
      path=''
    body=querystring.stringify(body)
    headers=
      'Content-Type':'application/x-www-form-urlencoded'
      'Content-Length':body.length
    if @options.headers
      headers=mergeOptions @options.headers,headers
    options=mergeOptions @options,
      method:'POST'
      path:@baseUrl+path
      headers:headers

    request options,body

module.exports=Api
