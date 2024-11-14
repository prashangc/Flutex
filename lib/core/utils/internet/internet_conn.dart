import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class CheckInternetConnection {
  static listenInternetState({required Function performTask}) async {
    Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult>? result) async {
        if (result!.contains(ConnectivityResult.none)) {
          performTask();
        } else {
          await hasInternet();
        }
      },
    );
  }

  static Future<bool> hasInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      return await isInternetActuallyWorking();
    }
    return false;
  }

  static Future<bool> isInternetActuallyWorking() async {
    try {
      Dio dio = Dio();
      Response response = await dio
          .get('https://google.com')
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      return false;
    } on SocketException catch (_) {
      return false;
    } on Exception catch (_) {
      return false;
    }
  }
}
