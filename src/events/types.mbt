///|
/// Event types for TUI applications

///|
/// Key modifiers
#derive(Debug)
pub(all) enum KeyModifier {
  None
  Shift
  Ctrl
  Alt
  CtrlShift
  CtrlAlt
  ShiftAlt
  CtrlShiftAlt
}

///|
fn[T : Debug] show_debug(value : T, logger : &Logger) -> Unit {
  Show::output(value.to_repr(), logger)
}

///|
pub impl Show for KeyModifier with fn output(
  self : KeyModifier,
  logger : &Logger,
) -> Unit {
  show_debug(self, logger)
}

///|
/// Special keys
#derive(Debug)
pub(all) enum SpecialKey {
  Up
  Down
  Left
  Right
  Home
  End
  PageUp
  PageDown
  Insert
  Delete
  Tab
  BackTab
  Backspace
  Enter
  Escape
  F(Int32)
}

///|
pub impl Show for SpecialKey with fn output(self : SpecialKey, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Keyboard event
#derive(Debug)
pub(all) enum KeyEvent {
  Char(Char, KeyModifier)
  Special(SpecialKey, KeyModifier)
}

///|
pub impl Show for KeyEvent with fn output(self : KeyEvent, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Mouse button
#derive(Debug)
pub(all) enum MouseButton {
  Left
  Middle
  Right
  ScrollUp
  ScrollDown
  None
}

///|
pub impl Show for MouseButton with fn output(
  self : MouseButton,
  logger : &Logger,
) -> Unit {
  show_debug(self, logger)
}

///|
/// Mouse event type
#derive(Debug)
pub(all) enum MouseEventType {
  Press
  Release
  Move
  Drag
}

///|
pub impl Show for MouseEventType with fn output(
  self : MouseEventType,
  logger : &Logger,
) -> Unit {
  show_debug(self, logger)
}

///|
/// Mouse event
#derive(Debug)
pub(all) struct MouseEvent {
  button : MouseButton
  event_type : MouseEventType
  x : Int32
  y : Int32
  modifier : KeyModifier
}

///|
pub impl Show for MouseEvent with fn output(self : MouseEvent, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Input event
#derive(Debug)
pub(all) enum InputEvent {
  Key(KeyEvent)
  Mouse(MouseEvent)
  Resize(Int32, Int32)
  Unknown(String)
}

///|
pub impl Show for InputEvent with fn output(self : InputEvent, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Hit test result
pub(all) struct HitTestResult {
  id : String
  x : Int32
  y : Int32
  width : Int32
  height : Int32
  role : @core.Role?
}

///|
/// Focus state for the application
pub(all) enum FocusState {
  None
  Focused(String) // Component ID
}

///|
/// Input mode for the application
pub(all) enum InputMode {
  Normal // Raw mode, full keyboard control
  Editing // Non-raw mode, IME enabled
}
