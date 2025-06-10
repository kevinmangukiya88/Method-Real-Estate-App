// To parse this JSON data, do
//
//     final getTextMessageTemplatesResponseModel = getTextMessageTemplatesResponseModelFromJson(jsonString);

import 'dart:convert';

GetTextMessageTemplatesResponseModel
    getTextMessageTemplatesResponseModelFromJson(String str) =>
        GetTextMessageTemplatesResponseModel.fromJson(json.decode(str));

String getTextMessageTemplatesResponseModelToJson(
        GetTextMessageTemplatesResponseModel data) =>
    json.encode(data.toJson());

class GetTextMessageTemplatesResponseModel {
  Metadata? metadata;
  List<Textmessagetemplate>? textmessagetemplates;
  MergeVariables? mergeVariables;

  GetTextMessageTemplatesResponseModel({
    this.metadata,
    this.textmessagetemplates,
    this.mergeVariables,
  });

  factory GetTextMessageTemplatesResponseModel.fromJson(
          Map<String, dynamic> json) =>
      GetTextMessageTemplatesResponseModel(
        metadata: json["_metadata"] == null
            ? null
            : Metadata.fromJson(json["_metadata"]),
        textmessagetemplates: json["textmessagetemplates"] == null
            ? []
            : List<Textmessagetemplate>.from(json["textmessagetemplates"]!
                .map((x) => Textmessagetemplate.fromJson(x))),
        mergeVariables: json["mergeVariables"] == null
            ? null
            : MergeVariables.fromJson(json["mergeVariables"]),
      );

  Map<String, dynamic> toJson() => {
        "_metadata": metadata?.toJson(),
        "textmessagetemplates": textmessagetemplates == null
            ? []
            : List<dynamic>.from(textmessagetemplates!.map((x) => x.toJson())),
        "mergeVariables": mergeVariables?.toJson(),
      };
}

class MergeVariables {
  Contact? contact;
  Company? company;
  Agent? agent;
  Sender? sender;
  Property? property;
  LastViewed? lastViewed;
  LeadSource? leadSource;
  Other? other;
  Map<String, String>? contract;
  Collaborator? collaborator;
  Map<String, String>? custom;

  MergeVariables({
    this.contact,
    this.company,
    this.agent,
    this.sender,
    this.property,
    this.lastViewed,
    this.leadSource,
    this.other,
    this.contract,
    this.collaborator,
    this.custom,
  });

