package modding;

import polymod.Polymod;
import sys.FileSystem;

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

		addDefaultImports();

		Polymod.init({
			// Root directory for all mods.
			modRoot: MOD_ROOT,
			// Call this function any time an error occurs.
			errorCallback: onPolymodError,
			// List of filenames to ignore in mods. Use the default list to ignore the metadata file, etc.
			ignoredFiles: Polymod.getDefaultIgnoreList(),
			useScriptedClasses: true,
			framework: OPENFL
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
					default:
						trace(error.message);
					/*
					case NOTICE:
						trace()
					case WARNING:
						trace(error.message);
					case ERROR:
						trace(error.message);
					*/
				}
		}
	}

	static function addDefaultImports()
	{
		// Flixel
		Polymod.addDefaultImport(flixel.FlxG);
		Polymod.addDefaultImport(flixel.FlxSprite);
		Polymod.addDefaultImport(flixel.sound.FlxSound);
		Polymod.addDefaultImport(flixel.tweens.FlxTween);
		Polymod.addDefaultImport(flixel.group.FlxGroup);
		Polymod.addDefaultImport(flixel.group.FlxSpriteGroup);

		// Forever Engine
		Polymod.addDefaultImport(Main);

		Polymod.addDefaultImport(ForeverAssets);
		Polymod.addDefaultImport(ForeverTools);
		Polymod.addDefaultImport(Paths);

		Polymod.addDefaultImport(meta.Controls);
		Polymod.addDefaultImport(meta.CoolUtil);

		// Polymod.addDefaultImport(meta.MusicBeat);
		Polymod.addDefaultImport(meta.state.PlayState);

		Polymod.addDefaultImport(gameObjects.Stage);
		Polymod.addDefaultImport(gameObjects.Character);

		Polymod.addDefaultImport(meta.data.Conductor);
		Polymod.addDefaultImport(meta.data.dependency.FNFSprite);
	}
}
