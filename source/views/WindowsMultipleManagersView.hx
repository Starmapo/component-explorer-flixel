package views;

import haxe.ui.containers.windows.WindowManager;
import haxe.ui.events.MouseEvent;
import windows.InlineDialogsWindow;
import windows.SimpleFormWindow;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/windows-multiple-managers.xml"))
class WindowsMultipleManagersView extends View
{
	private var _windowManagerA:WindowManager;
	private var _windowManagerB:WindowManager;

	public function new()
	{
		super();
		// here we'll create and setup totally seperate window managers
		_windowManagerA = new WindowManager();
		_windowManagerA.container = windowContainerA;
		windowListA.windowManager = _windowManagerA;

		_windowManagerB = new WindowManager();
		_windowManagerB.container = windowContainerB;
		windowListB.windowManager = _windowManagerB;
	}

	// A functions

	@:bind(openSimpleFormLinkA, MouseEvent.CLICK)
	private function onOpenSimpleFormA(_)
	{
		var window = new SimpleFormWindow();
		window.left = 10;
		window.top = 80;
		_windowManagerA.addWindow(window);
	}

	@:bind(openInlineDialogsLinkA, MouseEvent.CLICK)
	private function onOpenInlineDialogsA(_)
	{
		var window = new InlineDialogsWindow();
		window.left = 300;
		window.top = 10;
		_windowManagerA.addWindow(window);
	}

	// B functions

	@:bind(openSimpleFormLinkB, MouseEvent.CLICK)
	private function onOpenSimpleFormB(_)
	{
		var window = new SimpleFormWindow();
		window.left = 10;
		window.top = 80;
		_windowManagerB.addWindow(window);
	}

	@:bind(openInlineDialogsLinkB, MouseEvent.CLICK)
	private function onOpenInlineDialogsB(_)
	{
		var window = new InlineDialogsWindow();
		window.left = 300;
		window.top = 10;
		_windowManagerB.addWindow(window);
	}

	private override function onHidden()
	{
		_windowManagerA.reset();
		_windowManagerB.reset();
	}
}
