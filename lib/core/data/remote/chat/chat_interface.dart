import 'package:flutter/foundation.dart';

import 'connection_status_enum.dart';

abstract class ChatInterface {
  Future<void> initialize();
  Future<void> onMessage(Map<String, dynamic> data);
  Future<void> emitMessage(String data);
  ValueNotifier<SocketConnectionStatus> get connectionStatus;
}

abstract class ChatService implements ChatInterface {}
