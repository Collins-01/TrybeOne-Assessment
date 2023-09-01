import 'package:flutter/foundation.dart';
import 'package:trybeone_assessment/core/data/remote/chat/chat_interface.dart';
import 'package:trybeone_assessment/core/data/remote/chat/connection_status_enum.dart';
import 'package:trybeone_assessment/core/network_service/network_service.dart';
import 'package:trybeone_assessment/presentation/views/view_states/base_viewmodel.dart';
import 'package:trybeone_assessment/presentation/views/view_states/view_model_state.dart';
import '../../../../core/data/remote/news/news.dart';
import '../../../../core/models/models.dart';

class HomeViewModel extends BaseViewModel {
  final NewsService newsService;
  final ChatService chatService;
  HomeViewModel({required this.newsService, required this.chatService});
  ValueNotifier<List<News>> get newsList => newsService.newsList;
  ValueNotifier<SocketConnectionStatus> get connectionStatus =>
      chatService.connectionStatus;

  onModelReady() async {
    await _fetchNews();
    await chatService.initialize();
  }

  _fetchNews() async {
    try {
      changeState(const ViewModelState.busy());
      await newsService.fetchNews();
      // await Future.delayed(const Duration(seconds: 2));
      changeState(const ViewModelState.idle());
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
    } catch (e) {
      final error = UserDefinedExceptions('Error', 'An unkown error occurred.');
      changeState(ViewModelState.error(error));
    }
  }
}
