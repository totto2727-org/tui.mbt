///|
/// TUI Event types for luna integration

///|
/// Mouse button
pub(all) enum MouseButton {
  Left
  Right
  Middle
}

///|
/// TUI Event - passed to event handlers
pub(all) enum TuiEvent {
  /// Mouse click event
  Click(x~ : Int32, y~ : Int32, button~ : MouseButton)
  /// Mouse hover event
  Hover(x~ : Int32, y~ : Int32, id~ : String)
  /// Key press event
  Key(key~ : String, modifiers~ : Int32)
}

///|
/// Type alias for luna Node with TuiEvent and TuiAttrValue
pub type TuiNode = @luna.Node[TuiEvent, TuiAttrValue]

///|
/// Type alias for luna Attr with TuiEvent and TuiAttrValue
pub type TuiAttr = @luna.Attr[TuiEvent, TuiAttrValue]

///|
/// Type alias for luna EventHandler with TuiEvent
pub type TuiHandler = @luna.EventHandler[TuiEvent]
