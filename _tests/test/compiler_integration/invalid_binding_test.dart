import 'package:_tests/compiler.dart';
import 'package:ngcompiler/v2/context.dart';
import 'package:test/test.dart';

void main() {
  setUp(CompileContext.overrideForTesting);

  test('should require integer value for "tabindex"', () async {
    await compilesExpecting('''
      import '$ngImport';

      @Component(
        selector: 'test',
        template: '<div tabindex="foo"></div>',
      )
      class TestComponent {}
    ''', errors: [
      contains('The "tabindex" attribute expects an integer value'),
    ]);
  });
}
