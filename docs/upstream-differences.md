# Upstream differences

This page is for maintainers of the TUI fork.

Upstream: [`mizchi/tui.mbt` at `d14b96ad732110f336cefdd77682a9d6ddb20877`](https://github.com/mizchi/tui.mbt/tree/d14b96ad732110f336cefdd77682a9d6ddb20877).

## Continuous integration

The fork uses the [MoonBit repository template](https://github.com/totto2727-org/template-moonbit-simple) instead of the upstream workflows.
CI uses the locked Nix toolchain to check formatting, check types, build, and run tests on Linux.
Pushes to `main` publish `totto2727/tui` to Mooncakes when `MOONCAKES_TOKEN` is set.
FlakeHub publication is disabled.

## MoonBit compatibility

- `moon.mod` maintains the fork's compatible `mizchi/css`, `moonbitlang/async`, and `moonbitlang/x` versions for stable MoonBit 0.10.22 from the locked official Nix overlay. Standalone example manifests retain their existing external dependency pins.
- The library calls `Debug` and `Show` traits directly where the compiler no longer accepts the method form.
- The library uses the current `#derive` syntax, string view method and buffer constructor argument.
- Black-box tests import their package APIs explicitly to preserve strict compiler checks.
- Standalone applications use current module manifests and build against the library from the same checkout.
- Five JavaScript examples omit unused `moonbitlang/async` imports to pass strict checks on MoonBit 0.10.22. This does not change example behavior.
- The API and terminal UI output do not change.

## Mooncakes identity

Use `totto2727/tui` for module dependencies and package imports.
The editor uses `totto2727/syntree` for syntax highlighting.
The terminal buffer and protocol retain their upstream module names.
