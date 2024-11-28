import 'package:ngdart/src/meta.dart';

/// A dependency injection token representing a unique ID for the application.
///
/// The identifier is used internally to apply CSS scoping behavior.
///
/// To avoid a randomly generated value, a custom value can be provided:
/// ```
/// import 'package:ngdart/angular.dart';
///
/// import 'main.template.dart' as ng;
///
/// @GenerateInjector(const [
///   ValueProvider.forToken(appId, 'my-unique-id')
/// ])
/// final InjectorFactory appInjector = appInjector$Injector;
///
/// void main() {
///   runApp(ng.AppComponentNgFactory, createInjector: appInjector);
/// }
/// ```
const appId = OpaqueToken<String>('appId');
