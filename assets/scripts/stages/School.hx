class School extends Stage
{
	var bgGirls:FNFSprite;

	override function new()
	{
		super();

		var bgSky = new FNFSprite().loadGraphic(Paths.image('backgrounds/school/weebSky'));
		bgSky.scrollFactor.set(0.1, 0.1);
		add(bgSky);

		var repositionShit = -200;

		var bgSchool:FNFSprite = new FNFSprite(repositionShit, 0).loadGraphic(Paths.image('backgrounds/school/weebSchool'));
		bgSchool.scrollFactor.set(0.6, 0.90);
		add(bgSchool);

		var bgStreet:FNFSprite = new FNFSprite(repositionShit).loadGraphic(Paths.image('backgrounds/school/weebStreet'));
		bgStreet.scrollFactor.set(0.95, 0.95);
		add(bgStreet);

		var fgTrees:FNFSprite = new FNFSprite(repositionShit + 170, 130).loadGraphic(Paths.image('backgrounds/school/weebTreesBack'));
		fgTrees.scrollFactor.set(0.9, 0.9);
		add(fgTrees);

		var bgTrees:FNFSprite = new FNFSprite(repositionShit - 380, -800);
		var treetex = Paths.getPackerAtlas('backgrounds/school/weebTrees');
		bgTrees.frames = treetex;
		bgTrees.animation.add('treeLoop', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 12);
		bgTrees.animation.play('treeLoop');
		bgTrees.scrollFactor.set(0.85, 0.85);
		add(bgTrees);

		var treeLeaves:FNFSprite = new FNFSprite(repositionShit, -40);
		treeLeaves.frames = Paths.getSparrowAtlas('backgrounds/school/petals');
		treeLeaves.animation.addByPrefix('leaves', 'PETALS ALL', 24, true);
		treeLeaves.animation.play('leaves');
		treeLeaves.scrollFactor.set(0.85, 0.85);
		add(treeLeaves);

		var widShit = Std.int(bgSky.width * 6);

		bgSky.setGraphicSize(widShit);
		bgSchool.setGraphicSize(widShit);
		bgStreet.setGraphicSize(widShit);
		bgTrees.setGraphicSize(Std.int(widShit * 1.4));
		fgTrees.setGraphicSize(Std.int(widShit * 0.8));
		treeLeaves.setGraphicSize(widShit);

		fgTrees.updateHitbox();
		bgSky.updateHitbox();
		bgSchool.updateHitbox();
		bgStreet.updateHitbox();
		bgTrees.updateHitbox();
		treeLeaves.updateHitbox();

		bgGirls = new FNFSprite(-100, 190);
		bgGirls.scrollFactor.set(0.9, 0.9);

		bgGirls.frames = Paths.getSparrowAtlas('backgrounds/school/bgFreaks');

		if (PlayState.SONG.song.toLowerCase() == "roses")
		{
			bgGirls.animation.addByIndices('danceLeft', 'BG fangirls dissuaded', CoolUtil.numberArray(14), "", 24, false);
			bgGirls.animation.addByIndices('danceRight', 'BG fangirls dissuaded', CoolUtil.numberArray(30, 15), "", 24, false);
		}
		else
		{
			bgGirls.animation.addByIndices('danceLeft', 'BG girls group', CoolUtil.numberArray(14), "", 24, false);
			bgGirls.animation.addByIndices('danceRight', 'BG girls group', CoolUtil.numberArray(30, 15), "", 24, false);
		}
		bgGirls.animation.play('danceLeft');

		bgGirls.setGraphicSize(Std.int(bgGirls.width * 6));
		bgGirls.updateHitbox();
		add(bgGirls);

		gfType = 'gf-pixel';
		PlayState.boyfriend.x += 200;
		PlayState.boyfriend.y += 220;
		PlayState.opponent.x += 200;
		PlayState.opponent.y += 580;
		PlayState.gf.x += 200;
		PlayState.gf.y += 320;
	}

	override function beatHit(beat:Int)
	{
		if (bgGirls.animation.curAnim.name == 'danceRight')
			bgGirls.animation.play('danceLeft');
		else
			bgGirls.animation.play('danceRight');
	}
}
