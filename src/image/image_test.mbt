///|
test "base64_encode bytes" {
  let bytes = Bytes::from_array([
    Int32::to_byte(1),
    Int32::to_byte(2),
    Int32::to_byte(3),
  ])
  let view = bytes[:]
  assert_eq(@image.base64_encode(view), "AQID")
}

///|
test "clamp_rect keeps bounds" {
  let rect = @image.image_rect(-5, 10, 20, 20)
  let clamped = @image.clamp_rect(30, 25, rect)
  assert_eq(clamped, @image.image_rect(0, 5, 20, 20))
}

///|
test "center_rect positions" {
  let rect = @image.center_rect(100, 80, 30, 10)
  assert_eq(rect, @image.image_rect(35, 35, 30, 10))
}
