package funkin.ui;

import flixel.FlxG;
import funkin.objects.FunkinVideo;

class VideoState extends MusicBeatState
{
	var kickstarterVideo:FunkinVideo;

	public static var seenVideo:Bool = false;

	override function create()
	{
		super.create();

		seenVideo = true;

		FlxG.save.data.seenVideo = true;
		FlxG.save.flush();

		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		kickstarterVideo = new FunkinVideo();
		kickstarterVideo.onEndReached.add(finishVid);
		kickstarterVideo.playVideo(Paths.video('kickstarterTrailer'));
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
		kickstarterVideo.destroy();
		remove(kickstarterVideo);
		TitleState.initialized = false;
		FlxG.switchState(new TitleState());
	}
}
