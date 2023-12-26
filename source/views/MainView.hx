package views;

import flixel.FlxG;
import haxe.ui.Toolkit;
import haxe.ui.containers.HBox;
import haxe.ui.containers.TreeViewNode;
import haxe.ui.core.Screen;
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
	public function new()
	{
		super();
		loadThemeSetting();
		trace("Screen size: " + Screen.instance.width + "x" + Screen.instance.height);
		Logger.logData = logData;
		ViewManager.instance.viewTabs = mainTabs;

		ViewManager.instance.registerView({
			group: "Basic",
			title: "Buttons",
			smallIcon: "assets/icons/16/buttons.png",
			viewClass: ButtonsView,
			relevantFiles: ["views/buttons.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			subGroup: "Buttons",
			title: "As Menus",
			smallIcon: "assets/icons/16/layouts_3.png",
			viewClass: ButtonsAsMenusView,
			relevantFiles: ["views/buttons-as-menus.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Text Inputs",
			smallIcon: "assets/icons/16/text_area(2).png",
			viewClass: TextInputsView,
			relevantFiles: ["views/textinputs.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Steppers",
			smallIcon: "assets/icons/16/spin.png",
			viewClass: SteppersView,
			relevantFiles: ["views/steppers.xml"]
		});
		ViewManager.instance.registerView({
			group: "Basic",
			title: "Color Pickers",
			smallIcon: "assets/icons/16/color-picker-default.png",
			viewClass: ColorPickersView,
			relevantFiles: ["views/color-pickers.xml"]
		});

		ViewManager.instance.registerView({
			group: "Containers",
			title: "Frames",
			smallIcon: "assets/icons/16/attributes_display.png",
			viewClass: FramesView,
			relevantFiles: ["views/frames.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Forms",
			smallIcon: "assets/icons/16/labels.png",
			viewClass: FormsView,
			relevantFiles: ["views/forms.xml", "source/views/FormsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "List Views",
			smallIcon: "assets/icons/16/list_box.png",
			viewClass: ListViewsView,
			relevantFiles: ["views/listviews.xml", "source/views/ListViewsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "List Views",
			title: "Component Events",
			smallIcon: "assets/icons/16/buttons.png",
			viewClass: ListViewComponentEventsView,
			relevantFiles: [
				"views/listview-component-events.xml",
				"source/views/ListViewComponentEventsView.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Table Views",
			smallIcon: "assets/icons/16/table.png",
			viewClass: TableViewsView,
			relevantFiles: ["views/tableviews.xml", "source/views/TableViewsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Table Views",
			title: "Editable Tables",
			smallIcon: "assets/icons/16/table.png",
			viewClass: EditableTableView,
			relevantFiles: ["views/editable-table-view.xml"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Dialogs",
			smallIcon: "assets/icons/16/dialog.png",
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
			smallIcon: "assets/icons/16/dialog.png",
			viewClass: FileDialogsView,
			relevantFiles: ["views/file-dialogs.xml", "source/views/FileDialogsView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			title: "Windows",
			smallIcon: "assets/icons/16/dialog.png",
			viewClass: WindowsView,
			relevantFiles: [
				"views/windows.xml",
				"source/views/WindowsView.hx",
				"source/windows/SimpleFormWindow.hx",
				"source/windows/InlineDialogsWindow.hx"
			]
		});
		ViewManager.instance.registerView({
			group: "Containers",
			subGroup: "Windows",
			title: "Multiple Managers",
			smallIcon: "assets/icons/16/dialog.png",
			viewClass: WindowsMultipleManagersView,
			relevantFiles: [
				"views/windows-multiple-managers.xml",
				"source/views/WindowsMultipleManagersView.hx",
				"source/windows/SimpleFormWindow.hx",
				"source/windows/InlineDialogsWindow.hx"
			]
		});

		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Locales",
			smallIcon: "assets/icons/16/labels2.png",
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
			title: "Animation",
			smallIcon: "assets/icons/16/images.png",
			viewClass: AnimationView,
			relevantFiles: ["views/animation.xml", "source/views/AnimationView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Miscellaneous",
			title: "Validators",
			smallIcon: "assets/icons/16/textfield.png",
			viewClass: ValidatorsView,
			relevantFiles: ["views/validators.xml", "source/views/ValidatorsView.hx"]
		});

		ViewManager.instance.registerView({
			group: "Examples",
			title: "Simple Paint",
			smallIcon: "assets/icons/16/images.png",
			viewClass: SimplePaintView,
			relevantFiles: ["views/simple-paint.xml", "source/views/SimplePaintView.hx"]
		});
		ViewManager.instance.registerView({
			group: "Examples",
			title: "Todos",
			smallIcon: "assets/icons/16/radiobutton_group.png",
			viewClass: TodosView,
			relevantFiles: [
				"views/todos.xml",
				"source/views/TodosView.hx",
				"css/todos.css",
				"assets/images/unchecked.png",
				"assets/images/checked.png",
				"assets/images/delete.png"
			]
		});
		ViewManager.instance.registerView({
			group: "Examples",
			title: "Employee App",
			smallIcon: "assets/icons/16/dialog.png",
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
	}

	public override function onReady()
	{
		super.onReady();
		populateMainTree();
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
			var groupNode = mainTree.addNode({text: groupName});
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
}
