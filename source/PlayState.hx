import views.MainView;
import flixel.FlxState;

class PlayState extends FlxState
{
	override function create()
	{
        var main = new MainView();
		add(main);

		super.create();
	}
}
