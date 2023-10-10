.. toctree::
   :maxdepth: 2

Communication
=============

Client to server messages always contain a 2 byte "size" field, a 4 byte "player_id" field, 2 byte "message_type" field. The server uses this on the empty payload CLIENT_JOIN message to determine if the client is a playing client (as opposed to spectating).

 #. Client: Sends CLIENT_JOIN.
 #. Server: Sends ACKNOWLEDGE_JOIN.
 #. Server: When the last playing client joins, the server sends ACKNOWLEDGE_JOIN to that last client and then broadcasts PLAYERS and BOARD messages. Note at this point the game begins.
 #. Client: Player 1 will place a mouse on their client and then send the MOUSE_PLACED message.
 #. Server: BOARD message is broadcast each time a MOUSE_PLACED message comes in. Clients can figure out for themselves when the game has actually started.
 #. Client: Player will move and send the MOUSE_MOVED message.
 #. Server: BOARD message is broadcast.
 #. Server: Once game is finished, server broadcasts GAME_OVER message with the player scores.

In the future, Server will also send an INVALID_REQUEST message as appropriate.
