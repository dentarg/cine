# film.dn.se wrapper

### Set environment variables

	RACK_ENV
	PORT
	sessionid

### Start

	foreman start

### Deploy

	git push heroku
	heroku config:set sessionid=xxx
