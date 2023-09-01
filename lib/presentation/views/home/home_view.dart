import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/core/data/remote/chat/chat.dart';
import 'package:trybeone_assessment/core/data/remote/news/news.dart';
import 'package:trybeone_assessment/extensions/extensions.dart';
import 'package:trybeone_assessment/navigations/navigations.dart';
import 'package:trybeone_assessment/presentation/views/home/viewmodels/home_viewmodel.dart';
import 'package:trybeone_assessment/presentation/views/view_states/base_view.dart';
import 'package:trybeone_assessment/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (vm) => vm.onModelReady(),
      model: HomeViewModel(
        // NewsServiceImpl(),
        newsService: Provider.of<NewsService>(context, listen: false),
        chatService: Provider.of<ChatService>(context, listen: false),
      ),
      builder: (context, vm, child) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                title: AppText.heading3("Hello Ann!"),
                actions: [
                  ValueListenableBuilder(
                    valueListenable: vm.connectionStatus,
                    builder: (context, status, child) => AppText.body(
                      status.name,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      NavigationService.instance
                          .navigateTo(NavigationRoutes.CREATE_NEWS);
                    },
                    child: AppText.body(
                      "Create",
                    ),
                  )
                ],
              ),
              body: ValueListenableBuilder(
                valueListenable: vm.newsList,
                builder: (context, newsList, child) {
                  return vm.state.when(
                    idle: () {
                      if (newsList.isNotEmpty) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizingConfig.defaultPadding),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ...List.generate(
                                    newsList.length,
                                    (index) => Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              AppImage(
                                                url: newsList[index].image,
                                                fit: BoxFit.cover,
                                                width: context.getDeviceWidth,
                                                height:
                                                    context.getDeviceHeight *
                                                        0.26,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(8),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        AppText.heading6(
                                                          newsList[index].title,
                                                        ),
                                                        AppText.caption(
                                                            newsList[index]
                                                                .author),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    AppText.body(
                                                      newsList[index]
                                                          .description,
                                                      maxLines: 2,
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.timer,
                                                          size: 15,
                                                          color: Colors.black
                                                              .withOpacity(.5),
                                                        ),
                                                        const SizedBox(
                                                          width: 5,
                                                        ),
                                                        AppText.caption(
                                                          timeago.format(
                                                              newsList[index]
                                                                  .timestamp),
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 5,
                                                    ),
                                                    Wrap(
                                                      alignment:
                                                          WrapAlignment.start,
                                                      children: [
                                                        ...List.generate(
                                                          newsList[index]
                                                              .tags
                                                              .length,
                                                          (i) => Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                              left: 4,
                                                              right: 4,
                                                            ),
                                                            child: AppText.caption(
                                                                "#${newsList[index].tags[i]}"),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ))
                              ],
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: AppText.heading5("No News"),
                      );
                    },
                    error: (e) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.heading3(e.title),
                        AppText.body(e.message),
                      ],
                    ),
                    busy: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              )),
        );
      },
    );
  }
}
