package views;

import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import haxe.ui.HaxeUIApp;
import haxe.ui.Toolkit;
import haxe.ui.containers.HBox;
import haxe.ui.containers.TreeViewNode;
import haxe.ui.core.Screen;
import haxe.ui.events.KeyboardEvent;
import haxe.ui.events.UIEvent;
import util.Logger;

using StringTools;

#if js
import haxe.ui.themes.ThemeManager;
import js.Browser;
#end

@:build(haxe.ui.macros.ComponentMacros.build("assets/main.xml"))
class MainView extends HBox
{
	static var _initialized:Bool = false;

	public function new()
	{
		super();
		loadThemeSetting();
		trace("Screen size: " + Screen.instance.width + "x" + Screen.instance.height);
		Logger.logData = logData;
		ViewManager.instance.viewTabs = mainTabs;

		initViews();

		Screen.instance.registerEvent(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	public override function onReady()
	{
		super.onReady();
		populateMainTree();
	}

	function initViews()
	{
		if (_initialized)
		{
			return;
		}
		_initialized = true;

		ViewManager.instance.registerView({
			group: "Basic",
			title: "Buttons",
			smallIcon: "icons/svg/buttons.png",
			largeIcon: "icons/svg/buttons.png",
			viewClass: ButtonsView,
			relevantFiles: ["views/buttons.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			subGroup: "Buttons",
			title: "As Menus",
			smallIcon: "icons/svg/layout-3-cols.png",
			largeIcon: "icons/svg/layout-3-cols.png",
			viewClass: ButtonsAsMenusView,
			relevantFiles: ["views/buttons-as-menus.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			subGroup: "Buttons",
			title: "Styled Buttons",
			smallIcon: "icons/svg/paintbrush.png",
			largeIcon: "icons/svg/paintbrush.png",
			viewClass: ButtonsStyledView,
			relevantFiles: ["views/buttons-styled.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			subGroup: "Buttons",
			title: "Bitmap Buttons",
			smallIcon: "icons/svg/paintbrush.png",
			largeIcon: "icons/svg/paintbrush.png",
			viewClass: ButtonsBitmapView,
			relevantFiles: ["views/buttons-bitmap.xml", "images/bitmap_button.png"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Check Boxes",
			smallIcon: "icons/svg/checkboxes.png",
			largeIcon: "icons/svg/checkboxes.png",
			viewClass: CheckBoxesView,
			relevantFiles: ["views/checkboxes.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Option Boxes",
			smallIcon: "icons/svg/optionboxes.png",
			largeIcon: "icons/svg/optionboxes.png",
			viewClass: OptionBoxesView,
			relevantFiles: ["views/optionboxes.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Labels",
			smallIcon: "icons/svg/labels.png",
			largeIcon: "icons/svg/labels.png",
			viewClass: LabelsView,
			relevantFiles: ["views/labels.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Links",
			smallIcon: "icons/svg/links.png",
			largeIcon: "icons/svg/links.png",
			viewClass: LinksView,
			relevantFiles: ["views/links.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Dropdowns",
			smallIcon: "icons/svg/dropdown.png",
			largeIcon: "icons/svg/dropdown.png",
			viewClass: DropDownsView,
			relevantFiles: [
				"views/dropdowns.xml",
				"source/views/DropDownsView.hx",
				"views/mydropdownhandler.xml",
				"source/views/MyDropDownHandlerView.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Text Inputs",
			smallIcon: "icons/svg/textinputs.png",
			largeIcon: "icons/svg/textinputs.png",
			viewClass: TextInputsView,
			relevantFiles: ["views/textinputs.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Calendars",
			smallIcon: "icons/svg/calendars.png",
			largeIcon: "icons/svg/calendars.png",
			viewClass: CalendarsView,
			relevantFiles: ["views/calendars.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Scroll Bars",
			smallIcon: "icons/svg/scrollbars.png",
			largeIcon: "icons/svg/scrollbars.png",
			viewClass: ScrollBarsView,
			relevantFiles: ["views/scrollbars.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Sliders",
			smallIcon: "icons/svg/sliders.png",
			largeIcon: "icons/svg/sliders.png",
			viewClass: SlidersView,
			relevantFiles: ["views/sliders.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Steppers",
			smallIcon: "icons/svg/steppers.png",
			largeIcon: "icons/svg/steppers.png",
			viewClass: SteppersView,
			relevantFiles: ["views/steppers.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Switches",
			smallIcon: "icons/svg/switches.png",
			largeIcon: "icons/svg/switches.png",
			viewClass: SwitchesView,
			relevantFiles: ["views/switches.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Canvas",
			smallIcon: "icons/svg/canvas.png",
			largeIcon: "icons/svg/canvas.png",
			viewClass: CanvasView,
			relevantFiles: [
				"views/canvas.xml",
				"source/custom/DemoGraph.hx",
				"source/custom/ColorTable.hx",
				"source/custom/Noise.hx",
				"source/custom/MiniGraph.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			subGroup: "Canvas",
			title: "As Icons",
			smallIcon: "icons/svg/canvas-as-icons.png",
			largeIcon: "icons/svg/canvas-as-icons.png",
			viewClass: CanvasAsIconsView,
			relevantFiles: [
				"views/canvas-as-icons.xml",
				"source/views/CanvasAsIconsView.hx",
				"source/custom/Noise.hx",
				"source/custom/MiniGraph.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Color Pickers",
			smallIcon: "icons/svg/color-pickers.png",
			largeIcon: "icons/svg/color-pickers.png",
			viewClass: ColorPickersView,
			relevantFiles: ["views/color-pickers.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Item Pickers",
			smallIcon: "icons/svg/item-pickers.png",
			largeIcon: "icons/svg/item-pickers.png",
			viewClass: ItemPickersView,
			relevantFiles: ["views/item-pickers.xml"]
		});

		ViewManager.instance.registerView({
			group: "Containers",
			title: "Tabs",
			smallIcon: "icons/svg/tabs.png",
			largeIcon: "icons/svg/tabs.png",
			viewClass: TabsView,
			relevantFiles: ["views/tabs.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Tabs",
			title: "Tab Styling",
			smallIcon: "icons/svg/paintbrush.png",
			largeIcon: "icons/svg/paintbrush.png",
			viewClass: TabsStylingView,
			relevantFiles: ["views/tabs-styling.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Menus",
			smallIcon: "icons/svg/menus.png",
			largeIcon: "icons/svg/menus.png",
			viewClass: MenusView,
			relevantFiles: ["views/menus.xml", "source/views/MenusView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Frames",
			smallIcon: "icons/svg/frames.png",
			largeIcon: "icons/svg/frames.png",
			viewClass: FramesView,
			relevantFiles: ["views/frames.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Forms",
			smallIcon: "icons/svg/forms.png",
			largeIcon: "icons/svg/forms.png",
			viewClass: FormsView,
			relevantFiles: ["views/forms.xml", "source/views/FormsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Scroll Views",
			smallIcon: "icons/svg/scrollviews.png",
			largeIcon: "icons/svg/scrollviews.png",
			viewClass: ScrollViewsView,
			relevantFiles: ["views/scrollviews.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "List Views",
			smallIcon: "icons/svg/listviews.png",
			largeIcon: "icons/svg/listviews.png",
			viewClass: ListViewsView,
			relevantFiles: ["views/listviews.xml", "source/views/ListViewsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "List Views",
			title: "Component Events",
			smallIcon: "icons/svg/lightning.png",
			largeIcon: "icons/svg/lightning.png",
			viewClass: ListViewComponentEventsView,
			relevantFiles: [
				"views/listview-component-events.xml",
				"source/views/ListViewComponentEventsView.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "List Views",
			title: "As Menus",
			smallIcon: "icons/svg/listviews-as-menus.png",
			largeIcon: "icons/svg/listviews-as-menus.png",
			viewClass: ListViewsAsMenusView,
			relevantFiles: ["views/listviews-as-menus.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "List Views",
			title: "Code Item Renderer",
			smallIcon: "icons/svg/listviews.png",
			largeIcon: "icons/svg/listviews.png",
			viewClass: ListViewCodeItemRenderer,
			relevantFiles: [
				"views/listview-code-item-renderer.xml",
				"source/custom/MyListViewItemRenderer.hx",
				"source/views/ListViewCodeItemRenderer.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Table Views",
			smallIcon: "icons/svg/tables.png",
			largeIcon: "icons/svg/tables.png",
			viewClass: TableViewsView,
			relevantFiles: ["views/tableviews.xml", "source/views/TableViewsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Table Views",
			title: "Column Styling",
			smallIcon: "icons/svg/paintbrush.png",
			largeIcon: "icons/svg/paintbrush.png",
			viewClass: TableViewColumnStylingView,
			relevantFiles: ["views/tableview-column-styling.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Table Views",
			title: "Editable Tables",
			smallIcon: "icons/svg/textinputs.png",
			largeIcon: "icons/svg/textinputs.png",
			viewClass: EditableTableView,
			relevantFiles: ["views/editable-table-view.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Tree Views",
			smallIcon: "icons/svg/treeviews.png",
			largeIcon: "icons/svg/treeviews.png",
			viewClass: TreeViewsView,
			relevantFiles: ["views/treeviews.xml", "source/views/TreeViewsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Side Bars",
			smallIcon: "icons/svg/sidebar.png",
			largeIcon: "icons/svg/sidebar.png",
			viewClass: SidebarsView,
			relevantFiles: ["views/sidebars.xml", "source/views/SidebarsView.hx", "views/mysidebar.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Property Grids",
			smallIcon: "icons/svg/listviews.png",
			largeIcon: "icons/svg/listviews.png",
			viewClass: PropertyGridsView,
			relevantFiles: ["views/propertygrids.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Accordions",
			smallIcon: "icons/svg/accordions.png",
			largeIcon: "icons/svg/accordions.png",
			viewClass: AccordionsView,
			relevantFiles: ["views/accordions.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Dialogs",
			smallIcon: "icons/svg/dialogs.png",
			largeIcon: "icons/svg/dialogs.png",
			viewClass: DialogsView,
			relevantFiles: [
				"views/dialogs.xml",
				"source/views/DialogsView.hx",
				"views/mycustomdialog.xml",
				"views/simple-login-dialog.xml"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Dialogs",
			title: "File Dialogs",
			smallIcon: "icons/svg/dialogs.png",
			largeIcon: "icons/svg/dialogs.png",
			viewClass: FileDialogsView,
			relevantFiles: ["views/file-dialogs.xml", "source/views/FileDialogsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Splitters",
			smallIcon: "icons/svg/splitters.png",
			largeIcon: "icons/svg/splitters.png",
			viewClass: SplitterView,
			relevantFiles: ["views/splitters.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Windows",
			smallIcon: "icons/svg/windows.png",
			largeIcon: "icons/svg/windows.png",
			viewClass: WindowsView,
			relevantFiles: [
				"views/windows.xml",
				"source/views/WindowsView.hx",
				"source/windows/SimpleFormWindow.hx",
				"source/windows/SimpleGraphWindow.hx",
				"source/windows/InlineDialogsWindow.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Windows",
			title: "Multiple Managers",
			smallIcon: "icons/svg/windows-multiple.png",
			largeIcon: "icons/svg/windows-multiple.png",
			viewClass: WindowsMultipleManagersView,
			relevantFiles: [
				"views/windows-multiple-managers.xml",
				"source/views/WindowsMultipleManagersView.hx",
				"source/windows/SimpleFormWindow.hx",
				"source/windows/SimpleGraphWindow.hx",
				"source/windows/InlineDialogsWindow.hx"
			]
		});

		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Tooltips",
			smallIcon: "icons/svg/tooltips.png",
			largeIcon: "icons/svg/tooltips.png",
			viewClass: TooltipsView,
			relevantFiles: ["views/tooltips.xml", "source/views/TooltipsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Locales",
			smallIcon: "icons/svg/locales.png",
			largeIcon: "icons/svg/locales.png",
			viewClass: LocalesView,
			relevantFiles: [
				"views/locales.xml",
				"source/views/LocalesView.hx",
				"locales/en.properties",
				"locales/en_US.properties",
				"locales/fr.properties",
				"locales/cy.properties",
				"locales/pl.properties",
				"locales/ru.properties"
			]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Drag",
			smallIcon: "icons/svg/drag.png",
			largeIcon: "icons/svg/drag.png",
			viewClass: DragManagerView,
			relevantFiles: ["views/drag-manager.xml", "source/views/DragManagerView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Animation",
			smallIcon: "icons/svg/animation.png",
			largeIcon: "icons/svg/animation.png",
			viewClass: AnimationView,
			relevantFiles: ["views/animation.xml", "source/views/AnimationView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			subGroup: "Animation",
			title: "Animated Dots",
			smallIcon: "icons/svg/animation.png",
			largeIcon: "icons/svg/animation.png",
			viewClass: AnimatedDotsView,
			relevantFiles: ["views/animated-dots.xml", "source/views/AnimatedDotsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Validators",
			smallIcon: "icons/svg/validators.png",
			largeIcon: "icons/svg/validators.png",
			viewClass: ValidatorsView,
			relevantFiles: ["views/validators.xml", "source/views/ValidatorsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "App Icon",
			smallIcon: "icons/svg/app-icon.png",
			largeIcon: "icons/svg/app-icon.png",
			viewClass: AppIconView,
			relevantFiles: ["views/app-icon.xml", "source/views/AppIconView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Notifications",
			smallIcon: "icons/svg/notifications.png",
			largeIcon: "icons/svg/notifications.png",
			viewClass: NotificationsView,
			relevantFiles: ["views/notifications.xml", "source/views/NotificationsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Filters",
			smallIcon: "icons/svg/filters.png",
			largeIcon: "icons/svg/filters.png",
			viewClass: FiltersView,
			relevantFiles: ["views/filters.xml", "source/views/FiltersView.hx"]
		});

		ViewManager.instance.registerView({
			group: "Examples",
			title: "Simple Paint",
			smallIcon: "icons/svg/canvas.png",
			largeIcon: "icons/svg/canvas.png",
			viewClass: SimplePaintView,
			relevantFiles: ["views/simple-paint.xml", "source/views/SimplePaintView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Examples",
			title: "Todos",
			smallIcon: "icons/svg/todos.png",
			largeIcon: "icons/svg/todos.png",
			viewClass: TodosView,
			relevantFiles: [
				"views/todos.xml",
				"source/views/TodosView.hx",
				"css/todos.css",
				"images/unchecked.png",
				"images/checked.png",
				"images/delete.png"
			]
		});
		ViewManager.instance.registerView({
			group: "Examples",
			title: "Employee App",
			smallIcon: "icons/svg/employee-app.png",
			largeIcon: "icons/svg/employee-app.png",
			viewClass: views.fakeemployeeapp.MainView,
			relevantFiles: [
				"source/views/fakeemployeeapp/MainView.hx",
				"source/views/fakeemployeeapp/main-view.xml",
				"source/views/fakeemployeeapp/FakePersonDetailsWindow.hx",
				"source/views/fakeemployeeapp/FakeDepartmentDetailsWindow.hx",
				"source/views/fakeemployeeapp/FakeEmailWindow.hx",
				"source/views/fakeemployeeapp/FakePersonManager.hx",
				"source/fakedata/FakePerson.hx",
				"source/fakedata/FakePeopleDB.hx"
			]
		});

		ViewManager.instance.registerView({
			group: "Tests",
			title: "Clipping Test",
			smallIcon: "icons/svg/scrollviews.png",
			largeIcon: "icons/svg/scrollviews.png",
			viewClass: ClippingTestView,
			relevantFiles: ["views/clipping-test.xml"]
		});
		ViewManager.instance.registerView({
			group: "Tests",
			title: "Mouse Test",
			smallIcon: "icons/svg/sliders.png",
			largeIcon: "icons/svg/sliders.png",
			viewClass: MouseTestView,
			relevantFiles: ["views/mouse-test.xml"]
		});
		ViewManager.instance.registerView({
			group: "Tests",
			title: "Locales Test",
			smallIcon: "icons/svg/locales.png",
			largeIcon: "icons/svg/locales.png",
			viewClass: LocalesTestView,
			relevantFiles: ["views/locales-test.xml"]
		});
	}

	private function changePage()
	{
		#if js
		var defaultColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("default-background-color");
		/*
			var secondaryColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("secondary-background-color");
			var borderColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("normal-border-color");
			var accentColor = @:privateAccess ThemeManager.instance.currentThemeVars.get("normal-text-color");
		 */

		js.Browser.document.body.style.backgroundColor = defaultColor;
		/*
			js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.backgroundColor = secondaryColor;
			js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.borderColor = borderColor;
			js.Browser.document.getElementsByClassName("navigation-header-full").item(0).style.setProperty("box-shadow", "none");

			js.Browser.document.getElementsByClassName("selected").item(0).style.color = accentColor;
		 */
		#end
	}

	private function saveThemeSetting()
	{
		#if js
		var days = 365;
		js.Cookie.set("haxeui-theme", _theme, days * 24 * 60 * 60 * 1000);
		#else
		FlxG.save.data.haxeui_theme = _theme;
		FlxG.save.flush();
		#end
		trace("saved theme: " + _theme);
	}

	private function saveTreePath()
	{
		var path = mainTree.selectedNode.nodePath();
		#if js
		var days = 365;
		js.Cookie.set("haxeui-selected-path", path, days * 24 * 60 * 60 * 1000);
		#else
		FlxG.save.data.haxeui_selected_path = path;
		FlxG.save.flush();
		#end
		trace("saved path: " + path);
	}

	private var _theme:String = "default";

	private function loadThemeSetting()
	{
		#if js
		var value = js.Cookie.get("haxeui-theme");
		#else
		var value = FlxG.save.data.haxeui_theme;
		#end
		if (value == null)
		{
			value = "default";
		}
		_theme = value;
		trace("loaded theme: " + value);
		/*
			var indexToSelect = 0;
			var ds = themeSelector.dataSource;
			for (i in 0...ds.size)
			{
				if (ds.get(i).themeId == value)
				{
					indexToSelect = i;
					break;
				}
			}
			themeSelector.selectedIndex = indexToSelect;
		 */
		themeSwitch.selected = (_theme == "dark");
		if (_theme != Toolkit.theme)
		{
			Toolkit.theme = _theme;
			changePage();
		}
	}

	private function loadTreePath():String
	{
		#if js
		return js.Cookie.get("haxeui-selected-path");
		#else
		return FlxG.save.data.haxeui_selected_path;
		#end
	}

	@:bind(themeSwitch, UIEvent.CHANGE)
	private function onThemeSwitchChanged(_)
	{
		var theme = themeSwitch.selected ? "dark" : "default";
		if (theme == _theme)
		{
			return;
		}
		_theme = theme;
		saveThemeSetting();
		#if js
		if (_theme != Toolkit.theme)
		{
			Toolkit.theme = _theme;
			changePage();
			// js.Browser.location.reload();
		}
		#end
	}

	/*
		@:bind(themeSelector, UIEvent.CHANGE)
		private function onThemeSelectorChanged(_)
		{
			if (_theme == themeSelector.selectedItem.themeId)
			{
				return;
			}
			_theme = themeSelector.selectedItem.themeId;
			saveThemeSetting();
			if (_theme != Toolkit.theme)
			{
				#if js
				js.Browser.location.reload();
				#else
				Toolkit.theme = _theme;
				#end
			}
		}
	 */
	private function populateMainTree()
	{
		var firstNode:TreeViewNode = null;
		var pathToSelect1:String = loadTreePath();

		var pathToSelect2:String = null;
		#if js
		if (Browser.window.location.hash != null)
		{
			pathToSelect2 = Browser.window.location.hash.substr(1).replace("_", " ");
		}
		#end

		var nodeToSelect1:TreeViewNode = null;
		var nodeToSelect2:TreeViewNode = null;
		for (groupName in ViewManager.instance.viewGroupNames)
		{
			var icon = "icons/svg/folder3.png";
			icon = null;
			var groupNode = mainTree.addNode({text: groupName, icon: icon});
			groupNode.expanded = true;

			var list = ViewManager.instance.viewGroups.get(groupName);
			for (item in list)
			{
				var itemNode = groupNode.addNode({text: item.title, icon: item.smallIcon, viewInfo: item});
				if (itemNode.nodePath() == pathToSelect1)
				{
					nodeToSelect1 = itemNode;
				}
				if (itemNode.nodePath().toLowerCase() == pathToSelect2)
				{
					nodeToSelect2 = itemNode;
				}
				if (firstNode == null)
				{
					firstNode = itemNode;
				}
				var subItems = ViewManager.instance.getItemsFromSubGroup(item.title);
				if (subItems.length > 0)
				{
					// itemNode.expanded = true;
					for (subItem in subItems)
					{
						var subNode = itemNode.addNode({text: subItem.title, icon: subItem.smallIcon, viewInfo: subItem});
						if (subNode.nodePath() == pathToSelect1)
						{
							nodeToSelect1 = subNode;
						}
						if (subNode.nodePath().toLowerCase() == pathToSelect2)
						{
							nodeToSelect2 = subNode;
						}
					}
				}
			}
		}

		if (nodeToSelect1 == null)
		{
			nodeToSelect1 = firstNode;
		}
		if (nodeToSelect2 != null)
		{
			nodeToSelect1 = nodeToSelect2;
		}

		Toolkit.callLater(function()
		{
			mainTree.selectedNode = nodeToSelect1;
		});
	}

	@:bind(mainTree, UIEvent.CHANGE)
	private function onMainTreeSelectionChanged(e)
	{
		if (mainTree.selectedNode == null)
		{
			return;
		}

		var path = mainTree.selectedNode.nodePath();
		trace("tree selection changed: " + path);
		saveTreePath();

		var viewInfo = mainTree.selectedNode.data.viewInfo;
		if (viewInfo == null)
		{
			return;
		}
		ViewManager.instance.showView(viewInfo);
		#if js
		var safePath = path.toLowerCase().replace(" ", "_");
		Browser.window.history.pushState("", "", "#" + safePath);
		#end
	}

	function onKeyDown(event:KeyboardEvent)
	{
		switch (event.keyCode)
		{
			case FlxKey.F3:
				logBox.hidden = !logBox.hidden;
			case FlxKey.F4:
				FlxG.resetState();
				FlxG.signals.postStateSwitch.addOnce(function()
				{
					HaxeUIApp.instance.addComponent(new MainView());
				});
		}
	}
}
