package views;

import haxe.Resource;
import haxe.ui.components.Image;
import haxe.ui.containers.Box;
import haxe.ui.containers.ScrollView;
import haxe.ui.containers.TabView;
import haxe.ui.core.Component;
import util.Logger;

using StringTools;

typedef ViewInfo =
{
	var title:String;
	var smallIcon:String;
	var largeIcon:String;
	var viewClass:Class<View>;
	@:optional var relevantFiles:Array<String>;
	@:optional var group:String;
	@:optional var subGroup:String;
}

class ViewManager
{
	private static var _instance:ViewManager;
	public static var instance(get, null):ViewManager;

	private static function get_instance():ViewManager
	{
		if (_instance == null)
		{
			_instance = new ViewManager();
		}
		return _instance;
	}

	public var viewTabs:TabView = null;

	public function new() {}

	public var views:Array<ViewInfo> = [];
	public var viewGroups:Map<String, Array<ViewInfo>> = [];
	public var viewGroupNames:Array<String> = [];

	public function registerView(info:ViewInfo)
	{
		var groupName = info.group;
		if (groupName == null)
		{
			groupName = "Ungrouped";
		}
		views.push(info);

		if (info.subGroup == null)
		{
			var list = viewGroups.get(groupName);
			if (list == null)
			{
				list = [];
				viewGroups.set(groupName, list);
				viewGroupNames.push(groupName);
			}
			list.push(info);
		}
	}

	public function getItemsFromSubGroup(subGroup:String):Array<ViewInfo>
	{
		var items = [];
		for (v in views)
		{
			if (v.subGroup == subGroup)
			{
				items.push(v);
			}
		}
		return items;
	}

	private var _currentView:View = null;

	public function showView(info:ViewInfo)
	{
		viewTabs.removeAllPages();

		var viewContainer = new Box();
		viewContainer.percentWidth = 100;
		viewContainer.percentHeight = 100;
		viewContainer.addClass("view-container");
		viewContainer.text = info.title;
		viewContainer.icon = info.smallIcon;

		var scrollview = new ScrollView();
		scrollview.addClass("view-container-scrollview");
		// scrollview.addClass("borderless");
		scrollview.percentWidth = 100;
		scrollview.percentHeight = 100;
		scrollview.percentContentWidth = 100;
		viewContainer.addComponent(scrollview);

		var view:View = Type.createInstance(info.viewClass, []);
		view.percentWidth = 100;
		if (view.percentHeight == 100)
		{
			scrollview.percentContentHeight = 100;
		}
		if (view.hasClass("default-background"))
		{
			scrollview.addClass("default-background");
			viewContainer.addClass("default-background");
			viewTabs.findComponent("tabview-content", Component).addClass("default-background");
		}
		// view.percentHeight = 100;
		scrollview.addComponent(view);
		scrollview.addClass("borderless");

		viewTabs.addComponent(viewContainer);
		viewTabs.pageIndex = 0;

		for (f in info.relevantFiles)
		{
			createRelevantFileView(f);
		}

		Logger.clear();

		if (_currentView != null)
		{
			@:privateAccess _currentView.onHidden();
		}
		_currentView = view;
		@:privateAccess _currentView.onShown();
	}

	private function createRelevantFileView(file:String)
	{
		var ext = file.split(".").pop();
		if (ext == "hx" || ext == "xml" || ext == "css" || ext == "properties")
		{
			return;
		}

		var viewContainer = new Box();
		var label = file;
		label = label.replace("source/fakedata/", "");
		label = label.replace("source/views/", "");
		label = label.replace("fakeemployeeapp/", "");
		label = label.replace("source/custom/", "");
		label = label.replace("source/windows/", "");
		label = label.replace("views/", "");
		label = label.replace("css/", "");
		label = label.replace("images/", "");
		label = label.replace("locales/", "");

		viewContainer.text = label;
		viewContainer.icon = iconForExtension(ext);
		viewContainer.percentWidth = 100;
		viewContainer.percentHeight = 100;

		if (ext == "png")
		{
			var viewer = new Box();
			viewer.percentWidth = 100;
			viewer.percentHeight = 100;
			var image = new Image();
			image.verticalAlign = "center";
			image.horizontalAlign = "center";
			image.resource = file;
			viewer.addComponent(image);
			viewContainer.addComponent(viewer);
		}

		viewTabs.addComponent(viewContainer);
	}

	private function iconForExtension(ext:String):String
	{
		var icon = "icons/svg/file-unknown.png";
		switch (ext)
		{
			case "xml":
				icon = "icons/svg/file-xml.png";
			case "hx" | "haxe":
				icon = "icons/svg/file-text.png";
			case "css":
				icon = "icons/svg/file-text.png";
			case "png":
				icon = "icons/svg/file-image.png";
		}
		return icon;
	}
}
