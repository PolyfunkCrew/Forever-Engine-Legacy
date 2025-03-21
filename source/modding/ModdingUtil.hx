package modding;

import polymod.Polymod;
import sys.FileSystem;
import flixel.FlxG;

class ModdingUtil
{
	public static inline function readDirectory(path:String):Array<String>
	{
		var files:Array<String> = [];
		if (FileSystem.exists(path))
			files = FileSystem.readDirectory(path);

		for (dir in Polymod.getLoadedModIds())
		{
			if (FileSystem.exists('mods/$dir/' + path.split("assets/")[1]))
			{
				for (file in FileSystem.readDirectory('mods/$dir/' + path.split("assets/")[1]))
				{
					if (!files.contains(file))
					{
						files.push(file);
					}
				}
			}
		}
		return files;
	}
}
