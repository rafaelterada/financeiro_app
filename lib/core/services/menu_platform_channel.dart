import 'package:flutter/services.dart';

class MenuPlatformChannel {
  var platform = const MethodChannel('unique.identifier.method/openmenu');

  Future<String> callMenuChannel() async =>
      await platform.invokeMethod('openMenu');
}
