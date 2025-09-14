package;

import lime.app.Event;
#if VIDEOS_ALLOWED
import hxcodec.flixel.FlxVideoSprite;
#else
import flixel.FlxSprite;
#end

// Wrapper for FlxVideoSprite, that calls onEndReached if Videos are not allowed, as to not break logic.
class FunkinVideo extends #if VIDEOS_ALLOWED FlxVideoSprite #else FlxSprite #end
{
    public var onEndReached(default, null):Event<Void->Void>;

    public function new(X:Float = 0, Y:Float = 0) 
    {
        super(X, Y);
        onEndReached = new Event<Void->Void>();
    }

    #if VIDEOS_ALLOWED
    public function playVideo(path:String, ?loop:Bool = false):Void
    {
        play(path, loop);
        bitmap.onEndReached.add(function() { onEndReached.dispatch(); });
    }
    #else
    public function playVideo(path:String, ?loop:Bool = false):Void
    {
        // immediately call onEnd since we can’t play
        onEndReached.dispatch();
    }
    #end
}