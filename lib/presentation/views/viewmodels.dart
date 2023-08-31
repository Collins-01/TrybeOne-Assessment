import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';
import 'package:trybeone_assessment/presentation/views/home/home.dart';

final viewModels = [
  ChangeNotifierProvider(
    create: (context) => HomeViewModel(
      Provider.of<NewsService>(context, listen: false),
    ),
  ),
];
