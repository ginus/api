module.exports = function(https) {
  var request;
  if (https) {
    request = require('https').request;
  } else {
    request = require('http').request;
  }
  return function(options, body) {
    return new Promise(function(resolve, reject) {
      var req;
      req = request(options, function(res) {
        var data;
        data = '';
        res.on('data', function(chunk) {
          return data += chunk;
        });
        return res.on('end', function() {
          return resolve(data);
        });
      });
      req.on('error', function(err) {
        return reject(err);
      });
      if (body) {
        req.write(body);
      }
      return req.end();
    });
  };
};
