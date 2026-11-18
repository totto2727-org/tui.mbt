# Upstream differences

This page is for maintainers of the TUI fork.

Upstream: [`mizchi/tui.mbt` at `d14b96ad732110f336cefdd77682a9d6ddb20877`](https://github.com/mizchi/tui.mbt/tree/d14b96ad732110f336cefdd77682a9d6ddb20877).

## Continuous integration

The fork fixes the `actions/checkout` version to a commit SHA, gives CI read-only access to repository contents, and prevents the checkout step from retaining credentials.
The workflow runs the same checks on Linux and Windows.
This configuration does not change the library source or its output.
