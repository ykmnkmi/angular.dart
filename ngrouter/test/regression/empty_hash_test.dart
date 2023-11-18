import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ngrouter/ngrouter.dart';
import 'package:test/test.dart';

@GenerateMocks([PlatformLocation])
import 'empty_hash_test.mocks.dart'; // ignore: uri_does_not_exist

void main() {
  late LocationStrategy locationStrategy;
  // ignore: undefined_class
  late MockPlatformLocation platformLocation;

  group("empty URL doesn't overwrite query parameters", () {
    setUp(() {
      // ignore: undefined_function
      platformLocation = MockPlatformLocation();
      locationStrategy = HashLocationStrategy(platformLocation, null);
      when(platformLocation.pathname).thenReturn('/foo');
      when(platformLocation.search).thenReturn('?bar=baz');
    });

    test('on push', () {
      locationStrategy.pushState(null, '', '', '');
      verify(platformLocation.pushState(null, '', '/foo?bar=baz'));
    });

    test('on replace', () {
      locationStrategy.replaceState(null, '', '', '');
      verify(platformLocation.replaceState(null, '', '/foo?bar=baz'));
    });
  });
}