  factory MergeVariables.fromJson(Map<String, dynamic> json) => MergeVariables(
        contact:
            json["CONTACT"] == null ? null : Contact.fromJson(json["CONTACT"]),
        company:
            json["COMPANY"] == null ? null : Company.fromJson(json["COMPANY"]),
        agent: json["AGENT"] == null ? null : Agent.fromJson(json["AGENT"]),
        sender: json["SENDER"] == null ? null : Sender.fromJson(json["SENDER"]),
        property: json["PROPERTY"] == null
            ? null
            : Property.fromJson(json["PROPERTY"]),
        lastViewed: json["LAST VIEWED"] == null
            ? null
            : LastViewed.fromJson(json["LAST VIEWED"]),
        leadSource: json["LEAD SOURCE"] == null
            ? null
            : LeadSource.fromJson(json["LEAD SOURCE"]),
        other: json["OTHER"] == null ? null : Other.fromJson(json["OTHER"]),
        contract: Map.from(json["CONTRACT"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        collaborator: json["COLLABORATOR"] == null
            ? null
            : Collaborator.fromJson(json["COLLABORATOR"]),
        custom: Map.from(json["Custom"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "CONTACT": contact?.toJson(),
        "COMPANY": company?.toJson(),
        "AGENT": agent?.toJson(),
        "SENDER": sender?.toJson(),
        "PROPERTY": property?.toJson(),
        "LAST VIEWED": lastViewed?.toJson(),
        "LEAD SOURCE": leadSource?.toJson(),
        "OTHER": other?.toJson(),
        "CONTRACT":
            Map.from(contract!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "COLLABORATOR": collaborator?.toJson(),
        "Custom":
            Map.from(custom!).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}

class Agent {
  String? agentName;
  String? agentFirstName;
  String? agentLastName;
  String? agentEmail;
  String? agentPhone;
  String? agentMobilePhone;
  String? agentMergeField;

  Agent({
    this.agentName,
    this.agentFirstName,
    this.agentLastName,
    this.agentEmail,
    this.agentPhone,
    this.agentMobilePhone,
    this.agentMergeField,
  });

  factory Agent.fromJson(Map<String, dynamic> json) => Agent(
        agentName: json["Agent name"],
        agentFirstName: json["Agent first name"],
        agentLastName: json["Agent last name"],
        agentEmail: json["Agent email"],
        agentPhone: json["Agent phone"],
        agentMobilePhone: json["Agent mobile phone"],
        agentMergeField: json["Agent merge field"],
      );

  Map<String, dynamic> toJson() => {
        "Agent name": agentName,
        "Agent first name": agentFirstName,
        "Agent last name": agentLastName,
        "Agent email": agentEmail,
        "Agent phone": agentPhone,
        "Agent mobile phone": agentMobilePhone,
        "Agent merge field": agentMergeField,
      };
}

class Collaborator {
  String? collaboratorFirstName;
  String? collaboratorFullName;
  String? collaboratorPhoneNumber;

  Collaborator({
    this.collaboratorFirstName,
    this.collaboratorFullName,
    this.collaboratorPhoneNumber,
  });

  factory Collaborator.fromJson(Map<String, dynamic> json) => Collaborator(
        collaboratorFirstName: json["Collaborator first name"],
        collaboratorFullName: json["Collaborator full name"],
        collaboratorPhoneNumber: json["Collaborator phone number"],
      );

  Map<String, dynamic> toJson() => {
        "Collaborator first name": collaboratorFirstName,
        "Collaborator full name": collaboratorFullName,
        "Collaborator phone number": collaboratorPhoneNumber,
      };
}

class Company {
  String? companyName;
  String? companyPhone;

  Company({
    this.companyName,
    this.companyPhone,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        companyName: json["Company name"],
        companyPhone: json["Company phone"],
      );

  Map<String, dynamic> toJson() => {
        "Company name": companyName,
        "Company phone": companyPhone,
      };
}

class Contact {
  String? contactName;
  String? contactFirstName;
  String? contactLastName;
  String? contactAndRelationshipsFirstName;
  String? contactEmail;
  String? contactPhone;
  String? contactAddress;
  String? contactStreet;
  String? contactCity;
  String? contactState;
  String? contactZipcode;
  String? contactCountry;

  Contact({
    this.contactName,
    this.contactFirstName,
    this.contactLastName,
    this.contactAndRelationshipsFirstName,
    this.contactEmail,
    this.contactPhone,
    this.contactAddress,
    this.contactStreet,
    this.contactCity,
    this.contactState,
    this.contactZipcode,
    this.contactCountry,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        contactName: json["Contact name"],
        contactFirstName: json["Contact first name"],
        contactLastName: json["Contact last name"],
        contactAndRelationshipsFirstName:
            json["Contact and relationships first name"],
        contactEmail: json["Contact email"],
        contactPhone: json["Contact phone"],
        contactAddress: json["Contact address"],
        contactStreet: json["Contact street"],
        contactCity: json["Contact city"],
        contactState: json["Contact state"],
        contactZipcode: json["Contact zipcode"],
        contactCountry: json["Contact country"],
      );

  Map<String, dynamic> toJson() => {
        "Contact name": contactName,
        "Contact first name": contactFirstName,
        "Contact last name": contactLastName,
        "Contact and relationships first name":
            contactAndRelationshipsFirstName,
        "Contact email": contactEmail,
        "Contact phone": contactPhone,
        "Contact address": contactAddress,
        "Contact street": contactStreet,
        "Contact city": contactCity,
        "Contact state": contactState,
        "Contact zipcode": contactZipcode,
        "Contact country": contactCountry,
      };
}

class LastViewed {
  String? viewedAddress;
  String? viewedAddressUrl;
  String? viewedAddressPreview;
  String? last5Preview;

  LastViewed({
    this.viewedAddress,
    this.viewedAddressUrl,
    this.viewedAddressPreview,
    this.last5Preview,
  });

  factory LastViewed.fromJson(Map<String, dynamic> json) => LastViewed(
        viewedAddress: json["Viewed address"],
        viewedAddressUrl: json["Viewed address url"],
        viewedAddressPreview: json["Viewed address preview"],
        last5Preview: json["Last 5 preview"],
      );

  Map<String, dynamic> toJson() => {
        "Viewed address": viewedAddress,
        "Viewed address url": viewedAddressUrl,
        "Viewed address preview": viewedAddressPreview,
        "Last 5 preview": last5Preview,
      };
}

class LeadSource {
  String? leadSource;

  LeadSource({
    this.leadSource,
  });

  factory LeadSource.fromJson(Map<String, dynamic> json) => LeadSource(
        leadSource: json["Lead source"],
      );

  Map<String, dynamic> toJson() => {
        "Lead source": leadSource,
      };
}

class Other {
  String? greetingTime;

  Other({
    this.greetingTime,
  });

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        greetingTime: json["Greeting time"],
      );

  Map<String, dynamic> toJson() => {
        "Greeting time": greetingTime,
      };
}

class Property {
  String? inquiryAddress;
  String? inquiryAddressUrl;
  String? inquiryAddressPreview;

  Property({
    this.inquiryAddress,
    this.inquiryAddressUrl,
    this.inquiryAddressPreview,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
        inquiryAddress: json["Inquiry address"],
        inquiryAddressUrl: json["Inquiry address url"],
        inquiryAddressPreview: json["Inquiry address preview"],
      );

  Map<String, dynamic> toJson() => {
        "Inquiry address": inquiryAddress,
        "Inquiry address url": inquiryAddressUrl,
        "Inquiry address preview": inquiryAddressPreview,
      };
}

class Sender {
  String? senderName;
  String? senderFirstName;
  String? senderLastName;
  String? senderEmail;
  String? senderPhone;
  String? senderMobilePhone;

  Sender({
    this.senderName,
    this.senderFirstName,
    this.senderLastName,
    this.senderEmail,
    this.senderPhone,
    this.senderMobilePhone,
  });

  factory Sender.fromJson(Map<String, dynamic> json) => Sender(
        senderName: json["Sender name"],
        senderFirstName: json["Sender first name"],
        senderLastName: json["Sender last name"],
        senderEmail: json["Sender email"],
        senderPhone: json["Sender phone"],
        senderMobilePhone: json["Sender mobile phone"],
      );

  Map<String, dynamic> toJson() => {
        "Sender name": senderName,
        "Sender first name": senderFirstName,
        "Sender last name": senderLastName,
        "Sender email": senderEmail,
        "Sender phone": senderPhone,
        "Sender mobile phone": senderMobilePhone,
      };
}

class Metadata {
  String? collection;
  int? offset;
  int? limit;
  int? total;

  Metadata({
    this.collection,
    this.offset,
    this.limit,
    this.total,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        collection: json["collection"],
        offset: json["offset"],
        limit: json["limit"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "collection": collection,
        "offset": offset,
        "limit": limit,
        "total": total,
      };
}

class Textmessagetemplate {
  int? id;
  dynamic createdBy;
  String? name;
  String? message;
  dynamic effectivenessScore;
  bool? isDeletable;
  bool? isEditable;
  bool? isShareable;
  dynamic isShared;
  int? sentPeopleCount;
  dynamic totalOptOutRate;
  int? totalReplies;
  int? totalSent;
  dynamic windowedOptOutRate;
  int? windowedReplies;
  int? windowedSent;
  String? type;

  Textmessagetemplate({
    this.id,
    this.createdBy,
    this.name,
    this.message,
    this.effectivenessScore,
    this.isDeletable,
    this.isEditable,
    this.isShareable,
    this.isShared,
    this.sentPeopleCount,
    this.totalOptOutRate,
    this.totalReplies,
    this.totalSent,
    this.windowedOptOutRate,
    this.windowedReplies,
    this.windowedSent,
    this.type,
  });

  factory Textmessagetemplate.fromJson(Map<String, dynamic> json) =>
      Textmessagetemplate(
        id: json["id"],
        createdBy: json["createdBy"],
        name: json["name"],
        message: json["message"],
        effectivenessScore: json["effectivenessScore"],
        isDeletable: json["isDeletable"],
        isEditable: json["isEditable"],
        isShareable: json["isShareable"],
        isShared: json["isShared"],
        sentPeopleCount: json["sentPeopleCount"],
        totalOptOutRate: json["totalOptOutRate"],
        totalReplies: json["totalReplies"],
        totalSent: json["totalSent"],
        windowedOptOutRate: json["windowedOptOutRate"],
        windowedReplies: json["windowedReplies"],
        windowedSent: json["windowedSent"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdBy": createdBy,
        "name": name,
        "message": message,
        "effectivenessScore": effectivenessScore,
        "isDeletable": isDeletable,
        "isEditable": isEditable,
        "isShareable": isShareable,
        "isShared": isShared,
        "sentPeopleCount": sentPeopleCount,
        "totalOptOutRate": totalOptOutRate,
        "totalReplies": totalReplies,
        "totalSent": totalSent,
        "windowedOptOutRate": windowedOptOutRate,
        "windowedReplies": windowedReplies,
        "windowedSent": windowedSent,
        "type": type,
      };
}
