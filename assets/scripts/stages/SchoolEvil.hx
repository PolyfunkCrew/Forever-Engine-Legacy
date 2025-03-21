class SchoolEvil extends Stage
{
	override function new()
	{
		super();

		var bg:FNFSprite = new FNFSprite(400, 200);
		bg.frames = Paths.getSparrowAtlas('backgrounds/schoolEvil/animatedEvilSchool');
		bg.animation.addByPrefix('idle', 'background 2', 24);
		bg.animation.play('idle');
		bg.scrollFactor.set(0.8, 0.9);
		bg.scale.set(6, 6);
		add(bg);

		gfType = 'gf-pixel';
		PlayState.opponent.x -= 150;
		PlayState.opponent.y += 50;
		PlayState.boyfriend.x += 200;
		PlayState.boyfriend.y += 220;
		PlayState.gf.x += 180;
		PlayState.gf.y += 300;
	}
}
