.. toctree::
   :maxdepth: 2

Server
======
The main game server is a binary that is launched for every ongoing game. It is spun up by an external program that passes in the player ids for the active players. We can have players and spectators join an active game. They all will use their unique player ids to communicate with the server.

Main
----
The main function exists outside of any namespace and serves to setup the initial game state, start up services, and register incoming message callbacks. It opens port 9000 and tells the networking code to start listening for messages coming in on the port.

Game Logic
----------
This layer wraps the game logic. It does not have any understanding of networking that happens around it. It provides interfaces for the adapter code to extract state and interfaces for updating game state. Whenever a request to update game state is invoked, the game validates the request and changes the state. If unsuccessful, it will report back an error. The networking layer can then test the error and respond to it as appropriate.

Networking
----------
This is the meat of the server. It listens for incoming messages and then invokes callbacks within the same layer. These callbacks may call adapter code to extract data from the game state or they may try to update the game state. If updates fail, they report back to the requesting client. This layer is also responsible for handling player_id to player_number conversion. The game logic layer understands only player_number. This layer is responsible for validating requests in terms of appropriate message, and valid player_id. Additionally, this layer handles requests that are outside the game logic. For example, a change of skin / avatar during gameplay would be supported by this layer. Finally, this layer manages disconnects and reconnects. This is again, outside the core game logic but it must be handled.

Adapter
-------
Adapter code is a set of utility functions that extract data from the game state and prepare flatbuffers which are later sent by the networking code to the clients. This code could be directly embedded in the network code but I wanted to create a layer of separation. This way, code that sends messages always pulls in data through the adapter layer.
