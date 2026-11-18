///|
struct Viewport {
  mut top : Int32
  mut height : Int32
}

///|
fn Viewport::new(height : Int32) -> Viewport {
  let h = if height > 0 { height } else { 1 }
  { top: 0, height: h, }
}

///|
fn Viewport::set_height(self : Viewport, height : Int32) -> Unit {
  let h = if height > 0 { height } else { 1 }
  self.height = h
}

///|
fn Viewport::clamp_top(self : Viewport, total_lines : Int32) -> Unit {
  let max_top = if total_lines > self.height {
    total_lines - self.height
  } else {
    0
  }
  if self.top < 0 {
    self.top = 0
  } else if self.top > max_top {
    self.top = max_top
  }
}

///|
fn Viewport::range(self : Viewport, total_lines : Int32) -> (Int32, Int32) {
  let start = self.top
  let end = if total_lines < start + self.height {
    total_lines
  } else {
    start + self.height
  }
  (start, end)
}

///|
fn Viewport::ensure_visible(
  self : Viewport,
  line : Int32,
  total_lines : Int32,
) -> Unit {
  if line < self.top {
    self.top = line
  } else if line >= self.top + self.height {
    self.top = line - self.height + 1
  }
  self.clamp_top(total_lines)
}

///|
fn Viewport::scroll(
  self : Viewport,
  delta : Int32,
  total_lines : Int32,
) -> Unit {
  self.top = self.top + delta
  self.clamp_top(total_lines)
}
