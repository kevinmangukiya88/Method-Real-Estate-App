class GetAgentsResponseModel {
  ResponseHeader? responseHeader;
  Response? response;

  GetAgentsResponseModel({this.responseHeader, this.response});

  GetAgentsResponseModel.fromJson(Map<String, dynamic> json) {
    responseHeader = json['responseHeader'] != null
        ? new ResponseHeader.fromJson(json['responseHeader'])
        : null;
    response = json['response'] != null
        ? new Response.fromJson(json['response'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseHeader != null) {
      data['responseHeader'] = this.responseHeader!.toJson();
    }
    if (this.response != null) {
      data['response'] = this.response!.toJson();
    }
    return data;
  }
}

class ResponseHeader {
  int? status;
  int? qTime;
  Params? params;

  ResponseHeader({this.status, this.qTime, this.params});

  ResponseHeader.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    qTime = json['QTime'];
    params =
        json['params'] != null ? new Params.fromJson(json['params']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['QTime'] = this.qTime;
    if (this.params != null) {
      data['params'] = this.params!.toJson();
    }
    return data;
  }
}

class Params {
  String? q;

  Params({this.q});

  Params.fromJson(Map<String, dynamic> json) {
    q = json['q'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['q'] = this.q;
    return data;
  }
}

class Response {
  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Docs>? docs;

  Response({this.numFound, this.start, this.numFoundExact, this.docs});

  Response.fromJson(Map<String, dynamic> json) {
    numFound = json['numFound'];
    start = json['start'];
    numFoundExact = json['numFoundExact'];
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numFound'] = this.numFound;
    data['start'] = this.start;
    data['numFoundExact'] = this.numFoundExact;
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  String? bridgeModificationTimestamp;
  String? memberDirectPhone;
  String? memberFax;
  String? memberFirstName;
  String? memberFullName;
  String? memberKey;
  int? memberKeyNumeric;
  String? memberLastName;
  String? memberMlsId;
  String? memberStateLicense;
  String? memberStateOrProvince;
  String? memberStatus;
  String? memberType;
  String? modificationTimestamp;
  int? officeKeyNumeric;
  String? officeMlsId;
  String? originatingSystemID;
  String? originatingSystemMemberKey;
  String? originatingSystemName;
  String? socialMediaWebsiteUrlOrId;
  List<String>? feedTypes;
  int? iVersion;
  String? memberMobilePhone;

  Docs(
      {this.bridgeModificationTimestamp,
      this.memberDirectPhone,
      this.memberFax,
      this.memberFirstName,
      this.memberFullName,
      this.memberKey,
      this.memberKeyNumeric,
      this.memberLastName,
      this.memberMlsId,
      this.memberStateLicense,
      this.memberStateOrProvince,
      this.memberStatus,
      this.memberType,
      this.modificationTimestamp,
      this.officeKeyNumeric,
      this.officeMlsId,
      this.originatingSystemID,
      this.originatingSystemMemberKey,
      this.originatingSystemName,
      this.socialMediaWebsiteUrlOrId,
      this.feedTypes,
      this.iVersion,
      this.memberMobilePhone});

  Docs.fromJson(Map<String, dynamic> json) {
    bridgeModificationTimestamp = json['BridgeModificationTimestamp'];
    memberDirectPhone = json['MemberDirectPhone'];
    memberFax = json['MemberFax'];
    memberFirstName = json['MemberFirstName'];
    memberFullName = json['MemberFullName'];
    memberKey = json['MemberKey'];
    memberKeyNumeric = json['MemberKeyNumeric'];
    memberLastName = json['MemberLastName'];
    memberMlsId = json['MemberMlsId'];
    memberStateLicense = json['MemberStateLicense'];
    memberStateOrProvince = json['MemberStateOrProvince'];
    memberStatus = json['MemberStatus'];
    memberType = json['MemberType'];
    modificationTimestamp = json['ModificationTimestamp'];
    officeKeyNumeric = json['OfficeKeyNumeric'];
    officeMlsId = json['OfficeMlsId'];
    originatingSystemID = json['OriginatingSystemID'];
    originatingSystemMemberKey = json['OriginatingSystemMemberKey'];
    originatingSystemName = json['OriginatingSystemName'];
    socialMediaWebsiteUrlOrId = json['SocialMediaWebsiteUrlOrId'];
    feedTypes = json['FeedTypes'].cast<String>();
    iVersion = json['_version_'];
    memberMobilePhone = json['MemberMobilePhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BridgeModificationTimestamp'] = this.bridgeModificationTimestamp;
    data['MemberDirectPhone'] = this.memberDirectPhone;
    data['MemberFax'] = this.memberFax;
    data['MemberFirstName'] = this.memberFirstName;
    data['MemberFullName'] = this.memberFullName;
    data['MemberKey'] = this.memberKey;
    data['MemberKeyNumeric'] = this.memberKeyNumeric;
    data['MemberLastName'] = this.memberLastName;
    data['MemberMlsId'] = this.memberMlsId;
    data['MemberStateLicense'] = this.memberStateLicense;
    data['MemberStateOrProvince'] = this.memberStateOrProvince;
    data['MemberStatus'] = this.memberStatus;
    data['MemberType'] = this.memberType;
    data['ModificationTimestamp'] = this.modificationTimestamp;
    data['OfficeKeyNumeric'] = this.officeKeyNumeric;
    data['OfficeMlsId'] = this.officeMlsId;
    data['OriginatingSystemID'] = this.originatingSystemID;
    data['OriginatingSystemMemberKey'] = this.originatingSystemMemberKey;
    data['OriginatingSystemName'] = this.originatingSystemName;
    data['SocialMediaWebsiteUrlOrId'] = this.socialMediaWebsiteUrlOrId;
    data['FeedTypes'] = this.feedTypes;
    data['_version_'] = this.iVersion;
    data['MemberMobilePhone'] = this.memberMobilePhone;
    return data;
  }
}
