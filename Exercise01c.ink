/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR health = 5
VAR pet_name = ""
VAR torches = 0
VAR sword_durability = 0
VAR music = ""

-> memory
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might less intimidating then. What was your pet's name?

== memory ==
* [Charlie]
    ~ pet_name = "Charlie"
    -> cave_mouth
* [Susan]
    ~ pet_name = "Susan"
    -> cave_mouth
* [Spot]
    ~pet_name = "Spot"
    -> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!

You have {torches} torches and music player.

{music != "": Now you are listening to music, "{music}". The music makes you less scary in the cave.}

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup
* [Turn on the music] -> turn_on_the_music

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west. There are two doors.
{pet_name == "Spot": Scout would love it here in the west}
{pet_name == "Charlie": Charlie seems inclined to go right door.}
{pet_name == "Susan": Susan seems inclined to go left door.}
+ [Open a right door and go in] -> RightDoor
+ [Open a left door and go in] -> LeftDoor

+ [Go Back] -> cave_mouth
-> END

== RightDoor ==
{sword_durability == 0: There are monsters. You are killed by the monsters -> END}
There are monsters. You can pierce the monsters with a sword.
+ {sword_durability > 0}[Go Deeper] -> Go_Deeper
+ [Go Back] -> west_tunnel
-> END

== Go_Deeper ==
You got deeper into the cave.
~ sword_durability = sword_durability -1
The sword durability is {sword_durability}.
+ [Light Torch] -> Further_Inside
+ [Go Back] -> west_tunnel
-> END

== Killed_by_Monsters ==
The sword was destroyed due to the durability. You are killed by monsters.
-> END

== Further_Inside ==
You found the gold piled up and a way out of the cave.
+ [Exit the cave] -> Exit_the_Cave
+ [Go Back]
-> END

== LeftDoor ==
It is very dark, you can't see anything.
+ {torches > 0} [Light Torch] -> Get_a_Sword
+ [Go Back] -> west_tunnel
-> END

=== Get_a_Sword ===
You get a sword. Now you can protect yourself with the sword.
~sword_durability = sword_durability + 2
The sword durability is {sword_durability}. It will be destroyed when its durability reaches 0.
+ [Go Back] -> west_tunnel
-> END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

=== turn_on_the_music ===
*[Stay - the Kid LAROI]
    ~music = "Stay by the Kid LAROI"
    -> cave_mouth

*[Coming Home - Diddy Dirty Money]
    ~music = "Coming Home by Diddy Dirty Money"
    -> cave_mouth

*[Maps - Maroon5]
    ~music = "Maps by Maroon5"
    -> cave_mouth

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END

== Exit_the_Cave ==
Now you came out of the cave.
-> END