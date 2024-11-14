import 'package:flutex/core/injector/dependency_injection.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/features/home/domain/usecase/home_usecase.dart';
import 'package:flutex/features/home/presentation/widgets/home_appbar.dart';
import 'package:flutex/features/home/presentation/widgets/home_drawable_menu.dart';
import 'package:flutex/features/home/presentation/widgets/home_invoices.dart';
import 'package:flutex/features/home/presentation/widgets/profile_card.dart';
import 'package:flutex/features/home/presentation/widgets/progress_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final HomeUsecase homeUsecase = GetItServices.getIt<HomeUsecase>();
  final bool? checkAuthTimeout;
  HomeScreen({super.key, this.checkAuthTimeout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    if (widget.checkAuthTimeout == true) {}
    super.initState();
  }

  @override
  void dispose() {
    _key.currentState!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: HomeDrawerMenu(homeUsecase: widget.homeUsecase),
      appBar: HomeAppbar(
        callback: () {
          _key.currentState!.openDrawer();
        },
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            HomeProfileCard(homeUsecase: widget.homeUsecase),
            sizedBox16(),
            const HomeProgressCard(),
            sizedBox24(),
            const HomeInvoices(),
          ],
        ),
      ),
    );
  }
}
