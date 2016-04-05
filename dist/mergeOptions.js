module.exports = function(opt1, opt2) {
  var key, rtn, value;
  rtn = {};
  for (key in opt1) {
    value = opt1[key];
    rtn[key] = value;
  }
  for (key in opt2) {
    value = opt2[key];
    rtn[key] = value;
  }
  return rtn;
};
