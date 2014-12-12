Airport Challenge
=================

Tasks
-----

Imagine you're writing software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

Your task is to create a set of classes/modules to makes the given test suite pass. You will need to use random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a double to override random weather. Finally, every plane must have a status indicating whether it's flying or landed.

CRC
----

#Planes

Responsabilities  |  Collaborators
------------------|---------------
	to take off   |	   Airport
	to fly        |
	to land       |    Airport
----------------------------------

#Airport

Responsabilities  |  Collaborators
------------------|---------------
  Release Planes  |	   Planes
  Dock Planes     |	   Planes
  Be full         |      
  Be empty        |
----------------------------------

#Weather

Responsabilities  |  Collaborators
------------------|----------------
  Allows take off |	Airport, Planes
  Deny take off   | Airport, Planes
  Allows landing  | Airport, Planes
  Deny landing    | Airport, Planes
-----------------------------------
	