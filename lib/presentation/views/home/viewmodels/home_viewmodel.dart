import 'package:flutter/foundation.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';
import 'package:trybeone_assessment/presentation/views/view_states/base_viewmodel.dart';
import '../../../../core/models/models.dart';

class HomeViewModel extends BaseViewModel {
  final NewsService _newsService;
  HomeViewModel(this._newsService);
  ValueNotifier<List<News>> get newsList => _newsService.newsList;
  fetchNews() async {
    await _newsService.fetchNews();
  }
}
