###
api工厂
使用混入模式组装需要的类，并返回实例
###
url = require 'url'
module.exports=apiClient=(href,mixins={})->
  urlObj=url.parse href
  useHttps=urlObj.protocol is 'https:'
  host=urlObj.host
  base=urlObj.pathname
  Api = require './api'
  for name of mixins
    mixin=require "./#{name}"
    mixin(Api,mixins[name])
  return new Api(useHttps,host,base)
