package meta;

import openfl.utils.Assets;
import meta.state.PlayState;

using StringTools;

#if sys
import sys.FileSystem;
import polymod.Polymod;
#end

using StringTools;

@:access(polymod.Polymod)
class CoolUtil
{
	public static final difficultyArray:Array<String> = ['EASY', "NORMAL", "HARD"];
	public static var difficultyLength = difficultyArray.length;

	public static inline function difficultyFromNumber(number:Int):String
	{
		return difficultyArray[number];
	}

	public static inline function dashToSpace(string:String):String
	{
		return string.replace("-", " ");
	}

	public static inline function spaceToDash(string:String):String
	{
		return string.replace(" ", "-");
	}

	public static inline function swapSpaceDash(string:String):String
	{
		return string.contains('-') ? dashToSpace(string) : spaceToDash(string);
	}

	public static inline function coolTextFile(path:String):Array<String>
	{
		var daList:Array<String> = Assets.getText(path).trim().split('\n');
		for (i in 0...daList.length)
			daList[i] = daList[i].trim();
		return daList;
	}

	public static inline function getOffsetsFromTxt(path:String):Array<Array<String>>
	{
		var fullText:String = Assets.getText(path);
		var firstArray:Array<String> = fullText.split('\n');
		var swagOffsets:Array<Array<String>> = [];

		for (i in firstArray)
			swagOffsets.push(i.split(' '));

		return swagOffsets;
	}

	public static inline function returnAssetsLibrary(library:String, ?subDir:String = 'assets/images'):Array<String>
	{
		var libraryArray:Array<String> = [];
		var mergedDir = '$subDir/$library';

		#if sys
		var unfilteredLibrary = FileSystem.readDirectory(mergedDir);

		for (folder in unfilteredLibrary)
		{
			if (!folder.contains('.'))
				libraryArray.push(folder);
		}

		// insert files added via Polymod.
		if (Polymod.assetLibrary != null)
		{
			for (modFolder in Polymod.getLoadedModIds())
			{
				if (FileSystem.exists('mods/$modFolder/' + mergedDir.split("assets/")[1]))
				{
					for (file in FileSystem.readDirectory('mods/$modFolder/' + mergedDir.split("assets/")[1]))
					{
						if (!libraryArray.contains(file) && !file.contains('.'))
								libraryArray.push(file);
					}
				}
			}
		}
		#end

		return libraryArray;
	}

	public static inline function getAnimsFromTxt(path:String):Array<Array<String>>
	{
		var fullText:String = Assets.getText(path);
		var firstArray:Array<String> = fullText.split('\n');
		var swagOffsets:Array<Array<String>> = [];

		for (i in firstArray)
			swagOffsets.push(i.split('--'));
		return swagOffsets;
	}

	public static function numberArray(max:Int, ?min = 0):Array<Int>
	{
		return [for (i in min...max) i];
	}

	public static function capitalize(str:String):String
	{
		return str.substr(0, 1).toUpperCase() + str.substr(1);
	}

	public static function createGroup()
		return new flixel.group.FlxGroup();

	public static function createSpriteGroup()
		return new flixel.group.FlxSpriteGroup();
}
