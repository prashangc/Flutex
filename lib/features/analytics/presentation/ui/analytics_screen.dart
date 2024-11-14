import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/core/widgets/appbar/custom_appbar.dart';
import 'package:flutex/features/analytics/domain/entities/analytics_model.dart';
import 'package:flutex/features/analytics/domain/entities/summary_model.dart';
import 'package:flutex/features/analytics/domain/usecase/analytic_usecase.dart';
import 'package:flutex/features/analytics/presentation/widgets/add_analytics.dart';
import 'package:flutex/features/analytics/presentation/widgets/analytics_list.dart';
import 'package:flutex/features/analytics/presentation/widgets/summary_card.dart';
import 'package:flutex/features/home/domain/entities/drawable_model.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  final DrawableModel drawableModel;
  final AnalyticUsecase analyticUsecase =
      GetItServices.getIt<AnalyticUsecase>();
  AnalyticsScreen({
    super.key,
    required this.drawableModel,
  });

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  void initState() {
    widget.analyticUsecase.listOfStatus.clear();
    widget.analyticUsecase.listOfSummary.clear();
    super.initState();
  }

  @override
  void dispose() {
    widget.analyticUsecase.summaryStateBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kBackground,
      floatingActionButton: const AddAnalytics(),
      appBar: CustomAppbar(title: widget.drawableModel.title),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: StreamBuilder(
          stream: FirebaseQueryHelper.getCollectionsAsStream(
            collectionPath: widget.drawableModel.title.toLowerCase(),
          ),
          builder: (context, snapshot) {
            List<AnalyticsModel> analyticsList =
                snapshot.data != null && snapshot.data!.isNotEmpty
                    ? List<AnalyticsModel>.from(
                        snapshot.data!.map((i) => AnalyticsModel.fromJson(i)))
                    : [];
            widget.analyticUsecase.listOfStatus.clear();
            widget.analyticUsecase.listOfSummary.clear();
            for (int i = 0; i < analyticsList.length; i++) {
              if (analyticsList[i].status != null) {
                widget.analyticUsecase.addStatus(
                  status: analyticsList[i].status!,
                  isLastIndex: i == analyticsList.length - 1,
                );
              } else {
                List<SummaryModel> emptyList = [];
                widget.analyticUsecase.summaryStateBloc
                    .storeData(data: emptyList);
              }
              widget.analyticUsecase
                  .addDataToLocalDB(analyticsList: analyticsList[i]);
            }
            return StreamBuilder<dynamic>(
                initialData: null,
                stream: widget.analyticUsecase.summaryStateBloc.stateStream,
                builder: (stateCtx, summary) {
                  return Column(
                    children: [
                      summary.data == null ||
                              snapshot.connectionState ==
                                  ConnectionState.waiting
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: [
                                AnalyticSummary(
                                  drawableModel: widget.drawableModel,
                                  summaryList: summary.data,
                                ),
                                AnalyticsList(
                                  analyticsList: analyticsList,
                                  drawableModel: widget.drawableModel,
                                ),
                              ],
                            ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
