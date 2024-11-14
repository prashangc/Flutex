import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutex/config/route/nav.dart';
import 'package:flutex/config/route/routes.dart';
import 'package:flutex/core/utils/snackbar/custom_snackbar.dart';
import 'package:flutex/features/home/domain/entities/drawable_model.dart';
import 'package:flutter/material.dart';

class HomeUsecase {
  final List<DrawableModel> listOfOnboardingData = [
    const DrawableModel(
      title: "Customers",
      iconData: Icons.group_outlined,
    ),
    const DrawableModel(
      title: "Projects",
      iconData: Icons.task_outlined,
    ),
    const DrawableModel(
      title: "Invoices",
      iconData: Icons.assignment_outlined,
    ),
    const DrawableModel(
      title: "Contracts",
      iconData: Icons.article_outlined,
    ),
    const DrawableModel(
      title: "Tickets",
      iconData: Icons.confirmation_number_outlined,
    ),
    const DrawableModel(
      title: "Leads",
      iconData: Icons.markunread_mailbox_outlined,
    ),
    const DrawableModel(
      title: "Estimates",
      iconData: Icons.add_chart_outlined,
    ),
    const DrawableModel(
      title: "Proposals",
      iconData: Icons.document_scanner_outlined,
    ),
    const DrawableModel(
      title: "Payments",
      iconData: Icons.account_balance_wallet_outlined,
    ),
    const DrawableModel(
      title: "Items",
      iconData: Icons.add_box_outlined,
    ),
    const DrawableModel(
      title: "Settings",
      iconData: Icons.account_circle_outlined,
    ),
    const DrawableModel(
      title: "Logout",
      isLogout: true,
      iconData: Icons.logout,
    ),
  ];

  final user = FirebaseAuth.instance.currentUser;

  String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  // check if firebase-auth expired
  void checkIfAuthExpired() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    if (currentUser == null) {
      Future.delayed(const Duration(seconds: 0), () {
        Nav.push(route: Routes.login);
        CustomSnackBar.showSnackBar(message: "Login Session Expired !!!");
      });
    }
  }
}
