//I was in the same situation of others, Zombies won't attack Civilian, but i found two way to make them attack again.
//1) First one is a line of code to put in the init field of the civilian unit :
//Put in the init field : 
this addRating -10000;
//And it work well.
//2) Second one will work for any spawned civilian by module or by the editor. You have to wrote the code in your mission folder, in the init.sqf :
EAST setFriend [CIVILIAN, 0];

//Infection Immune Units expects a unit object (The unit's variable name)




