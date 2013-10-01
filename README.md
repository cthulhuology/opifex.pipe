Opifex.pipe
=================

A dynamically reconfigurable pipe


Getting Started:
----------------

You can start up an opifex.pipe as follows

	opifex 'amqp://guest:guest@localhost:5672//rss-out/#/pipe-in/pipe-out/' pipe

This will send everything on the rss-out exchange to the pipe-in queue, and then the pipe will pipe it out preserving the incoming routing key.

By default every message is routed to the destination exchange, such as the pipe-out exchange in the example above.  It is possible,
however, to add a transform functionality to the pipe at run time.

	[ <pipe id>, <arguments>...,  <function body> ]

Which will add a filter to the pipe which will execute on every incoming message (with the exception of those with the explicit id of the pipe).

Upon startup the pipe will announce it's UUID to the console.

For example, given pipe with id "pipe.83059@Dave-Goehrigs-MacBook-Pro.local":

	[ "pipe.83059@Dave-Goehrigs-MacBook-Pro.local", "x", "y", "if (x == 'shout') return [ x, y.toUpperCase() ]; return [x,y]"]

Will cause it to filter messages of the form:

	[ "shout", "I like cheese!"] -> [ "shout, "I LIKE CHEESE!" ]

and
	[ "say", "I like cheese!" ] -> [ "say", "I like cheese!" ]

These transformations can be arbitrary, but will send a value for each message even if that value is 'undefined'.

