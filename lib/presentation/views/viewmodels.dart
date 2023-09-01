import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';

import 'home/home.dart';

final viewModelProviders = [
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(
      Provider.of<NewsService>(context, listen: false),
    ),
  ),
  ChangeNotifierProvider(
    create: (context) => CreateNewsViewModel(
      Provider.of<NewsService>(context, listen: false),
    ),
  ),
];
