package util;

final class Util {
	@:noUsing public static function parseInt(v:Null<String>):Int {
		if (v == null)
			return 0;
		var i = Std.parseInt(v);
		if (i == null)
			return 0;
		else
			return i;
	}

	@:noUsing public static function parseFloat(v:Null<String>):Float {
		if (v == null)
			return 0;
		var f = Std.parseFloat(v);
		if (Math.isFinite(f))
			return f;
		else
			return 0.0;
	}

	@:noUsing public static macro function assert(expr:haxe.macro.Expr) {
		return if (haxe.macro.Context.defined("debug") || haxe.macro.Context.defined("assert")) {
			macro @:pos(expr.pos) if ($expr) {
				true;
			} else {
				throw "assert";
			}
		} else {
			macro @:pos(expr.pos) true;
		}
	}

	public static macro function with<T:{}>(object:ExprOf<T>, overrides:Array<Expr>):ExprOf<T> {
		var arr = [
			for (o in overrides)
				switch o {
					case macro $i{ident} = $expr:
						macro @:pos(o.pos) tmp.$ident = @:pos(expr.pos) $expr;
					default:
						throw new Error("Expected ident = expr", o.pos);
				}
		];
		return macro {
			var tmp = $object;
			$b{arr};
			tmp;
		}
	}

	// public static macro function with<T:{}>(object:ExprOf<T>, overrides:Array<Expr>):ExprOf<T> {
	// 	var type = Context.typeof(object);
	// 	var isanon = false;
	// 	var isclass = false;
	// 	var fields = switch type.follow() {
	// 		case TAnonymous(_.get() => anon):
	// 			isanon = true;
	// 			anon.fields;
	// 		case TInst(_.get() => t, params):
	// 			isclass = true;
	// 			t.fields.get();
	// 		default: throw new Error("Not an anonymous structure or a class instance", object.pos);
	// 	}
	// 	var objectDecl:Array<ObjectField> = [];
	// 	var overriden = new Map();
	// 	for (expr in overrides) {
	// 		switch expr {
	// 			case macro $i{fieldName} = $value:
	// 				objectDecl.push({field: fieldName, expr: value});
	// 				overriden[fieldName] = true;
	// 			case {expr: EDisplay(macro null, DKMarked), pos: p}: // toplevel completion
	// 				var remainingFieldsCT:ComplexType = isanon ? TAnonymous([
	// 					for (field in fields)
	// 						if (!overriden.exists(field.name)) {
	// 							pos: field.pos,
	// 							name: field.name,
	// 							doc: field.doc,
	// 							kind: FVar(field.type.toComplexType())
	// 						}
	// 				]) : type.toComplexType();
	// 				return {pos: p, expr: EDisplay({pos: p, expr: EField(macro(null : $remainingFieldsCT), "")}, DKDot)};
	// 			case {expr: EDisplay(_.expr => EField(_, fname), DKDot), pos: p}:
	// 				var remainingFieldsCT:ComplexType = isanon ? TAnonymous([
	// 					for (field in fields)
	// 						if (!overriden.exists(field.name)) {
	// 							pos: field.pos,
	// 							name: field.name,
	// 							doc: field.doc,
	// 							kind: FVar(field.type.toComplexType())
	// 						}
	// 				]) : type.toComplexType();
	// 				return {pos: p, expr: EDisplay({pos: p, expr: EField(macro(null : $remainingFieldsCT), fname)}, DKDot)}
	// 			default:
	// 				throw new Error("Invalid override expression, should be field=value", expr.pos);
	// 		}
	// 	}
	// 	if (isanon) {
	// 		for (field in fields) {
	// 			var fieldName = field.name;
	// 			if (!overriden.exists(fieldName)) {
	// 				objectDecl.push({field: fieldName, expr: macro @:pos(object.pos) tmp.$fieldName});
	// 			}
	// 		}
	// 		var expr = {expr: EObjectDecl(objectDecl), pos: Context.currentPos()};
	// 		var ct = type.toComplexType();
	// 		return macro @:pos(expr.pos) {
	// 			var tmp = $object;
	// 			$expr;
	// 			tmp;
	// 		};
	// 	} else {
	// 		return macro {
	// 			var tmp = $object;
	// 			$a{for(field in fields)}
	// 		}
	// 	}
	// }
}
