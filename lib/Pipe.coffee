# Pipe.coffee
#
#	© 2013 Dave Goehrig <dave@dloh.org>
#

Pipe = () ->
	self = this
	id = "#pipe.#{process.id}@#{os.hostname()}"
	self.send [ "pipe", id ], "pipes", "announce"
	self['.filter'] = (x) -> x	# the default filter is a no-op
	self[id]= (code...) ->
		console.log "got #{ JSON.stringify(code) }"
		self[".filter"] = Function.prototype.constructor.apply(self,code)
		console.log "Filtering with #{ self[".filter"] }"
	self["*"] = (message...) ->
		value = self['.filter'].apply(self,message)
		console.log "Sending #{JSON.stringify(value)} to #{self.dest}/#{self.key}"
		self.send value, self.dest, self.key

module.exports = Pipe
