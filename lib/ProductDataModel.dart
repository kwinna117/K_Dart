class ProductDataModel {
  int? id;
  String? name;
  String? playlist;

  ProductDataModel({this.id, this.name, this.playlist});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    playlist = json['playlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['playlist'] = this.playlist;
    return data;
  }
}
