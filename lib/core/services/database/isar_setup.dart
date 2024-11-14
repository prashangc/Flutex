import 'package:flutex/features/analytics/domain/entities/analytics_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarSetup {
  static Isar? isar;
  static void initializeIsarDb() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [AnalyticsModelSchema],
      directory: dir.path,
      // inspector: true, // to show info in debug console
    );
  }
}
