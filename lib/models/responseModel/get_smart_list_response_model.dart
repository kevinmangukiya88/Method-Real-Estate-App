class GetSmartListResponseModel {
  Metadata? mMetadata;
  List<Smartlists>? smartlists;

  GetSmartListResponseModel({this.mMetadata, this.smartlists});

  GetSmartListResponseModel.fromJson(Map<String, dynamic> json) {
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
    if (json['smartlists'] != null) {
      smartlists = <Smartlists>[];
      json['smartlists'].forEach((v) {
        smartlists!.add(new Smartlists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    if (this.smartlists != null) {
      data['smartlists'] = this.smartlists!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  String? collection;
  int? offset;
  int? limit;

  Metadata({this.collection, this.offset, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    collection = json['collection'];
    offset = json['offset'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['collection'] = this.collection;
    data['offset'] = this.offset;
    data['limit'] = this.limit;
    return data;
  }
}

class Smartlists {
  int? id;
  int? createdById;
  String? created;
  String? name;
  bool? isFub2;
  String? description;
  Null? defaultSmartListId;
  Null? condition;
  String? sortBy;
  String? sortOrder;
  int? count;
  String? type;
  int? orderValue;
  List<SharedWithTeams>? sharedWithTeams;
  List<SharedWith>? sharedWith;

  Smartlists(
      {this.id,
        this.createdById,
        this.created,
        this.name,
        this.isFub2,
        this.description,
        this.defaultSmartListId,
        this.condition,
        this.sortBy,
        this.sortOrder,
        this.count,
        this.type,
        this.orderValue,
        this.sharedWithTeams,
        this.sharedWith});

  Smartlists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdById = json['createdById'];
    created = json['created'];
    name = json['name'];
    isFub2 = json['isFub2'];
    description = json['description'];
    defaultSmartListId = json['defaultSmartListId'];
    condition = json['condition'];
    sortBy = json['sortBy'];
    sortOrder = json['sortOrder'];
    count = json['count'];
    type = json['type'];
    orderValue = json['orderValue'];
    if (json['sharedWithTeams'] != null) {
      sharedWithTeams = <SharedWithTeams>[];
      json['sharedWithTeams'].forEach((v) {
        sharedWithTeams!.add(new SharedWithTeams.fromJson(v));
      });
    }
    if (json['sharedWith'] != null) {
      sharedWith = <SharedWith>[];
      json['sharedWith'].forEach((v) {
        sharedWith!.add(new SharedWith.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdById'] = this.createdById;
    data['created'] = this.created;
    data['name'] = this.name;
    data['isFub2'] = this.isFub2;
    data['description'] = this.description;
    data['defaultSmartListId'] = this.defaultSmartListId;
    data['condition'] = this.condition;
    data['sortBy'] = this.sortBy;
    data['sortOrder'] = this.sortOrder;
    data['count'] = this.count;
    data['type'] = this.type;
    data['orderValue'] = this.orderValue;
    if (this.sharedWithTeams != null) {
      data['sharedWithTeams'] =
          this.sharedWithTeams!.map((v) => v.toJson()).toList();
    }
    if (this.sharedWith != null) {
      data['sharedWith'] = this.sharedWith!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SharedWithTeams {
  int? teamId;

  SharedWithTeams({this.teamId});

  SharedWithTeams.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_id'] = this.teamId;
    return data;
  }
}

class SharedWith {
  int? userId;

  SharedWith({this.userId});

  SharedWith.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    return data;
  }
}
