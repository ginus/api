module.exports=(opt1,opt2)->
  rtn={}
  for key, value of opt1
    rtn[key]=value
  for key, value of opt2
    rtn[key]=value
  return rtn
