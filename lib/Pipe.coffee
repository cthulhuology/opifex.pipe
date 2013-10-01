# Pipe.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

os = require 'os'

Pipe = () ->
	id = "pipe.#{process.pid}@#{os.hostname()}"
	console.log "#{id}"
	this['.filter'] = (x...) -> x	# the default filter is a no-op
	this[id] = (code...) ->
		this[".filter"] = Function.prototype.constructor.apply(this,code)
	this["*"] = (message...) ->
		value = this['.filter'].apply(this,message)
		this.send value, this.dest, this.key

module.exports = Pipe
