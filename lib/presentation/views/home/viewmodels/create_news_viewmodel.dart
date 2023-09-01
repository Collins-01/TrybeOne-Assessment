import 'package:trybeone_assessment/core/data/remote/news/news.dart';
import 'package:trybeone_assessment/core/models/dtos/create_news.dto.dart';
import 'package:trybeone_assessment/navigations/navigations.dart';
import 'package:trybeone_assessment/presentation/views/view_states/view_states.dart';

import '../../../../core/network_service/network_service.dart';

class CreateNewsViewModel extends BaseViewModel {
  final NewsService _newsService;
  CreateNewsViewModel(this._newsService);

  createNews(String title, String description) async {
    try {
      changeState(const ViewModelState.busy());
      await _newsService.createNews(
        CreateNewsDTO(
          title: title,
          description: description,
          tags: [
            ...List.generate(10, (index) => "BBC News"),
          ],
        ),
      );
      // await Future.delayed(const Duration(seconds: 2));
      changeState(const ViewModelState.idle());
      NavigationService.instance.goBack();
    } on Failure catch (e) {
      changeState(ViewModelState.error(e));
    } catch (e) {
      final error = UserDefinedExceptions('Error', 'An unkown error occurred.');
      changeState(ViewModelState.error(error));
    }
  }
}
