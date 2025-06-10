class GetLeadsStagesResponseModel {
  Metadata? mMetadata;
  List<Stages>? stages;

  GetLeadsStagesResponseModel({this.mMetadata, this.stages});

  GetLeadsStagesResponseModel.fromJson(Map<String, dynamic> json) {
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
    if (json['stages'] != null) {
      stages = <Stages>[];
      json['stages'].forEach((v) {
        stages!.add(new Stages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    if (this.stages != null) {
      data['stages'] = this.stages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  String? collection;
  int? offset;
  int? limit;
  int? total;

  Metadata({this.collection, this.offset, this.limit, this.total});

  Metadata.fromJson(Map<String, dynamic> json) {
    collection = json['collection'];
    offset = json['offset'];
    limit = json['limit'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collection'] = this.collection;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    data['total'] = this.total;
    return data;
  }
}

class Stages {
  int? id;
  String? name;
  Null? orderWeight;

  Stages({this.id, this.name, this.orderWeight});

  Stages.fromJson(Map<String, dynamic> json) {
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
