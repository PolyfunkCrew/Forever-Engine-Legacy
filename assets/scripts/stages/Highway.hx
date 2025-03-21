class Highway extends Stage
{
	var limo:FNFSprite;
	var grpLimoDancers:FlxTypedGroup<BackgroundDancer>;

	var danceDirs:Array<Bool> = [];

	override function new()
	{
		super();

		cameraZoom = 0.90;

		var skyBG:FNFSprite = new FNFSprite(-120, -50).loadGraphic(Paths.image('backgrounds/highway/limoSunset'));
		skyBG.scrollFactor.set(0.1, 0.1);
		add(skyBG);

		var bgLimo:FNFSprite = new FNFSprite(-200, 480);
		bgLimo.frames = Paths.getSparrowAtlas('backgrounds/highway/bgLimo');
		bgLimo.animation.addByPrefix('drive', "background limo pink", 24);
		bgLimo.animation.play('drive');
		bgLimo.scrollFactor.set(0.4, 0.4);
		add(bgLimo);

		grpLimoDancers = CoolUtil.createGroup();
		add(grpLimoDancers);

		for (i in 0...5)
		{
			var dancer:FNFSprite = new FNFSprite((370 * i) + 130, bgLimo.y - 400);

			dancer.frames = Paths.getSparrowAtlas("backgrounds/highway/limoDancer");
			dancer.animation.addByIndices('danceLeft', 'bg dancer sketch PINK', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
			dancer.animation.addByIndices('danceRight', 'bg dancer sketch PINK', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
			dancer.animation.play('danceLeft');
			dancer.antialiasing = true;
			dancer.scrollFactor.set(0.4, 0.4);
			
			danceDirs.push(false);
			grpLimoDancers.add(dancer);
		}

		var overlayShit:FNFSprite = new FNFSprite(-500, -600).loadGraphic(Paths.image('backgrounds/highway/limoOverlay'));
		overlayShit.alpha = 0.5;
		// add(overlayShit);

		// var shaderBullshit = new BlendModeEffect(new OverlayShader(), FlxColor.RED);

		// FlxG.camera.setFilters([new ShaderFilter(cast shaderBullshit.shader)]);

		// overlayShit.shader = shaderBullshit;

		var limoTex = Paths.getSparrowAtlas('backgrounds/highway/limoDrive');

		limo = new FNFSprite(-120, 550);
		limo.frames = limoTex;
		limo.animation.addByPrefix('drive', "Limo stage", 24);
		limo.animation.play('drive');
		limo.antialiasing = true;
		add(limo);

		PlayState.boyfriend.y -= 220;
		PlayState.boyfriend.x += 260;
		gfType = 'gf-car';
	}

	override function beatHit(beat:Int)
	{
		for (i in 0...grpLimoDancers.length)
		{
			danceDirs[i] = !danceDirs[i];

			if (danceDirs[i])
				grpLimoDancers.members[i].animation.play('danceRight', true);
			else
				grpLimoDancers.members[i].animation.play('danceLeft', true);
		}
	}
}
