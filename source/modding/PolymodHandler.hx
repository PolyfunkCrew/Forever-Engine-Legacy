package modding;

import polymod.backends.PolymodAssets.PolymodAssetType;
import polymod.format.ParseRules.LinesParseFormat;
import polymod.format.ParseRules.TextFileFormat;
import polymod.format.ParseRules;
import polymod.Polymod;
import sys.FileSystem;
import flixel.FlxG;

class PolymodHandler
{
	private static final MOD_ROOT:String = 'mods';

	public static var loadedMods:Array<String> = [];

	public static function init():Void
	{
		if (!FileSystem.exists(MOD_ROOT))
		{
			trace('Mods Folder Missing! Creating $MOD_ROOT folder...');
			FileSystem.createDirectory(MOD_ROOT);
		}
		loadedMods = FileSystem.readDirectory(MOD_ROOT);
		trace("Initializing ModHandler...");

		Polymod.init({
			// Root directory for all mods.
			modRoot: MOD_ROOT,
			// Call this function any time an error occurs.
			errorCallback: onPolymodError,
			// List of filenames to ignore in mods. Use the default list to ignore the metadata file, etc.
			ignoredFiles: Polymod.getDefaultIgnoreList(),
			useScriptedClasses: true
		});

		Polymod.loadOnlyMods(loadedMods);
	}

	static function onPolymodError(error:PolymodError):Void
	{
		// Perform an action based on the error code.
		switch (error.code)
		{
			case MISSING_ICON:
			default:
				// Log the message based on its severity.
				switch (error.severity)
				{
					case NOTICE:
					case WARNING:
						trace(error.message, null);
					case ERROR:
						trace(error.message, null);
				}
		}
	}
}
