class UpdateLeadsStageResponseModel {
  int? id;
  String? name;
  dynamic orderWeight;

  UpdateLeadsStageResponseModel({this.id, this.name, this.orderWeight});

  UpdateLeadsStageResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderWeight = json['orderWeight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['orderWeight'] = this.orderWeight;
    return data;
  }
}
