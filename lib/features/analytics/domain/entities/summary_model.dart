class SummaryModel {
  String? title;
  int? count;

  SummaryModel({required this.title, required this.count});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['count'] = count;
    return data;
  }
}
