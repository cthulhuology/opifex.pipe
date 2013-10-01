Opifex.pipe
=================

A dynamically reconfigurable pipe


Getting Started:
----------------

You can start up an opifex.pipe as follows

	opifex 'amqp://guest:guest@localhost:5672//rss-out/#/pipe-in/pipe-out/rss' pipe

This will send everything on the rss-out exchange to the pipe-in queue, and then the pipe will pipe it out with a routing key of rss

By default every message is routed to the destination exchange, such as the pipe-out exchange in the example above.  It is possible,
however, to add a transform functionality to the pipe at run time.

	[ <pipe id>, <arguments>...,  <function body> ]

Which will add a filter to the pipe which will execute on every incoming message (with the exception of those with the explicit id of the pipe).

Upon startup the pipe will announce it's UUID, which is valid for only that process to the "pipes" exchange and to the console.



