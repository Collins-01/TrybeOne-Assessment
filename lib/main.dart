import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/independent_services.dart';
import 'package:trybeone_assessment/presentation/presentation.dart';
import 'package:trybeone_assessment/presentation/views/viewmodels.dart';
import 'navigations/navigations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ...independentServices,
        ...viewModelProviders,
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
