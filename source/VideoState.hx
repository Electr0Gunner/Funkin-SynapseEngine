package;

import flixel.FlxG;
import hxcodec.flixel.FlxVideoSprite;

class VideoState extends MusicBeatState
{
	var kickstarterVideo:FlxVideoSprite;

	public static var seenVideo:Bool = false;

	override function create()
	{
		super.create();

		seenVideo = true;

		FlxG.save.data.seenVideo = true;
		FlxG.save.flush();

		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		kickstarterVideo = new FlxVideoSprite();
		kickstarterVideo.play(Paths.video('kickstarterTrailer'));
		kickstarterVideo.bitmap.onEndReached.add(finishVid);
		add(kickstarterVideo);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
			finishVid();

		super.update(elapsed);
	}

	function finishVid():Void
	{
		kickstarterVideo.bitmap.dispose();
		TitleState.initialized = false;
		FlxG.switchState(new TitleState());
	}
}
