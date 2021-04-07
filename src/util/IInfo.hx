package util;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;

using Lambda;
#end

#if !macro
@:autoBuild(util.IInfo.build())
@:remove
interface IInfo {}
#else
class IInfo {
	public static function build() {
		var fields = haxe.macro.Context.getBuildFields();

		var lexprs = [];
		for (field in fields) {
			if (field.meta != null && field.meta.exists(m -> m.name == ":xml")) {
				switch field.kind {
					case FVar(t, e):
						var ge = switch t {
							// @formatter:off
							case macro :Int: macro {
								var i = Std.parseInt(xml.get($v{field.name}));
								if(i == null)
									throw "expected an integer for attribute " + $v{field.name};
								else i;
							};
							case macro :Float: macro {
								var i = Std.parseFloat(xml.get($v{field.name}));
								if(!Math.isFinite(f))
									throw "expected a float for attribute " + $v{field.name};
								else f;
							};
							case macro :String: macro xml.get($v{field.name});
							case macro :Bool: macro xml.get($v{field.name}) == "true";
							// @formatter:on
							case _.toType() => TAbstract(_.get() => a, _) if (a.meta.has(":enum")):
								{
									expr: ESwitch(macro xml.get($v{field.name}), [
										for (f in a.impl.get().statics.get())
											if (f.meta.has(":enum")) {
												values: [macro $v{f.name}],
												expr: macro $i{field.name} = $i{f.name}
											}

									],
										macro throw "invalid enum value for " + $v{field.name} + " : " + xml.get($v{field.name})),
									pos: (macro null).pos
								}
							default: null;
						}
						if (ge != null) {
							if (e != null) {
								lexprs.push(macro {
									if (xml.exists($v{field.name}))
										$i{field.name} = $ge;
									else
										$i{field.name} = $e;
								});
							} else {
								lexprs.push(macro {
									if (xml.exists($v{field.name}))
										$i{field.name} = $ge;
									else
										throw "did not find attribute " + $v{field.name};
								});
							}
							continue;
						}
					default:
				}
				Context.warning("Could not resolve xml loader for this field.", field.pos);
			}
		}

		fields.push({
			name: "load",
			kind: FFun({
				args: [
					{
						name: "xml",
						type: macro:util.XmlPath
					}
				],
				expr: macro $b{lexprs}
			}),
			pos: (macro null).pos
		});
		return fields;
	}
}
#end
