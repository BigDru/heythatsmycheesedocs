.. toctree::
   :maxdepth: 2

Client
======
The client is made in Unity and has its own duplicate of the game logic. However, the client holds very little state. It has a copy of the latest game state sent by the server. It allows the user to perform actions on their turn. The biggest thing it does is display the game. In the future, the client will communicate with a lobby coordinator that in turn launches an instance of the server binary when everyone is ready to play.
