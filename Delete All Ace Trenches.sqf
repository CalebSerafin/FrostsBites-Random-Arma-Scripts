_envelopeBigObjects = allMissionObjects "ACE_envelope_big";
_envelopeSmallObjects = allMissionObjects "ACE_envelope_small";

{
	deleteVehicle _x;
} forEach _envelopeBigObjects;
{
	deleteVehicle _x;
} forEach _envelopeSmallObjects;
hint "Trenches deleted";