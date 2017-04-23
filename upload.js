let config = require('upload-config.js');
var tumblr = require('tumblr.js');
var client = tumblr.createClient(config.auth);

var fs = require('fs');
var path = require('path')

var upload_photo = function(fn) {
	console.log('uploading ' + fn);

	var fullpath = fn;

	client.photo(config.blogname, {
		state: 'published',
		tags: config.tags,
		data: fullpath
	}, function(err) {
		if (err) {
			console.log(err);
			process.exit(1);
		}
	});
}

if (process.argv.length > 2 && path.extname(process.argv[2]).toLowerCase() == '.jpg')
	upload_photo(process.argv[2]);
