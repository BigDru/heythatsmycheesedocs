.. toctree::
   :maxdepth: 2

Main Server
===========
This is the server that all clients intitially connect to. For now it will contain lobby making functions. It will allow players to create or join a room. It will also start the htmc_server binary which houses the actual game.

Login
-----
The main server is responsible for logins as well. However, it always expects at least 8 bytes:
 - size: 2
 - player_id: 4
 - message_type: 2

To solve this we will send null for player_id when we send the login message.

Lobby
-----
The lobby is a separate binary that always runs. For now it will run on the same server. It will take port 9000 and the game server will be given a random port between 9001-9999.

The SERVER_SUBSCRIBE_TO_ROOM_INFO message exists because there will likely be other server scenes that don't need lobby info. A client will only want to subscribe to the room info only when they are viewing the available lobbies scene.
