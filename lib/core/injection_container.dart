import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';

final apiServices = [
  Provider<NewsInterface>(create: (_) => NewsServiceImpl()),
];
