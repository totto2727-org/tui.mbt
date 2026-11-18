///|
/// Edit action for text input

///|
/// Actions that can be performed on text input
#derive(Debug, Eq)
pub(all) enum EditAction {
  Insert(String)
  DeleteBackward // Backspace
  DeleteForward // Delete
  DeleteToLineStart // Ctrl+U
  DeleteToLineEnd // Ctrl+K
  MoveCursorLeft
  MoveCursorRight
  MoveCursorUp
  MoveCursorDown
  MoveToLineStart // Ctrl+A / Home
  MoveToLineEnd // Ctrl+E / End
  Confirm // Enter (single-line) or Shift+Enter (multiline)
  Cancel // Escape
  Tab
  BackTab // Shift+Tab
  ForceQuit // Ctrl+C
  NewLine // Enter (multiline mode)
  None
}

///|
fn[T : Debug] show_debug(value : T, logger : &Logger) -> Unit {
  Show::output(value.to_repr(), logger)
}

///|
pub impl Show for EditAction with fn output(self : EditAction, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Line info for text wrapping and rendering
#derive(Debug, Eq)
pub(all) struct LineInfo {
  start_idx : Int32
  chars : Array[Char]
}

///|
pub impl Show for LineInfo with fn output(self : LineInfo, logger : &Logger) -> Unit {
  show_debug(self, logger)
}

///|
/// Display state for rendering
#derive(Debug)
pub(all) struct DisplayState {
  lines : Array[LineInfo]
  cursor_line : Int32
  cursor_col : Int32
  scroll_offset : Int32
  has_more_above : Bool
  has_more_below : Bool
  total_lines : Int32
}

///|
pub impl Show for DisplayState with fn output(
  self : DisplayState,
  logger : &Logger,
) -> Unit {
  show_debug(self, logger)
}

///|
/// Configuration for text input
#derive(Debug)
pub(all) struct TextInputConfig {
  mut width : Int32
  mut height : Int32
  multiline : Bool
  confirm_on_shift_enter : Bool
  esc_cancels : Bool
}

///|
pub impl Show for TextInputConfig with fn output(
  self : TextInputConfig,
  logger : &Logger,
) -> Unit {
  show_debug(self, logger)
}

///|
/// Create default config
pub fn TextInputConfig::new(
  width : Int32,
  height : Int32,
  multiline~ : Bool = false,
  confirm_on_shift_enter~ : Bool = false,
  esc_cancels~ : Bool = true,
) -> TextInputConfig {
  { width, height, multiline, confirm_on_shift_enter, esc_cancels, }
}
