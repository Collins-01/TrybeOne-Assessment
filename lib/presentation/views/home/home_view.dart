import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/extensions/context_extension.dart';
import 'package:trybeone_assessment/presentation/views/home/viewmodels/viewmodels.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';
import 'package:trybeone_assessment/utils/sizing_config.dart';
import '../../../extensions/extensions.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // final viewModel = context.watch<HomeViewModel>();
    return Consumer<HomeViewModel>(
      builder: (context, vm, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: AppText.heading3("Hello Ann!"),
              actions: [
                TextButton(
                  onPressed: () {},
                  child: AppText.body(
                    "Create",
                  ),
                )
              ],
            ),
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                        10,
                        (index) => Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: context.getDeviceHeight * 0.3,
                                    width: context.getDeviceWidth,
                                    decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.heading6("Title"),
                                      AppText.caption("BBC"),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  AppText.body(
                                    "Magna fugiat aute dolore non dolore magna nulla nisi. Sunt elit pariatur labore eiusmod fugiat. Non ullamco sit ex laborum consequat velit nulla quis ipsum culpa. Nulla officia esse et adipisicing cupidatat Lorem consectetur. Sint sit ipsum minim esse exercitation culpa velit commodo laborum deserunt voluptate dolore in. Deserunt occaecat sit duis nostrud proident duis sunt cillum mollit nulla.",
                                    maxLines: 2,
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.timer,
                                        size: 15,
                                        color: Colors.black.withOpacity(.5),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      AppText.caption("13:57")
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Wrap(
                                    children: [
                                      ...List.generate(
                                        8,
                                        (index) => Padding(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                          ),
                                          child: AppText.caption("#BBC"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
