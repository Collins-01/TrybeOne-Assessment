import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:trybeone_assessment/core/data/remote/chat/chat_interface.dart';
import 'package:trybeone_assessment/core/data/remote/chat/connection_status_enum.dart';
import 'package:trybeone_assessment/utils/utils.dart';

// ignore: constant_identifier_names
const BASE_URL = 'https://socket.trybeone.ng:3003/chats';

class ChatServiceImpl extends ChatService {
  final _logger = appLogger(ChatServiceImpl);
  late Socket _socket;
  final String _messageEvent = 'message';
  final ValueNotifier<SocketConnectionStatus> _connectionStatus =
      ValueNotifier(SocketConnectionStatus.Connecting);
  @override
  Future<void> initialize() async {
    _logger.d("Initializing ChatService.......");

    _socket = io(
      BASE_URL,
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .build(),
    );

    _socket.onConnect((data) {
      _logger.d(
        "Socket Connection Established ",
      );
      _connectionStatus.value = SocketConnectionStatus.Connected;
    });
    _socket.onReconnect(
      (_) async {
        _connectionStatus.value = SocketConnectionStatus.Reconnecting;
        _logger.i(
          "Socket Reconnecting........",
          functionName: "_socket.onReconnect",
        );
      },
    );
    _socket.onDisconnect(
      (data) {
        _connectionStatus.value = SocketConnectionStatus.Disconnected;
        _logger.e("Socket Disconnected......",
            error: data, functionName: "_socket.onDisconnect");
      },
    );

    _socket.onConnectError(
      (data) {
        _logger.e("Socket Connection Error ",
            functionName: "onConnectError", error: data);
      },
    );
    _socket.on(_messageEvent, (data) => onMessage(data));

    _socket.connect();
    // ignore: unused_local_variable
    Timer timer;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_socket.connected) {
        _socket.connect();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Future<void> emitMessage(String data) async {
    _socket.emit(_messageEvent, {data});
  }

  @override
  Future<void> onMessage(Map<String, dynamic> data) async {
    _logger.d("Incomming Data ::: $data");
  }

  @override
  ValueNotifier<SocketConnectionStatus> get connectionStatus =>
      _connectionStatus;
}
