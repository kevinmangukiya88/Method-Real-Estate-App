class GetClientListResponseModel {
  Metadata? mMetadata;
  List<People>? people;

  GetClientListResponseModel({this.mMetadata, this.people});

  GetClientListResponseModel.fromJson(Map<String, dynamic> json) {
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
    if (json['people'] != null) {
      people = <People>[];
      json['people'].forEach((v) {
        people!.add(new People.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    if (this.people != null) {
      data['people'] = this.people!.map((v) => v.toJson()).toList();
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

class People {
  int? id;
  int? fubId;
  String? created;
  String? updated;
  int? createdById;
  int? updatedById;
  String? createdVia;
  String? lastActivity;
  String? name;
  String? firstName;
  String? lastName;
  String? stage;
  int? stageId;
  String? source;
  int? sourceId;
  String? sourceUrl;
  bool? delayed;
  int? contacted;
  int? price;
  String? background;
  dynamic assignedLenderId;
  dynamic assignedLenderName;
  int? assignedUserId;
  dynamic assignedPondId;
  String? assignedTo;
  Picture? picture;
  bool? claimed;
  int? firstClaimedBy;
  String? firstClaimedAt;
  String? claimedAt;
  bool? mpClaimed;
  bool? broadcasted;
  dynamic dealStatus;
  dynamic dealStage;
  dynamic dealName;
  dynamic dealCloseDate;
  dynamic dealPrice;
  bool? firstToClaimOffer;
  dynamic waitTillDate;
  dynamic waitTillDescription;
  String? leadDetails;
  dynamic clickId;
  int? marketId;
  dynamic slackMsgId;
  dynamic channelId;
  String? realgeekId;
  String? assignedAgentRgId;
  dynamic bySync;
  String? piplDataSearchedAt;
  SocialData? socialData;
  List<Phones>? phones;
  List<Addresses>? addresses;
  List<Collaborators>? collaborators;
  List<LeadTags>? leadTags;
  List<dynamic>? emails;

  People(
      {this.id,
      this.fubId,
      this.created,
      this.updated,
      this.createdById,
      this.updatedById,
      this.createdVia,
      this.lastActivity,
      this.name,
      this.firstName,
      this.lastName,
      this.stage,
      this.stageId,
      this.source,
      this.sourceId,
      this.sourceUrl,
      this.delayed,
      this.contacted,
      this.price,
      this.background,
      this.assignedLenderId,
      this.assignedLenderName,
      this.assignedUserId,
      this.assignedPondId,
      this.assignedTo,
      this.picture,
      this.claimed,
      this.firstClaimedBy,
      this.firstClaimedAt,
      this.claimedAt,
      this.mpClaimed,
      this.broadcasted,
      this.dealStatus,
      this.dealStage,
      this.dealName,
      this.dealCloseDate,
      this.dealPrice,
      this.firstToClaimOffer,
      this.waitTillDate,
      this.waitTillDescription,
      this.leadDetails,
      this.clickId,
      this.marketId,
      this.slackMsgId,
      this.channelId,
      this.realgeekId,
      this.assignedAgentRgId,
      this.bySync,
      this.piplDataSearchedAt,
      this.socialData,
      this.phones,
      this.addresses,
      this.collaborators,
      this.leadTags,
      this.emails});

  People.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fubId = json['fub_id'];
    created = json['created'];
    updated = json['updated'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    createdVia = json['createdVia'];
    lastActivity = json['lastActivity'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    stage = json['stage'];
    stageId = json['stageId'];
    source = json['source'];
    sourceId = json['sourceId'];
    sourceUrl = json['sourceUrl'];
    delayed = json['delayed'];
    contacted = json['contacted'];
    price = json['price'];
    background = json['background'];
    assignedLenderId = json['assignedLenderId'];
    assignedLenderName = json['assignedLenderName'];
    assignedUserId = json['assignedUserId'];
    assignedPondId = json['assignedPondId'];
    assignedTo = json['assignedTo'];
    picture =
        json['picture'] != null ? new Picture.fromJson(json['picture']) : null;
    claimed = json['claimed'];
    firstClaimedBy = json['firstClaimedBy'];
    firstClaimedAt = json['firstClaimedAt'];
    claimedAt = json['claimedAt'];
    mpClaimed = json['mp_claimed'];
    broadcasted = json['broadcasted'];
    dealStatus = json['dealStatus'];
    dealStage = json['dealStage'];
    dealName = json['dealName'];
    dealCloseDate = json['dealCloseDate'];
    dealPrice = json['dealPrice'];
    firstToClaimOffer = json['firstToClaimOffer'];
    waitTillDate = json['waitTillDate'];
    waitTillDescription = json['waitTillDescription'];
    leadDetails = json['leadDetails'];
    clickId = json['clickId'];
    marketId = json['market_id'];
    slackMsgId = json['slack_msg_id'];
    channelId = json['channel_id'];
    realgeekId = json['realgeek_id'];
    assignedAgentRgId = json['assigned_agent_rg_id'];
    bySync = json['by_sync'];
    piplDataSearchedAt = json['piplDataSearchedAt'];
    socialData = json['socialData'] != null
        ? new SocialData.fromJson(json['socialData'])
        : null;
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(new Phones.fromJson(v));
      });
    }
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(new Addresses.fromJson(v));
      });
    }
    if (json['collaborators'] != null) {
      collaborators = <Collaborators>[];
      json['collaborators'].forEach((v) {
        collaborators!.add(new Collaborators.fromJson(v));
      });
    }
    if (json['lead_tags'] != null) {
      leadTags = <LeadTags>[];
      json['lead_tags'].forEach((v) {
        leadTags!.add(new LeadTags.fromJson(v));
      });
    }
    if (json['emails'] != null) {
      emails = <dynamic>[];
      json['emails'].forEach((v) {
        emails!.add(json['emails']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fub_id'] = this.fubId;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['createdVia'] = this.createdVia;
    data['lastActivity'] = this.lastActivity;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['stage'] = this.stage;
    data['stageId'] = this.stageId;
    data['source'] = this.source;
    data['sourceId'] = this.sourceId;
    data['sourceUrl'] = this.sourceUrl;
    data['delayed'] = this.delayed;
    data['contacted'] = this.contacted;
    data['price'] = this.price;
    data['background'] = this.background;
    data['assignedLenderId'] = this.assignedLenderId;
    data['assignedLenderName'] = this.assignedLenderName;
    data['assignedUserId'] = this.assignedUserId;
    data['assignedPondId'] = this.assignedPondId;
    data['assignedTo'] = this.assignedTo;
    if (this.picture != null) {
      data['picture'] = this.picture!.toJson();
    }
    data['claimed'] = this.claimed;
    data['firstClaimedBy'] = this.firstClaimedBy;
    data['firstClaimedAt'] = this.firstClaimedAt;
    data['claimedAt'] = this.claimedAt;
    data['mp_claimed'] = this.mpClaimed;
    data['broadcasted'] = this.broadcasted;
    data['dealStatus'] = this.dealStatus;
    data['dealStage'] = this.dealStage;
    data['dealName'] = this.dealName;
    data['dealCloseDate'] = this.dealCloseDate;
    data['dealPrice'] = this.dealPrice;
    data['firstToClaimOffer'] = this.firstToClaimOffer;
    data['waitTillDate'] = this.waitTillDate;
    data['waitTillDescription'] = this.waitTillDescription;
    data['leadDetails'] = this.leadDetails;
    data['clickId'] = this.clickId;
    data['market_id'] = this.marketId;
    data['slack_msg_id'] = this.slackMsgId;
    data['channel_id'] = this.channelId;
    data['realgeek_id'] = this.realgeekId;
    data['assigned_agent_rg_id'] = this.assignedAgentRgId;
    data['by_sync'] = this.bySync;
    data['piplDataSearchedAt'] = this.piplDataSearchedAt;
    if (this.socialData != null) {
      data['socialData'] = this.socialData!.toJson();
    }
    if (this.phones != null) {
      data['phones'] = this.phones!.map((v) => v.toJson()).toList();
    }
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    if (this.collaborators != null) {
      data['collaborators'] =
          this.collaborators!.map((v) => v.toJson()).toList();
    }
    if (this.leadTags != null) {
      data['lead_tags'] = this.leadTags!.map((v) => v.toJson()).toList();
    }
    if (this.emails != null) {
      data['emails'] = this.emails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Picture {
  String? small;

  Picture({this.small});

  Picture.fromJson(Map<String, dynamic> json) {
    small = json['small'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    return data;
  }
}

class SocialData {
  int? id;
  int? leadId;
  dynamic leadRelationshipId;
  String? name;
  String? firstName;
  String? lastName;
  String? gender;
  String? age;
  String? location;
  String? company;
  String? title;
  String? bio;
  String? topics;
  String? facebook;
  String? twitter;
  String? googleProfile;
  String? googlePlus;
  String? linkedIn;

  SocialData(
      {this.id,
      this.leadId,
      this.leadRelationshipId,
      this.name,
      this.firstName,
      this.lastName,
      this.gender,
      this.age,
      this.location,
      this.company,
      this.title,
      this.bio,
      this.topics,
      this.facebook,
      this.twitter,
      this.googleProfile,
      this.googlePlus,
      this.linkedIn});

  SocialData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    leadRelationshipId = json['lead_relationship_id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    age = json['age'];
    location = json['location'];
    company = json['company'];
    title = json['title'];
    bio = json['bio'];
    topics = json['topics'];
    facebook = json['facebook'];
    twitter = json['twitter'];
    googleProfile = json['googleProfile'];
    googlePlus = json['googlePlus'];
    linkedIn = json['linkedIn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['lead_relationship_id'] = this.leadRelationshipId;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['location'] = this.location;
    data['company'] = this.company;
    data['title'] = this.title;
    data['bio'] = this.bio;
    data['topics'] = this.topics;
    data['facebook'] = this.facebook;
    data['twitter'] = this.twitter;
    data['googleProfile'] = this.googleProfile;
    data['googlePlus'] = this.googlePlus;
    data['linkedIn'] = this.linkedIn;
    return data;
  }
}

class Phones {
  String? value;
  String? type;
  bool? isPrimary;
  String? status;

  Phones({this.value, this.type, this.isPrimary, this.status});

  Phones.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
    isPrimary = json['isPrimary'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['type'] = this.type;
    data['isPrimary'] = this.isPrimary;
    data['status'] = this.status;
    return data;
  }
}

class Addresses {
  String? type;
  String? street;
  String? city;
  String? state;
  String? country;
  String? code;

  Addresses(
      {this.type, this.street, this.city, this.state, this.country, this.code});

  Addresses.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['code'] = this.code;
    return data;
  }
}

class Collaborators {
  int? id;
  String? name;
  bool? assigned;
  String? role;

  Collaborators({this.id, this.name, this.assigned, this.role});

  Collaborators.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    assigned = json['assigned'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['assigned'] = this.assigned;
    data['role'] = this.role;
    return data;
  }
}

class LeadTags {
  int? id;
  int? leadId;
  dynamic tagNameId;
  String? tag;

  LeadTags({this.id, this.leadId, this.tagNameId, this.tag});

  LeadTags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    tagNameId = json['tag_name_id'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['tag_name_id'] = this.tagNameId;
    data['tag'] = this.tag;
    return data;
  }
}
