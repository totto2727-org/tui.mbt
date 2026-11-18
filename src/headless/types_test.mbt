///|
test "resolve_button_state: default when no hover or focus" {
  let state = @headless.resolve_button_state("btn-1", "")
  assert_eq(state, @headless.ButtonState::Default)
}

///|
test "resolve_button_state: hovered when hover_id matches" {
  let state = @headless.resolve_button_state("btn-1", "btn-1")
  assert_eq(state, @headless.ButtonState::Hovered)
}

///|
test "resolve_button_state: focused via FocusNav" {
  let focus = @headless.FocusNav::new(["btn-1", "btn-2"])
  let state = @headless.resolve_button_state("btn-1", "", focus=Some(focus))
  assert_eq(state, @headless.ButtonState::Focused)
}

///|
test "resolve_button_state: hover takes priority over focus" {
  let focus = @headless.FocusNav::new(["btn-1", "btn-2"])
  // btn-1 is focused AND hovered -> should be Hovered
  let state = @headless.resolve_button_state(
    "btn-1",
    "btn-1",
    focus=Some(focus),
  )
  assert_eq(state, @headless.ButtonState::Hovered)
}

///|
test "resolve_button_state: non-focused non-hovered is default" {
  let focus = @headless.FocusNav::new(["btn-1", "btn-2"])
  // btn-2 is neither focused (btn-1 is current) nor hovered
  let state = @headless.resolve_button_state("btn-2", "", focus=Some(focus))
  assert_eq(state, @headless.ButtonState::Default)
}

///|
test "resolve_button_state: disabled overrides hover" {
  let state = @headless.resolve_button_state("btn-1", "btn-1", disabled=true)
  assert_eq(state, @headless.ButtonState::Disabled)
}

///|
test "resolve_button_state: disabled overrides focus" {
  let focus = @headless.FocusNav::new(["btn-1"])
  let state = @headless.resolve_button_state(
    "btn-1",
    "",
    focus=Some(focus),
    disabled=true,
  )
  assert_eq(state, @headless.ButtonState::Disabled)
}

///|
test "resolve_button_state: hover on different id shows focused" {
  let focus = @headless.FocusNav::new(["btn-1", "btn-2"])
  // btn-1 is focused, btn-2 is hovered -> btn-1 should be Focused
  let state = @headless.resolve_button_state(
    "btn-1",
    "btn-2",
    focus=Some(focus),
  )
  assert_eq(state, @headless.ButtonState::Focused)
}

///|
test "resolve_button_state: hover on different id shows hovered" {
  let focus = @headless.FocusNav::new(["btn-1", "btn-2"])
  // btn-1 is focused, btn-2 is hovered -> btn-2 should be Hovered
  let state = @headless.resolve_button_state(
    "btn-2",
    "btn-2",
    focus=Some(focus),
  )
  assert_eq(state, @headless.ButtonState::Hovered)
}
