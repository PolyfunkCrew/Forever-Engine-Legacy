class MallEvil extends Stage
{
	override function new()
	{
		super();

		var bg:FNFSprite = new FNFSprite(-400, -500).loadGraphic(Paths.image('backgrounds/mall/evilBG'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.2, 0.2);
		bg.active = false;
		bg.setGraphicSize(Std.int(bg.width * 0.8));
		bg.updateHitbox();
		add(bg);

		var evilTree:FNFSprite = new FNFSprite(300, -300).loadGraphic(Paths.image('backgrounds/mall/evilTree'));
		evilTree.antialiasing = true;
		evilTree.scrollFactor.set(0.2, 0.2);
		add(evilTree);

		var evilSnow:FNFSprite = new FNFSprite(-200, 700).loadGraphic(Paths.image("backgrounds/mall/evilSnow"));
		evilSnow.antialiasing = true;
		add(evilSnow);

		gfVersion = 'gf-christmas';

		PlayState.boyfriend.x += 320;
	}
}
