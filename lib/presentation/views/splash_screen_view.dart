import 'package:flutter/material.dart';
import 'package:trybeone_assessment/navigations/navigations.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    _onModelReady();
  }

  _onModelReady() async {
    await Future.delayed(const Duration(seconds: 3));
    NavigationService.instance.navigateToReplace(NavigationRoutes.HOME);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            AppText.heading3("TrybeOne"),
            const Expanded(child: SizedBox()),
            const CircularProgressIndicator.adaptive(),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
