private _A3A_HintRainbowUberFHD = { // Pre-parsed text
    params [["_fadeShades",6,[6]], ["_aspectRatio",1,[1]]];
    _fadeShades = 1 max _fadeShades min 256;
    private _imgSize = 13.21 * (1/_aspectRatio);
    private _imgMap = parseText "";
	private _pixelsCount = 6 * _fadeShades * floor (6 * _fadeShades * (1/_aspectRatio));
	private _pixelsHeight = floor (6 * _fadeShades * (1/_aspectRatio));
    private _colourFormats = [
        ["1,%1,0,1","%1,1,0,1"],
        ["0,1,%1,1","0,%1,1,1"],
        ["%1,0,1,1","1,0,%1,1"]
    ];
	private _fillLine = {
		params[["_pixelXML","",[""]]];
		private _pixel = parseText _pixelXML;
		private _tempArr = [];
		_tempArr resize floor (6 * _fadeShades * _aspectRatio);
		_imgMap = composeText[_imgMap, composeText (_tempArr apply {_pixel}), lineBreak];
	};
	{
        private _colourFormat = _x apply {format["<img image='#(argb,4,4,1)color(%1)' shadow='0' align='left' size='%2'/>",_x,_imgSize/(6*_fadeShades)]};
        for "_i" from 1 to _fadeShades do {
			[format[_colourFormat #0, (_i-1)/_fadeShades]] call _fillLine;
        };
        for "_i" from _fadeShades to 1 step -1 do {
			[format[_colourFormat #1, _i/_fadeShades]] call _fillLine;
        };
    } forEach _colourFormats;

    private _rainbow = composeText [
		parseText "<img color='#ffffff' image='functions\UI\images\logo.paa' align='center' size='2' /><br/><br/>
		<t size='1.2' color='#e5b348' shadow='1' shadowColor='#000000'>Rainbow Über FHD</t><br/>
		<img color='#e6b24a' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' /><br/><br/>",
		_imgMap,
        parseText format ["<br/><t size='1.8' align='center' color='#5ef2ff' font='RobotoCondensedLight'>Total Pixels: %1<br/>%2x%3</t><br/>
			<img color='#e6b24a' image='functions\UI\images\img_line_ca.paa' align='center' size='0.60' />",_pixelsCount toFixed 0, (_pixelsCount/_pixelsHeight) toFixed 0, _pixelsHeight toFixed 0]
    ];
    ["Rainbow Uber FHD", _rainbow] call A3A_fnc_customHint;
};
[50,17/48] call _A3A_HintRainbowUberFHD;