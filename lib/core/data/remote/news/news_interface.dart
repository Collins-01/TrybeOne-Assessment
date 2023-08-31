import 'package:flutter/foundation.dart';
import 'package:trybeone_assessment/core/models/data_models/data_models.dart';
import 'package:trybeone_assessment/core/models/dtos/create_news.dto.dart';

abstract class NewsInterface {
  Future<News> createNews(CreateNewsDTO dto);
  Future<List<News>> fetchNews();
  ValueNotifier<List<News>> get newsList;
}

abstract class NewsService implements NewsInterface {}
