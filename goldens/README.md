A destination for golden file testing.

Use `dart run build_runner build -r` to build the golden files
and `dart run tool/update.dart` to update the golden files.

Currently when adding a new `a.dart` file, you must add a sibling
`a.template.dart.golden` and `a.js.golden` file.
