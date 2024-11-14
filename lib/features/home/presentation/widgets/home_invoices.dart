import 'package:flutex/config/theme/colors.dart';
import 'package:flutex/core/constants/constants.dart';
import 'package:flutex/core/services/firebase/firebase_helper.dart';
import 'package:flutex/core/widgets/size/size.dart';
import 'package:flutex/core/widgets/text/custom_text.dart';
import 'package:flutex/features/home/data/model/invoice_model.dart';
import 'package:flutex/features/home/presentation/widgets/linear_progress_item.dart';
import 'package:flutter/material.dart';

class HomeInvoices extends StatelessWidget {
  const HomeInvoices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.kLightGrey,
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: StreamBuilder(
        stream: FirebaseQueryHelper.getCollectionsAsStream(
          collectionPath: Constants.invoice,
        ),
        builder: (context, snapshot) {
          List<InvoiceModel> invoiceModel =
              snapshot.data != null && snapshot.data!.isNotEmpty
                  ? List<InvoiceModel>.from(
                      snapshot.data!.map((i) => InvoiceModel.fromJson(i)))
                  : [];
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.document_scanner,
                        ),
                        sizedBox16(),
                        const CustomText(
                          text: "Invoices",
                          fontSize: 14.0,
                          isBold: true,
                        ),
                      ],
                    ),
                    ListView.builder(
                      itemCount: invoiceModel.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, i) {
                        return LinearProgressCard(invoice: invoiceModel[i]);
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }
}
