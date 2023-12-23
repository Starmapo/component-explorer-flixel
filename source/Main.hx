package;

import flixel.FlxGame;
import haxe.ui.Toolkit;
import openfl.Lib;

class Main
{
	public static function main()
	{
		Toolkit.init();
		Lib.current.stage.addChild(new FlxGame(0, 0, PlayState, 60, 60, true));
	}
}
