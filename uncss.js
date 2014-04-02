var fs = require('fs');
var uncss = require('uncss');

var files = ['./index.html'],
    options = {
      stylesheets: ['stylesheet.css']
    };

var removeUnuseCSS = uncss(files, options, function (err, css) {
  fs.writeFile('un.css', css, function (err) {
    console.log('saved un.css');
  });
});

