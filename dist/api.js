
/*
api负责发送请求
 */
var Api, mergeOptions, querystring, requestBuilder;

querystring = require('querystring');

mergeOptions = require('./mergeOptions');

requestBuilder = require('./requestBuilder');

Api = (function() {
  var request;

  request = void 0;

  function Api(useHttps, host, base) {
    this.https = useHttps;
    request = requestBuilder(useHttps);
    this.options = {
      host: host
    };
    this.baseUrl = base;
  }

  Api.prototype.setHeader = function(headers) {
    this.options.headers = headers;
    return this;
  };

  Api.prototype.get = function(path, query) {
    if (typeof path === 'object') {
      query = path;
      path = '';
    }
    query = query ? '?' + querystring.stringify(query) : '';
    return request(mergeOptions(this.options, {
      method: 'GET',
      path: this.baseUrl + path + query
    }));
  };

  Api.prototype.post = function(path, body) {
    var headers, options;
    if (typeof path === 'object') {
      body = path;
      path = '';
    }
    body = querystring.stringify(body);
    headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Content-Length': body.length
    };
    if (this.options.headers) {
      headers = mergeOptions(this.options.headers, headers);
    }
    options = mergeOptions(this.options, {
      method: 'POST',
      path: this.baseUrl + path,
      headers: headers
    });
    return this.request(options, body);
  };

  return Api;

})();

module.exports = Api;
