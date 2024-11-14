class InfoModel {
  String? total;
  String? value;
  String? title;
  String? progress;

  InfoModel({this.total, this.value, this.title, this.progress});

  InfoModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    value = json['value'];
    title = json['title'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['value'] = value;
    data['title'] = title;
    data['progress'] = progress;
    return data;
  }
}
