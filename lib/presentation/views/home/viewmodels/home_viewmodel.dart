import 'package:flutter/foundation.dart';
import 'package:trybeone_assessment/core/network_service/network_service.dart';
import 'package:trybeone_assessment/presentation/views/view_states/base_viewmodel.dart';
import 'package:trybeone_assessment/presentation/views/view_states/view_model_state.dart';
import '../../../../core/data/remote/news/news.dart';
import '../../../../core/models/models.dart';

class HomeViewModel extends BaseViewModel {
  final NewsService _newsService;
  HomeViewModel(this._newsService);
  ValueNotifier<List<News>> get newsList => _newsService.newsList;
  fetchNews() async {
    try {
      changeState(const ViewModelState.busy());
      await _newsService.fetchNews();
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
