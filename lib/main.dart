import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';
// import 'package:trybeone_assessment/core/injection_container.dart';
import 'package:trybeone_assessment/presentation/presentation.dart';
// import 'package:trybeone_assessment/presentation/views/viewmodels.dart';
import 'navigations/navigations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<NewsService>.value(
          value: NewsServiceImpl(),
        ),
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
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TrybeOne Assessment',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeView(),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: RouteGenerators.generateRoutes,
    );
  }
}
