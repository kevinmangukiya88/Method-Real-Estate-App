// To parse this JSON data, do
//
//     final getOfficeDetailResponseModel = getOfficeDetailResponseModelFromJson(jsonString);

import 'dart:convert';

GetOfficeDetailResponseModel getOfficeDetailResponseModelFromJson(String str) =>
    GetOfficeDetailResponseModel.fromJson(json.decode(str));

String getOfficeDetailResponseModelToJson(GetOfficeDetailResponseModel data) =>
    json.encode(data.toJson());

class GetOfficeDetailResponseModel {
  ResponseHeader? responseHeader;
  Response? response;

  GetOfficeDetailResponseModel({
    this.responseHeader,
    this.response,
  });

  factory GetOfficeDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      GetOfficeDetailResponseModel(
        responseHeader: json["responseHeader"] == null
            ? null
            : ResponseHeader.fromJson(json["responseHeader"]),
        response: json["response"] == null
            ? null
            : Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "responseHeader": responseHeader?.toJson(),
        "response": response?.toJson(),
      };
}

class Response {
  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Doc>? docs;

  Response({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        numFound: json["numFound"],
        start: json["start"],
        numFoundExact: json["numFoundExact"],
        docs: json["docs"] == null
            ? []
            : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "numFound": numFound,
        "start": start,
        "numFoundExact": numFoundExact,
        "docs": docs == null
            ? []
            : List<dynamic>.from(docs!.map((x) => x.toJson())),
      };
}

class Doc {
  DateTime? bridgeModificationTimestamp;
  String? fmlsFmlsidXphone;
  int? mainOfficeKeyNumeric;
  String? mainOfficeMlsId;
  DateTime? modificationTimestamp;
  String? officeAddress1;
  String? officeCity;
  String? officeKey;
  int? officeKeyNumeric;
  String? officeMlsId;
  String? officeName;
  String? officePhone;
  String? officePostalCode;
  String? officeStateOrProvince;
  String? officeStatus;
  String? originatingSystemId;
  String? originatingSystemName;
  String? originatingSystemOfficeKey;
  List<String>? feedTypes;
  double? version;
  String? officeFax;
  String? fmlsFmlsidXemail;
  String? officeBrokerKey;
  String? officeBrokerKeyNumeric;
  String? officeBrokerMlsId;
  String? officeCorporateLicense;
  String? officeCountyOrParish;
  String? officeEmail;
  String? socialMediaWebsiteUrlOrId;

