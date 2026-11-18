# Upstream differences

This page is for maintainers of the TUI fork.

Upstream: [`mizchi/tui.mbt` at `d14b96ad732110f336cefdd77682a9d6ddb20877`](https://github.com/mizchi/tui.mbt/tree/d14b96ad732110f336cefdd77682a9d6ddb20877).

## Continuous integration

The fork fixes the `actions/checkout` version to a commit SHA, gives CI read-only access to repository contents, and prevents the checkout step from retaining credentials.
The workflow runs the same checks on Linux and Windows.
This configuration does not change the library source or its output.

## MoonBit compatibility

- `moon.mod` sets dependency versions that MoonBit 20261117 can read and compile.
- The library calls `Debug` and `Show` traits directly where the compiler no longer accepts the method form.
- The library uses the current `#derive` syntax, string view method and buffer constructor argument.
- Black-box tests import their package APIs explicitly to preserve strict compiler checks.
- Standalone applications use current module manifests and build against the library from the same checkout.
- The API and terminal UI output do not change.
