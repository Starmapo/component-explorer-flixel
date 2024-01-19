package substates;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.util.FlxColor;
import haxe.ui.components.CheckBox;
import haxe.ui.components.HorizontalSlider;
import haxe.ui.components.Label;
import haxe.ui.containers.Box;
import haxe.ui.containers.TabView;
import haxe.ui.containers.VBox;
import haxe.ui.styles.StyleSheet;

/**
 * @author Sword352
 */
class TestSubState extends FlxSubState
{
	var menu:TabView;

	override function create()
	{
		var background = new FlxSprite();
		background.makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		background.alpha = 0.6;
		add(background);

		menu = new TabView();
		menu.setSize(FlxG.width * 0.8, FlxG.height * 0.8);
		menu.color = FlxColor.PURPLE;
		menu.screenCenter();
		menu.styleSheet = new StyleSheet();
		menu.styleSheet.parse('
        .tabbar-button {
            color: #000000;
            font-size: 16px;
            font-name: "assets/fonts/Roboto-Regular.ttf";
            border-top-color: #000000;
            border-left-color: #000000;
            border-right-color: #000000;
            border-bottom-color: #000000;
        }

        .tabbar-button-selected {
            background-color: #800080;
            border-top-color: #000000;
            border-bottom-color: #800080;
            border-left-color: #000000;
            border-right-color: #000000;
        }
        ');

		menu.styleNames = "rounded-tabs full-width-buttons";

		createAudioPage();

		menu.pageIndex = 0;
		add(menu);

		super.create();
	}

	override function update(elapsed:Float):Void
	{
		if (FlxG.keys.justPressed.TAB)
		{
			close();
			return;
		}

		super.update(elapsed);
	}

	inline function createAudioPage():Void
	{
		var page:Box = createPage("Audio");

		var metronomeSlider:HorizontalSlider = new HorizontalSlider();
		metronomeSlider.min = 0;
		metronomeSlider.max = 100;
		metronomeSlider.step = 1;
		metronomeSlider.includeInLayout = false;
		metronomeSlider.top = 20;

		metronomeSlider.pos = 0;

		var metroText:Label = createText('Metronome Volume (${metronomeSlider.pos}%)');
		metroText.left = 5;
		metroText.top = 10;

		var hitsoundSlider:HorizontalSlider = new HorizontalSlider();
		hitsoundSlider.min = 0;
		hitsoundSlider.max = 100;
		hitsoundSlider.step = 1;
		hitsoundSlider.includeInLayout = false;
		hitsoundSlider.top = 60;

		hitsoundSlider.pos = 0;

		var hitsoundText:Label = createText('Hitsound Volume (${hitsoundSlider.pos}%)');
		hitsoundText.left = 5;
		hitsoundText.top = 50;

		var pitchSlider:HorizontalSlider = new HorizontalSlider();
		pitchSlider.pos = 1;
		pitchSlider.step = 0.05;
		pitchSlider.min = 0.1;
		pitchSlider.max = 5;

		pitchSlider.includeInLayout = false;
		pitchSlider.top = 100;

		var pitchText:Label = createText('Playback Rate (${pitchSlider.pos})');
		pitchText.left = 5;
		pitchText.top = 90;

		var muteInst:CheckBox = createCheckbox("Mute Instrumental");
		muteInst.selected = false;
		muteInst.top = metroText.top;
		muteInst.left = 200;

		var muteVoice:CheckBox = createCheckbox('Mute Voice "Voices"');
		muteVoice.top = muteInst.top + 25;
		muteVoice.left = 200;

		muteVoice.selected = false;
		page.addComponent(muteVoice);

		page.addComponent(metroText);
		page.addComponent(metronomeSlider);
		page.addComponent(hitsoundText);
		page.addComponent(hitsoundSlider);
		page.addComponent(pitchText);
		page.addComponent(pitchSlider);
		page.addComponent(muteInst);
	}

	inline function createPage(text:String):Box
	{
		var page:Box = new Box();
		page.text = text;
		page.percentWidth = 100;
		page.percentHeight = 100;
		menu.addComponent(page);
		return page;
	}

	inline function createText(label:String):Label
	{
		var text:Label = new Label();
		applyStyle(text.customStyle);
		text.includeInLayout = false;
		text.text = label;
		return text;
	}

	inline function createCheckbox(text:String):CheckBox
	{
		var checkbox:CheckBox = new CheckBox();
		applyStyle(checkbox.customStyle);
		checkbox.includeInLayout = false;
		checkbox.text = text;
		return checkbox;
	}

	inline static function applyStyle(s:haxe.ui.styles.Style, color:FlxColor = FlxColor.WHITE):Void
	{
		s.fontName = "assets/fonts/Roboto-Regular.ttf";
		s.color = color;
		s.fontSize = 12;
	}
}
