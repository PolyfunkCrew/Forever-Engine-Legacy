class Spooky extends Stage
{
	// ....there are no lighting in Week2...??
	var halloweenBG:FNFSprite;

	override function new()
	{
		super();
		
		var hallowTex = Paths.getSparrowAtlas('backgrounds/spooky/halloween_bg');

		halloweenBG = new FNFSprite(-200, -100);
		halloweenBG.frames = hallowTex;
		halloweenBG.animation.addByPrefix('idle', 'halloweem bg0');
		halloweenBG.animation.addByPrefix('lightning', 'halloweem bg lightning strike', 24, false);
		halloweenBG.animation.play('idle');
		halloweenBG.antialiasing = true;
		add(halloweenBG);
	}
}
