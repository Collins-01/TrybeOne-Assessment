// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:trybeone_assessment/core/models/data_models/data_models.dart';
import 'package:trybeone_assessment/extensions/extensions.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';

class NewsCard extends StatelessWidget {
  final News news;
  NewsCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final date = DateFormat('dd/MM/yyyy h:mm');
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppImage(
            url: news.image,
            fit: BoxFit.cover,
            width: context.getDeviceWidth,
            height: context.getDeviceHeight * 0.26,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.heading6(
                      news.title,
                    ),
                    AppText.caption(news.author),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                AppText.body(
                  news.description,
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
                      width: 5,
                    ),
                    AppText.caption(date.format(news.timestamp))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    ...List.generate(
                      news.tags.length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(
                          left: 4,
                          right: 4,
                        ),
                        child: AppText.caption("#${news.tags[i]}"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
