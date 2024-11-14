class InvoiceModel {
  String? title;
  String? value;
  String? progress;

  InvoiceModel({this.title, this.value, this.progress});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['progress'] = progress;
    return data;
  }
}