  Doc({
    this.bridgeModificationTimestamp,
    this.fmlsFmlsidXphone,
    this.mainOfficeKeyNumeric,
    this.mainOfficeMlsId,
    this.modificationTimestamp,
    this.officeAddress1,
    this.officeCity,
    this.officeKey,
    this.officeKeyNumeric,
    this.officeMlsId,
    this.officeName,
    this.officePhone,
    this.officePostalCode,
    this.officeStateOrProvince,
    this.officeStatus,
    this.originatingSystemId,
    this.originatingSystemName,
    this.originatingSystemOfficeKey,
    this.feedTypes,
    this.version,
    this.officeFax,
    this.fmlsFmlsidXemail,
    this.officeBrokerKey,
    this.officeBrokerKeyNumeric,
    this.officeBrokerMlsId,
    this.officeCorporateLicense,
    this.officeCountyOrParish,
    this.officeEmail,
    this.socialMediaWebsiteUrlOrId,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        bridgeModificationTimestamp: json["BridgeModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["BridgeModificationTimestamp"]),
        fmlsFmlsidXphone: json["FMLS_FMLSIDXphone"],
        mainOfficeKeyNumeric: json["MainOfficeKeyNumeric"],
        mainOfficeMlsId: json["MainOfficeMlsId"],
        modificationTimestamp: json["ModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["ModificationTimestamp"]),
        officeAddress1: json["OfficeAddress1"],
        officeCity: json["OfficeCity"],
        officeKey: json["OfficeKey"],
        officeKeyNumeric: json["OfficeKeyNumeric"],
        officeMlsId: json["OfficeMlsId"],
        officeName: json["OfficeName"],
        officePhone: json["OfficePhone"],
        officePostalCode: json["OfficePostalCode"],
        officeStateOrProvince: json["OfficeStateOrProvince"],
        officeStatus: json["OfficeStatus"],
        originatingSystemId: json["OriginatingSystemID"],
        originatingSystemName: json["OriginatingSystemName"],
        originatingSystemOfficeKey: json["OriginatingSystemOfficeKey"],
        feedTypes: json["FeedTypes"] == null
            ? []
            : List<String>.from(json["FeedTypes"]!.map((x) => x)),
        version: json["_version_"]?.toDouble(),
        officeFax: json["OfficeFax"],
        fmlsFmlsidXemail: json["FMLS_FMLSIDXemail"],
        officeBrokerKey: json["OfficeBrokerKey"],
        officeBrokerKeyNumeric: json["OfficeBrokerKeyNumeric"],
        officeBrokerMlsId: json["OfficeBrokerMlsId"],
        officeCorporateLicense: json["OfficeCorporateLicense"],
        officeCountyOrParish: json["OfficeCountyOrParish"],
        officeEmail: json["OfficeEmail"],
        socialMediaWebsiteUrlOrId: json["SocialMediaWebsiteUrlOrId"],
      );

  Map<String, dynamic> toJson() => {
        "BridgeModificationTimestamp":
            bridgeModificationTimestamp?.toIso8601String(),
        "FMLS_FMLSIDXphone": fmlsFmlsidXphone,
        "MainOfficeKeyNumeric": mainOfficeKeyNumeric,
        "MainOfficeMlsId": mainOfficeMlsId,
        "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
        "OfficeAddress1": officeAddress1,
        "OfficeCity": officeCity,
        "OfficeKey": officeKey,
        "OfficeKeyNumeric": officeKeyNumeric,
        "OfficeMlsId": officeMlsId,
        "OfficeName": officeName,
        "OfficePhone": officePhone,
        "OfficePostalCode": officePostalCode,
        "OfficeStateOrProvince": officeStateOrProvince,
        "OfficeStatus": officeStatus,
        "OriginatingSystemID": originatingSystemId,
        "OriginatingSystemName": originatingSystemName,
        "OriginatingSystemOfficeKey": originatingSystemOfficeKey,
        "FeedTypes": feedTypes == null
            ? []
            : List<dynamic>.from(feedTypes!.map((x) => x)),
        "_version_": version,
        "OfficeFax": officeFax,
        "FMLS_FMLSIDXemail": fmlsFmlsidXemail,
        "OfficeBrokerKey": officeBrokerKey,
        "OfficeBrokerKeyNumeric": officeBrokerKeyNumeric,
        "OfficeBrokerMlsId": officeBrokerMlsId,
        "OfficeCorporateLicense": officeCorporateLicense,
        "OfficeCountyOrParish": officeCountyOrParish,
        "OfficeEmail": officeEmail,
        "SocialMediaWebsiteUrlOrId": socialMediaWebsiteUrlOrId,
      };
}

class ResponseHeader {
  int? status;
  int? qTime;
  Params? params;

  ResponseHeader({
    this.status,
    this.qTime,
    this.params,
  });

  factory ResponseHeader.fromJson(Map<String, dynamic> json) => ResponseHeader(
        status: json["status"],
        qTime: json["QTime"],
        params: json["params"] == null ? null : Params.fromJson(json["params"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "QTime": qTime,
        "params": params?.toJson(),
      };
}

class Params {
  String? q;

  Params({
    this.q,
  });

  factory Params.fromJson(Map<String, dynamic> json) => Params(
        q: json["q"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
      };
}
