package funkin.modding;

#if MODDING_ALLOWED
import flixel.system.FlxModding;
import flixel.system.FlxBaseModpack;
import funkin.modding.SynapseModMetaDataFormat.SynapseCreditFormat;

@:buildModpack(SynapseModMetaDataFormat)
class SynapseModPack extends flixel.system.FlxBaseModpack<SynapseModMetaDataFormat> 
{
	public var title:String;

	public var description:String;

	public var contributors:Array<SynapseCreditFormat>;

	public var version:String;

    public var mod_type:String;

	override public function updateMetadata(?saveToDisk:Bool = true):Void
	{
		metadata.title = title;
		metadata.description = description;

		metadata.contributors = contributors;

		metadata.mod_version = version;
        metadata.mod_type = mod_type;

		if (saveToDisk != false)
		{
			FlxModding.system.fileSystem.setFileContent(metaDirectory(), metadata.toJsonString());
		}
	}

	override public function fromMetadata(metadata:SynapseModMetaDataFormat):FlxBaseModpack<SynapseModMetaDataFormat>
	{
        this.type = CUSTOM;
		this.metadata = metadata;

		this.title = metadata.title;
		this.description = metadata.description;

		this.contributors = metadata.contributors;

		this.version = metadata.mod_version;
        this.mod_type = metadata.mod_type;

		return this;
	}
}
#end