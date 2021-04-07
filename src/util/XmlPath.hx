package util;

@:forward
abstract XmlPath(Xml) to Xml from Xml {
	private static inline var P = "PATH";
	public var path(get, never):String;

	inline function get_path():String
		return this.get(P);

	public inline function new(xml:Xml, _path:String) {
		this = xml;
		if(this.nodeType == Element) this.set("PATH",_path);
	}

	public inline function elements():Iterator<XmlPath> {
		return [for (el in this.elements()) new XmlPath(el, path)].iterator();
	}

	public function elementsNamed(name:String):Iterator<XmlPath> {
		return [for (el in this.elementsNamed(name)) new XmlPath(el, path)].iterator();
	}

	public function firstElement():XmlPath {
		return new XmlPath(this.firstElement(), path);
	}

	public function firstChild():XmlPath {
		return new XmlPath(this.firstChild(), path);
	}
}
