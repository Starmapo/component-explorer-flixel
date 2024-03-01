package;

import flixel.FlxG;
import flixel.FlxGame;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import openfl.Lib;
import views.MainView;

class Main
{
	public static function main()
	{
		FlxG.log.redirectTraces = true;
		startApp();
	}

	static function startApp()
	{
		var app = new HaxeUIApp();
		app.ready(function()
		{
			var main = new MainView();
			app.addComponent(main);

			app.start();
		});
	}

	static function startFlxGame()
	{
		Toolkit.init();
		Lib.current.stage.addChild(new FlxGame(1280, 720, PlayState, 60, 60, true));
	}
}
