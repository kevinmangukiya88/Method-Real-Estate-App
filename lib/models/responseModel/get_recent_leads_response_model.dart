class GetRecentLeadsResponseModel {
  Metadata? mMetadata;
  List<Events>? events;

  GetRecentLeadsResponseModel({this.mMetadata, this.events});

  GetRecentLeadsResponseModel.fromJson(Map<String, dynamic> json) {
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
    if (json['events'] != null) {
      events = <Events>[];
      json['events'].forEach((v) {
        events!.add(new Events.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    if (this.events != null) {
      data['events'] = this.events!.map((v) => v.toJson()).toList();
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

class Events {
  int? id;
  String? created;
  String? updated;
  int? fubId;
  String? occured;
  int? leadId;
  int? leadPropertyId;
  Null? message;
  Null? description;
  Null? noteId;
  String? source;
  String? type;
  Null? pageTitle;
  Null? pageUrl;
  int? pageDuration;
  Property? property;
  Lead? lead;

  Events(
      {this.id,
        this.created,
        this.updated,
        this.fubId,
        this.occured,
        this.leadId,
        this.leadPropertyId,
        this.message,
        this.description,
        this.noteId,
        this.source,
        this.type,
        this.pageTitle,
        this.pageUrl,
        this.pageDuration,
        this.property,
        this.lead});

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    fubId = json['fub_id'];
    occured = json['occured'];
    leadId = json['lead_id'];
    leadPropertyId = json['lead_property_id'];
    message = json['message'];
    description = json['description'];
    noteId = json['note_id'];
    source = json['source'];
    type = json['type'];
    pageTitle = json['pageTitle'];
    pageUrl = json['pageUrl'];
    pageDuration = json['pageDuration'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    lead = json['lead'] != null ? new Lead.fromJson(json['lead']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['fub_id'] = this.fubId;
    data['occured'] = this.occured;
    data['lead_id'] = this.leadId;
    data['lead_property_id'] = this.leadPropertyId;
    data['message'] = this.message;
    data['description'] = this.description;
    data['note_id'] = this.noteId;
    data['source'] = this.source;
    data['type'] = this.type;
    data['pageTitle'] = this.pageTitle;
    data['pageUrl'] = this.pageUrl;
    data['pageDuration'] = this.pageDuration;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    if (this.lead != null) {
      data['lead'] = this.lead!.toJson();
    }
    return data;
  }
}

class Property {
  int? id;
  String? street;
  String? city;
  String? state;
  String? code;
  String? mlsNumber;
  int? price;
  bool? forRent;
  String? url;
  String? type;
  String? bedrooms;
  String? bathrooms;
  String? area;
  Null? lot;
  String? lat;
  String? lng;

  Property(
      {this.id,
        this.street,
        this.city,
        this.state,
        this.code,
        this.mlsNumber,
        this.price,
        this.forRent,
        this.url,
        this.type,
        this.bedrooms,
        this.bathrooms,
        this.area,
        this.lot,
        this.lat,
        this.lng});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    code = json['code'];
    mlsNumber = json['mlsNumber'];
    price = json['price'];
    forRent = json['forRent'];
    url = json['url'];
    type = json['type'];
    bedrooms = json['bedrooms'];
    bathrooms = json['bathrooms'];
    area = json['area'];
    lot = json['lot'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['code'] = this.code;
    data['mlsNumber'] = this.mlsNumber;
    data['price'] = this.price;
    data['forRent'] = this.forRent;
    data['url'] = this.url;
    data['type'] = this.type;
    data['bedrooms'] = this.bedrooms;
    data['bathrooms'] = this.bathrooms;
    data['area'] = this.area;
    data['lot'] = this.lot;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Lead {
  int? id;
  String? name;
  String? stage;
  int? assignedUserId;
  String? lastActivity;
  AssignedUserData? assignedUserData;

  Lead(
      {this.id,
        this.name,
        this.stage,
        this.assignedUserId,
        this.lastActivity,
        this.assignedUserData});

  Lead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stage = json['stage'];
    assignedUserId = json['assignedUserId'];
    lastActivity = json['lastActivity'];
    assignedUserData = json['assignedUserData'] != null
        ? new AssignedUserData.fromJson(json['assignedUserData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['stage'] = this.stage;
    data['assignedUserId'] = this.assignedUserId;
    data['lastActivity'] = this.lastActivity;
    if (this.assignedUserData != null) {
      data['assignedUserData'] = this.assignedUserData!.toJson();
    }
    return data;
  }
}

class AssignedUserData {
  int? id;
  String? fullName;

  AssignedUserData({this.id, this.fullName});

  AssignedUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    return data;
  }
}
