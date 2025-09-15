package funkin.modding;

#if MODDING_ALLOWED
@:buildMetadata("mod_metadata.json", "icon_mod.png")
class SynapseModMetaDataFormat extends flixel.system.FlxBaseMetadataFormat
{
    public var title:String;
    public var description:String;

    public var mod_type:String;

    public var contributors:Array<SynapseCreditFormat> = [];

	public var api_version:String;
	public var mod_version:String;

	override public function toJsonString():String
	{
		var buf = new StringBuf();

        buf.add('{\n'); 
        buf.add('\t"title": "' + this.title + '",\n');
        buf.add('\t"description": "' + this.description + '",\n');
        buf.add('\n\t"contributors": [\n');

        for (index in 0...this.contributors.length) 
        {
            var contributor = this.contributors[index];
            buf.add('\t\t{\n');
            buf.add('\t\t\t"name": "' + contributor.name + '",\n');
            buf.add('\t\t\t"role": "' + contributor.role + '",\n');
            buf.add('\t\t\t"url": "' + contributor.url + '"\n');
            buf.add('\t\t}');

            if (index < this.contributors.length - 1)
            {
                buf.add(',\n\n');
            }
        }

        buf.add('\n\t],\n');
        buf.add('\n\t"api_version": "' + this.api_version + '",\n');
        buf.add('\t"mod_version": "' + this.mod_version + '",\n');
        buf.add('\t"mod_type": "' + this.mod_type + '",\n');
        buf.add('}');

        return buf.toString();
	}

	override public function fromDynamicData(data:Dynamic):SynapseModMetaDataFormat
    {
		this.title = data.title;

        this.description = data.description;
        this.contributors = data.contributors;

		this.api_version = data.api_version;
		this.mod_version = data.mod_version;
        this.mod_type = data.mod_type;

        return this;
    }
}

typedef SynapseCreditFormat = 
{
    var name:String;
    var role:String;
    var url:String;
}
#end