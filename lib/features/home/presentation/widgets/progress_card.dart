import 'package:flutex/core/constants/constants.dart';
import 'package:flutex/core/device/check_device_type.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/features/home/data/model/info_model.dart';
import 'package:flutex/features/home/presentation/widgets/info_card.dart';
import 'package:flutter/material.dart';

class HomeProgressCard extends StatefulWidget {
  const HomeProgressCard({super.key});

  @override
  State<HomeProgressCard> createState() => _HomeProgressCardState();
}

class _HomeProgressCardState extends State<HomeProgressCard> {
  List<IconData> iconDataList = [
    Icons.attach_money_rounded,
    Icons.task_outlined,
    Icons.move_up_rounded,
    Icons.dashboard_customize_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseQueryHelper.getCollectionsAsStream(
        collectionPath: Constants.info,
      ),
      builder: (context, snapshot) {
        List<InfoModel> infoModel =
            snapshot.data != null && snapshot.data!.isNotEmpty
                ? List<InfoModel>.from(
                    snapshot.data!.map((i) => InfoModel.fromJson(i)))
                : [];
        return snapshot.connectionState == ConnectionState.waiting
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isPhone ? 2 : 4,
                  crossAxisSpacing: context.isPhone ? 12.0 : 16,
                  mainAxisSpacing: context.isPhone ? 12.0 : 20,
                  childAspectRatio: context.isPhone ? 1.5 : 1.0,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: infoModel.length,
                itemBuilder: (context, index) {
                  return InfoCard(
                    info: infoModel[index],
                    icon: iconDataList[index],
                  );
                },
              );
      },
    );
  }
}
