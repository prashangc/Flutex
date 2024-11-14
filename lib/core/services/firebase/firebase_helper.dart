import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/preference/shared_pref.dart';
import 'package:flutex/core/utils/snackbar/custom_snackbar.dart';

class FirebaseQueryHelper {
  FirebaseQueryHelper._();
  static final firebaseFireStore = FirebaseFirestore.instance;

  static Stream<List<Map<String, dynamic>>>? getCollectionsAsStream({
    required String collectionPath,
  }) {
    try {
      // return firebaseFireStore.collection(collectionPath).snapshots().map(
      //       (snapshot) => snapshot.docs,
      //     );
      return firebaseFireStore.collection(collectionPath).snapshots().map(
            (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
          );
    } on FirebaseException catch (e) {
      CustomSnackBar.showSnackBar(
        message: e.message ?? "Something Went Wrong!!",
      );
    }
    return null;
  }

  static Future<void> logout() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    try {
      // Sign out from Firebase
      await auth.signOut();
      PreferenceHelper.removeFromDevice(tokenKey: "rememberMe");
      Nav.push(route: Routes.login);
    } catch (e) {
      // Handle any errors, if needed
      log("Error signing out: $e");
    }
  }
}
