
import 'dart:io';

import 'package:flutter/services.dart';

class IvsPlayerController {
  final MethodChannel _channel = const MethodChannel('com.example.ivs_player');
  final int viewId = 0;


  Future<void> play(String url) async {
     if (Platform.isAndroid) {
    await _channel.invokeMethod('play', {'url': url, 'viewId': viewId});
  } else if (Platform.isIOS) {
    await _channel.invokeMethod('play', {'url': url});
  }
  }

    Future<void> dispose() async {
      if (Platform.isAndroid) {
    await _channel.invokeMethod('dispose', {'viewId': viewId});
  } else if (Platform.isIOS) {
    await _channel.invokeMethod('dispose');
  }
  }
}
