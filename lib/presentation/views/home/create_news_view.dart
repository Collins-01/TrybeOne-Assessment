import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trybeone_assessment/extensions/extensions.dart';
import 'package:trybeone_assessment/presentation/views/home/viewmodels/viewmodels.dart';
import 'package:trybeone_assessment/presentation/views/view_states/base_view.dart';
import 'package:trybeone_assessment/presentation/widgets/widgets.dart';
import 'package:trybeone_assessment/utils/utils.dart';
import '../../../core/data/remote/news/news.dart';

class CreateNewsView extends StatelessWidget {
  CreateNewsView({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      onModelDisposed: (vm) {
        _descriptionController.dispose();
        _titleController.dispose();
      },
      model: CreateNewsViewModel(
        Provider.of<NewsService>(context, listen: false),
      ),
      builder: (context, vm, child) {
        return SafeArea(
          child: LoaderPage(
            busy: vm.isBusy,
            child: Scaffold(
              appBar: AppBar(
                title: AppText.heading3("Create News"),
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizingConfig.defaultPadding),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: _titleController,
                          title: "Title",
                          validator: (e) => FieldValidators.string(e, 'Title'),
                          hintText: "Lazerpay shutdown...",
                        ),
                        AppTextField(
                          controller: _descriptionController,
                          maxLines: 6,
                          validator: (e) =>
                              FieldValidators.string(e, 'Description'),
                          title: "Description",
                          hintText:
                              "Labore incididunt ipsum in et commodo proident nisi consequat.",
                        ),
                        SizedBox(
                          height: context.getDeviceHeight / 10,
                        ),
                        AppLongButton(
                            title: "Create",
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (!formKey.currentState!.validate()) {
                                return;
                              }
                              vm.createNews(
                                _titleController.text,
                                _descriptionController.text,
                              );
                            })
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
