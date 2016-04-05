module.exports=(https)->
  if https
    request=require('https').request
  else
    request=require('http').request
  (options,body)->
    new Promise (resolve,reject)->
      req=request options,(res)->
        data=''
        res.on 'data',(chunk)->data+=chunk
        res.on 'end',->resolve data
      req.on 'error',(err)->reject err
      req.write body if body
      req.end()
