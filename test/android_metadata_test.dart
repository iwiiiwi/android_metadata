import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:android_metadata/android_metadata.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.mianjiajia.com/android_metadata');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel,(MethodCall methodCall) async {
      return {'VENDOR': 'MIANJIAJIA'};
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel,null);
  });

  test('getMetaDataAsMap', () async {
    expect((await AndroidMetadata.metaDataAsMap)!['VENDOR'], 'MIANJIAJIA');
  });
}
