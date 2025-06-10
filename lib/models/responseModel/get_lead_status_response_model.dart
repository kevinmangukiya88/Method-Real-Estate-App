// To parse this JSON data, do
//
//     final getLeadStatusResponseModel = getLeadStatusResponseModelFromJson(jsonString);

import 'dart:convert';

GetLeadStatusResponseModel getLeadStatusResponseModelFromJson(String str) =>
    GetLeadStatusResponseModel.fromJson(json.decode(str));

String getLeadStatusResponseModelToJson(GetLeadStatusResponseModel data) =>
    json.encode(data.toJson());

class GetLeadStatusResponseModel {
  int? status;
  bool? claimed;
  LeadData? leadData;
  String? message;

  GetLeadStatusResponseModel({
    this.status,
    this.claimed,
    this.leadData,
    this.message,
  });

  factory GetLeadStatusResponseModel.fromJson(Map<String, dynamic> json) =>
      GetLeadStatusResponseModel(
        status: json["status"],
        claimed: json["claimed"],
        leadData: json["leadData"] == null
            ? null
            : LeadData.fromJson(json["leadData"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "claimed": claimed,
        "leadData": leadData?.toJson(),
        "message": message,
      };
}

class LeadData {
  dynamic picture;
  LeadDetails? leadDetails;
  int? id;
  int? fubId;
  DateTime? created;
  DateTime? updated;
  int? createdById;
  int? updatedById;
  String? createdVia;
  DateTime? lastActivity;
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
  bool? claimed;
  dynamic firstClaimedBy;
  dynamic firstClaimedAt;
  dynamic claimedAt;
  dynamic mpClaimed;
  bool? broadcasted;
  dynamic dealStatus;
  dynamic dealStage;
  dynamic dealName;
  dynamic dealCloseDate;
  dynamic dealPrice;
  bool? firstToClaimOffer;
  dynamic waitTillDate;
  dynamic waitTillDescription;
  dynamic clickId;
  int? marketId;
  dynamic slackMsgId;
  dynamic channelId;
  String? realgeekId;
  String? assignedAgentRgId;
  dynamic bySync;
  dynamic piplDataSearchedAt;

  LeadData({
    this.picture,
    this.leadDetails,
    this.id,
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
    this.clickId,
    this.marketId,
    this.slackMsgId,
    this.channelId,
    this.realgeekId,
    this.assignedAgentRgId,
    this.bySync,
    this.piplDataSearchedAt,
  });

  factory LeadData.fromJson(Map<String, dynamic> json) => LeadData(
        picture: json["picture"],
        leadDetails: json["leadDetails"] == null
            ? null
            : LeadDetails.fromJson(json["leadDetails"]),
        id: json["id"],
        fubId: json["fub_id"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        createdById: json["createdById"],
        updatedById: json["updatedById"],
        createdVia: json["createdVia"],
        lastActivity: json["lastActivity"] == null
            ? null
            : DateTime.parse(json["lastActivity"]),
        name: json["name"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        stage: json["stage"],
        stageId: json["stageId"],
        source: json["source"],
        sourceId: json["sourceId"],
        sourceUrl: json["sourceUrl"],
        delayed: json["delayed"],
        contacted: json["contacted"],
        price: json["price"],
        background: json["background"],
        assignedLenderId: json["assignedLenderId"],
        assignedLenderName: json["assignedLenderName"],
        assignedUserId: json["assignedUserId"],
        assignedPondId: json["assignedPondId"],
        assignedTo: json["assignedTo"],
        claimed: json["claimed"],
        firstClaimedBy: json["firstClaimedBy"],
        firstClaimedAt: json["firstClaimedAt"],
        claimedAt: json["claimedAt"],
        mpClaimed: json["mp_claimed"],
        broadcasted: json["broadcasted"],
        dealStatus: json["dealStatus"],
        dealStage: json["dealStage"],
        dealName: json["dealName"],
        dealCloseDate: json["dealCloseDate"],
        dealPrice: json["dealPrice"],
        firstToClaimOffer: json["firstToClaimOffer"],
        waitTillDate: json["waitTillDate"],
        waitTillDescription: json["waitTillDescription"],
        clickId: json["clickId"],
        marketId: json["market_id"],
        slackMsgId: json["slack_msg_id"],
        channelId: json["channel_id"],
        realgeekId: json["realgeek_id"],
        assignedAgentRgId: json["assigned_agent_rg_id"],
        bySync: json["by_sync"],
        piplDataSearchedAt: json["piplDataSearchedAt"],
      );

  Map<String, dynamic> toJson() => {
        "picture": picture,
        "leadDetails": leadDetails?.toJson(),
        "id": id,
        "fub_id": fubId,
        "created": created?.toIso8601String(),
        "updated": updated?.toIso8601String(),
        "createdById": createdById,
        "updatedById": updatedById,
        "createdVia": createdVia,
        "lastActivity": lastActivity?.toIso8601String(),
        "name": name,
        "firstName": firstName,
        "lastName": lastName,
        "stage": stage,
        "stageId": stageId,
        "source": source,
        "sourceId": sourceId,
        "sourceUrl": sourceUrl,
        "delayed": delayed,
        "contacted": contacted,
        "price": price,
        "background": background,
        "assignedLenderId": assignedLenderId,
        "assignedLenderName": assignedLenderName,
        "assignedUserId": assignedUserId,
        "assignedPondId": assignedPondId,
        "assignedTo": assignedTo,
        "claimed": claimed,
        "firstClaimedBy": firstClaimedBy,
        "firstClaimedAt": firstClaimedAt,
        "claimedAt": claimedAt,
        "mp_claimed": mpClaimed,
        "broadcasted": broadcasted,
        "dealStatus": dealStatus,
        "dealStage": dealStage,
        "dealName": dealName,
        "dealCloseDate": dealCloseDate,
        "dealPrice": dealPrice,
        "firstToClaimOffer": firstToClaimOffer,
        "waitTillDate": waitTillDate,
        "waitTillDescription": waitTillDescription,
        "clickId": clickId,
        "market_id": marketId,
        "slack_msg_id": slackMsgId,
        "channel_id": channelId,
        "realgeek_id": realgeekId,
        "assigned_agent_rg_id": assignedAgentRgId,
        "by_sync": bySync,
        "piplDataSearchedAt": piplDataSearchedAt,
      };
}

class LeadDetails {
  String? name;
  String? firstName;
  String? lastName;
  String? phone;
  String? email;
  String? source;
  String? isRealtorApiLead;
  String? address;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? price;
  String? mostRecentSearch;
  String? message;
  String? id;
  String? mlsNumber;
  String? marketId;

  LeadDetails({
    this.name,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.source,
    this.isRealtorApiLead,
    this.address,
    this.street,
    this.city,
    this.state,
    this.zipCode,
    this.price,
    this.mostRecentSearch,
    this.message,
    this.id,
    this.mlsNumber,
    this.marketId,
  });

  factory LeadDetails.fromJson(Map<String, dynamic> json) => LeadDetails(
        name: json["name"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        source: json["source"],
        isRealtorApiLead: json["isRealtorAPILead"],
        address: json["address"],
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zipCode"],
        price: json["price"],
        mostRecentSearch: json["mostRecentSearch"],
        message: json["message"],
        id: json["id"],
        mlsNumber: json["mlsNumber"],
        marketId: json["market_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "source": source,
        "isRealtorAPILead": isRealtorApiLead,
        "address": address,
        "street": street,
        "city": city,
        "state": state,
        "zipCode": zipCode,
        "price": price,
        "mostRecentSearch": mostRecentSearch,
        "message": message,
        "id": id,
        "mlsNumber": mlsNumber,
        "market_id": marketId,
      };
}
