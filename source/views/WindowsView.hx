package views;

import haxe.ui.containers.windows.WindowManager;
import haxe.ui.events.MouseEvent;
import windows.InlineDialogsWindow;
import windows.SimpleFormWindow;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/windows.xml"))
class WindowsView extends View
{
	public function new()
	{
		super();
		// normally will default to "Screen" but lets change that to our container
		WindowManager.instance.container = windowContainer;
	}

	@:bind(openSimpleFormLink, MouseEvent.CLICK)
	private function onOpenSimpleForm(_)
	{
		var window = new SimpleFormWindow();
		window.left = 10;
		window.top = 80;
		WindowManager.instance.addWindow(window);
	}

	@:bind(openInlineDialogsLink, MouseEvent.CLICK)
	private function onOpenInlineDialogs(_)
	{
		var window = new InlineDialogsWindow();
		window.left = 300;
		window.top = 10;
		WindowManager.instance.addWindow(window);
	}

	private override function onHidden()
	{
		WindowManager.instance.reset();
	}
}
