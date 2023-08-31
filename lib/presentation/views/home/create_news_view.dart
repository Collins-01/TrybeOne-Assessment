import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';

class CreateNewsView extends StatelessWidget {
  const CreateNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: AppText.heading3("Create News"),
            ),
          ),
        );
      },
    );
  }
}
