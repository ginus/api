
/*
api工厂
使用混入模式组装需要的类，并返回实例
 */
var apiClient, url;

url = require('url');

module.exports = apiClient = function(href, mixins) {
  var Api, base, host, mixin, name, urlObj, useHttps;
  if (mixins == null) {
    mixins = {};
  }
  urlObj = url.parse(href);
  useHttps = urlObj.protocol === 'https:';
  host = urlObj.host;
  base = urlObj.pathname;
  Api = require('./api');
  for (name in mixins) {
    mixin = require("./" + name);
    mixin(Api, mixins[name]);
  }
  return new Api(useHttps, host, base);
};
