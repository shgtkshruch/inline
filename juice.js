var fs = require('fs');
var juice = require('juice');

juice('./index.html', function(err, html){
  fs.writeFile('inline.html', html, function (err) {
    console.log('saved inline.html');
  });
});

