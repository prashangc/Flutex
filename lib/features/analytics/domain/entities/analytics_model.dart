import 'package:isar/isar.dart';

part 'analytics_model.g.dart';

@collection
class AnalyticsModel {
  Id dbId = Isar.autoIncrement;
  String? amount;
  String? description;
  String? name;
  String? status;
  String? title;
  bool? isCustomer;
  bool? showProgressBar;

  AnalyticsModel({
    this.amount,
    this.description,
    this.name,
    this.status,
    this.title,
    this.isCustomer,
    this.showProgressBar,
  });

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) => AnalyticsModel(
        amount: json['amount'],
        description: json['description'],
        name: json['name'],
        status: json['status'],
        title: json['title'],
        isCustomer: json['isCustomer'],
        showProgressBar: json['showProgressBar'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['description'] = description;
    data['name'] = name;
    data['status'] = status;
    data['title'] = title;
    data['isCustomer'] = isCustomer;
    data['showProgressBar'] = showProgressBar;
    return data;
  }
}
