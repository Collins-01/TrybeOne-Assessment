import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';
import 'package:trybeone_assessment/core/data/remote/news/news_interface.dart';
import 'package:trybeone_assessment/core/models/data_models/news_model.dart';
import 'package:trybeone_assessment/core/models/dtos/create_news.dto.dart';

class NewsServiceImpl extends NewsService {
  final ValueNotifier<List<News>> _newsList = ValueNotifier([]);
  final _delay = const Duration(seconds: 2);
  final _faker = Faker();
  @override
  Future<News> createNews(CreateNewsDTO dto) async {
    final news = News(
      id: _faker.guid.guid(),
      title: dto.title,
      description: dto.description,
      timestamp: DateTime.now(),
      tags: dto.tags,
      image: _faker.image.image(),
      author: _faker.person.name(),
    );
    await Future.delayed(_delay);
    _newsList.value.insert(0, news);

    return news;
  }

  @override
  Future<List<News>> fetchNews() async {
    await Future.delayed(_delay);
    return _newsList.value;
  }

  @override
  ValueNotifier<List<News>> get newsList => _newsList;
}
