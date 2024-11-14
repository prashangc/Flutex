import 'package:flutex/core/services/database/isar_setup.dart';
import 'package:flutex/core/services/state/state_handler_bloc.dart';
import 'package:flutex/features/analytics/domain/entities/analytics_model.dart';
import 'package:flutex/features/analytics/domain/entities/summary_model.dart';
import 'package:isar/isar.dart';

class AnalyticUsecase {
  StateHandlerBloc summaryStateBloc = StateHandlerBloc();
  static Isar isar = IsarSetup.isar!;

  List<SummaryModel> listOfSummary = [];
  List<String> listOfStatus = [];

  void addStatus({
    required String status,
    required bool isLastIndex,
  }) {
    if (!listOfStatus.contains(status)) {
      listOfStatus.add(status);
      listOfSummary.add(
        SummaryModel(
          title: status,
          count: 1,
        ),
      );
    } else {
      // .;
      int index =
          listOfSummary.indexWhere((element) => element.title == status);
      listOfSummary[index].count = listOfSummary[index].count! + 1;
    }

    if (isLastIndex) {
      summaryStateBloc.storeData(data: listOfSummary);
    }
  }

  void addDataToLocalDB({required AnalyticsModel analyticsList}) async {
    List<AnalyticsModel> dataInDatabase = await getDataFromLocalDB();
    if (!dataInDatabase.contains(analyticsList)) {
      isar.writeTxn(() async => await isar.analyticsModels.put(analyticsList));
    }
  }

  Future<List<AnalyticsModel>> getDataFromLocalDB() async {
    List<AnalyticsModel> data = await isar.analyticsModels.where().findAll();
    return data;
  }
}
