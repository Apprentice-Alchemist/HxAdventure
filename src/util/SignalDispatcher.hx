package util;

@:forward
abstract SignalType<T>(String) from String to String {}

/**
 * A basic signal
 */
@:nullSafety
class Signal<V> {
	public var name:String;

	/**
	 * Wether the signal has been cancelled
	 */
	public var cancelled(default, null):Bool = false;

	public var value:Null<V>;
	public var dispatcher:Null<SignalDispatcher>;

	public function new(name:String, ?value:Null<V>) {
		this.name = name;
		this.value = value;
	}

	/**
	 * Cancels the signal, so that it won't be propagated further
	 */
	public function cancel() {
		cancelled = true;
	}
}


@:nullSafety
class SignalDispatcher {
	var eventMap:Map<String, Array<Signal<Dynamic>->Void>> = new Map();

	public function new() {}

	/**
	 * Dispatches a signal
	 * ```haxe
	 * instance.dispatch(new Signal("base"))
	 * ```
	 * @param s the signal you want to send
	 */
	public function dispatch<T>(s:Signal<T>):Void {
		s.dispatcher = this;
		@:privateAccess s.cancelled = false;
		if (eventMap.exists(s.name))
			@:nullSafety(Off) for (o in eventMap.get(s.name)) {
				o(s);
				if (s.cancelled)
					break;
			}
	}

	/**
		Listen for a signal

		@param name The name of the signal you want to listen for
		@param cb The call back

	**/
	public function listen<T>(name:SignalType<T>, cb:Signal<T>->Void):Void {
		if (eventMap.exists(name))
			@:nullSafety(Off) {
			eventMap.get(name).unshift(cast cb);
		} else {
			eventMap.set(name, [cast cb]);
		}
	}

	/**
	 * Removes a listener
	 */
	public function removeListener<T>(name:SignalType<T>, cb:Signal<T>->Void):Void {
		if (eventMap.exists(name)) {
			@:nullSafety(Off) for (o in eventMap.get(name)) {
				if (Reflect.compareMethods(o, cb)) {
					eventMap.get(name).remove(o);
				}
			}
		}
	}

	/**
	 * Checks wether a listener has been registered
	 *
	 * @param name
	 */
	public function hasListener<T>(name:SignalType<T>):Bool {
		return eventMap.exists(name) ? @:nullSafety(Off) eventMap.get(name).length > 0 : false;
	}
}
