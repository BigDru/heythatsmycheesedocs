.. _home:

.. htmc documentation master file, created by
   sphinx-quickstart on Tue Sep  5 22:22:17 2023.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

==========================
Hey That's My Cheese Docs!
==========================

HTMC uses flatbuffers to communicate between server and client. It is server authoritative which means people can mod their game all they want and it won't affect other players. Additionally, since it is a game of complete information we don't need to worry about selectively sending data to different clients.

This website serves as a reference for what different components of the game are responsible for.

.. toctree::
   :hidden:

   Home<self>

.. toctree::
   :maxdepth: 3
   :caption: Components

   server
   client

