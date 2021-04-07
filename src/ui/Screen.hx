package ui;

import h2d.Flow;

class Screen extends Flow {
	override public function new() {
		super();
		this.fillWidth = this.fillHeight = true;
		this.horizontalAlign = this.verticalAlign = Middle;
	}

	inline function flow(...elements) {
		var f = new Flow();
		for (el in elements)
			f.addChild(el);
		return f;
	}

	inline function vbox(...elements) {
		var flow = new Flow();
		flow.layout = Vertical;
		flow.horizontalAlign = Middle;
		for (el in elements)
			flow.addChild(el);
		return flow;
	}
}
