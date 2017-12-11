'use strict';

const config = {
	assets: {
		'app.css': [
			'+src/assets/css/example/variables.scss',
			'+src/assets/css/example/mixins.scss',
			'src/assets/css/example/reset.css',
			'src/assets/css/basic.scss',
			'src/patterns/**/css/*.scss',
			'src/patterns/**/css/modifier/*.scss',
		],
		'app.js': [
			'node_modules/babel-polyfill/dist/polyfill.min.js',
			'node_modules/jquery/dist/jquery.min.js',
			'node_modules/terrific/dist/terrific.min.js',
			'src/assets/js/*.js',
			'src/patterns/**/js/*.js',
			'src/patterns/**/js/decorator/*.js',
		],
	},
};

module.exports = config.assets;
