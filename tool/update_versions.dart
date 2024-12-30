import 'dart:io';

final packageEntryRe = RegExp('^  (\\w+): (.+)\$', multiLine: true);

void main() {
  var versionsUri = Uri(path: 'tool/package_versions.yaml');
  var resolvedVersionsUri = Directory.current.uri.resolveUri(versionsUri);
  var versionsFile = File.fromUri(resolvedVersionsUri);

  var versions = <String, String>{};

  for (var version in versionsFile.readAsLinesSync()) {
    if (version.isEmpty) {
      continue;
    }

    var parts = version.split(':');
    versions[parts[0]] = parts[1].trimLeft();
  }

  String replace(Match match) {
    return '  ${match[1]}: ${versions[match[1]]}';
  }

  void update(Directory directory) {
    var pubspecFile = File.fromUri(directory.uri.resolve('pubspec.yaml'));

    if (pubspecFile.existsSync()) {
      var oldPubspec = pubspecFile.readAsStringSync();
      var newContent = oldPubspec.replaceAllMapped(packageEntryRe, replace);
      pubspecFile.writeAsStringSync(newContent);
    }
  }

  Directory.current
      .listSync(recursive: true)
      .whereType<Directory>()
      .forEach(update);
}
