import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/chat/chat.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';

final independentServices = [
  Provider<NewsService>.value(
    value: NewsServiceImpl(),
  ),
  Provider<ChatService>.value(
    value: ChatServiceImpl(),
  )
];
