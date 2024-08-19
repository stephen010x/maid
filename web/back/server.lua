-- documentation:
-- https://lunarmodules.github.io/luasocket/socket.html

local address = * -- binds to all local interfaces
local port = 8081
local backlog = 32
--local MAX_CLIENTS = 1024

-- requires and initilizes lanes
--local lanes = require("lanes").configure()
--local linda = lanes.linda()
-- fork of socket that is compatable with lanes
local socket = require("socket-lanes")
local io = require("io")

local server, err = socket.bind(address, port, backlog)
assert(server, err)

ok, err = server:listen(backlog)
assert(ok, err)


--[[
	Once again a new plan.
	This time, I am separating the
	game server and the web server.
	So I am going to allow a bit
	of inefficiency on my part
	for the web server.
	I am going to favor my pc performance
	over responsiveness to clients. 

	Also, make the game server udp, on 
	a different port
]]

function serverloop()
	while true
		
	end
end

--[[
function servestart()
	local serverloop_lane = lanes.gen(serverloop)
	serverloop_lane()
	acceptloop()
end

-- accepts incoming clients
function acceptloop()
	while true
		
	end
end

-- handles connected clients
function serverloop()
	
end
]]

--[[

Alright, the best way I can think to do this is to 
again make the select function non blocking
so that it can simply create a list of clients that are ready
And if there are no clients then it simply waits?
See, now that seems like a problem. 
Perhaps I should create a new thread for each cluster of 
incoming clients.
	
]]












--[[ create a max client count!!!
It is better to reject clients than to
lag all of the existing clients!
Although I suppose that constitutes
creating a client ID or something
I don't want to add that now.
So lets just not worry about max client
limits since these aren't connections
that stay open.
]]

--[[
function serverloop()
	local err
	while true do
		local client, err
		while client !=
			client, err = server:accept()
		if client == nil then
			io.stderr:write(err)
		end
		local data, err = client:receive()
		if err == nil and #data > 0 then
			local ok, err = pcall(execute, data)
			if ok == false
				io.stderr:write(err)
			end
		end
	end
end
]]


--local routines={}

-- consider adding a delay for each loop
-- if timer is not exceeded
-- or maybe instead if backlog is not empty
-- actually, that is a fun idea. Just loop
-- until the backlog is empty, and then wait.
-- I suppose I don't have access to the backlog
-- so instead I will use the length of the routines
--[[
	also note the "select" function.
	It can be used to prevent busywait
	while waiting for connections to time
	out.
	(I don't want to busywait connections
	with high latency)
]]

-- you know, coroutines are kind of useless if 
-- I only ever yield at the end of a function loop.


--[[

Alright, so a concern of mine is that while in non blocking 
mode (meaning there are clients), that it will busywait while 
waiting for client responses etc.
So I need to also find a way to throttle client waiting whilst 
also listening for new clients
socket.select seems to be the way to go there
]]

local clients = {}

function dispatch()
	local client, err
	-- accepts all clients in the backlog
	repeat
		-- if no current clients, set timeout to infinity, 
		-- otherwise non blocking
		server:timeout((#clients and {0} or {nil})[1])
		local client, err = server:accept()
		if client != nil then
			clients:insert(client)
		elseif err != nil
			io.stderr:write(err)
		end
	until client == nil
	-- waits for client status changes
	
	-- handles connections for all ready clients
	for 
		
	if 
end


function accepter()
	while true do
		
		coroutine.yield()
	end
end


function handler(client)
	-- supposedly yields when waiting for data
end


function execute(data)
	local id = tonumber(data:sub(1, 1))
	assert(id, "invalid string to number conversion")
end

function null(data)
	io.stderr:write("null packet received: " .. data)
end

--[[
	Change of plans. We aren't sendings strings!
	Instead we are sending binary.
]]
--MsgType = {
--	NULL = 0,
--	TRACK_N_SETUP = 1,
--}


methods = {
	null,
	
}


serverloop()


--[[

Alright, lets define a protocol here for the packets
that is efficient.
	
]]
