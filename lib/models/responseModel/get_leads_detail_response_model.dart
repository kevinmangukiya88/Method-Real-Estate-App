// To parse this JSON data, do
//
//     final getLeadsDetailResponseModel = getLeadsDetailResponseModelFromJson(jsonString);

import 'dart:convert';

GetLeadsDetailResponseModel getLeadsDetailResponseModelFromJson(String str) => GetLeadsDetailResponseModel.fromJson(json.decode(str));

String getLeadsDetailResponseModelToJson(GetLeadsDetailResponseModel data) => json.encode(data.toJson());

class GetLeadsDetailResponseModel {
  int? id;
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
  dynamic picture;
  bool? claimed;
  String? dealStatus;
  String? dealStage;
  String? dealName;
  dynamic dealCloseDate;
  int? dealPrice;
  bool? firstToClaimOffer;
  dynamic clickId;
  List<LeadTag>? leadTags;
  List<Email>? emails;
  List<Email>? phones;
  List<Address>? addresses;
  dynamic socialData;
  List<Collaborator>? collaborators;
  List<LeadTask>? leadTasks;
  List<Appointment>? appointments;
  List<LeadFile>? leadFiles;

  GetLeadsDetailResponseModel({
    this.id,
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
    this.dealStatus,
    this.dealStage,
    this.dealName,
    this.dealCloseDate,
    this.dealPrice,
    this.firstToClaimOffer,
    this.clickId,
    this.leadTags,
    this.emails,
    this.phones,
    this.addresses,
    this.socialData,
    this.collaborators,
    this.leadTasks,
    this.appointments,
    this.leadFiles,
  });

  factory GetLeadsDetailResponseModel.fromJson(Map<String, dynamic> json) => GetLeadsDetailResponseModel(
    id: json["id"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    createdById: json["createdById"],
    updatedById: json["updatedById"],
    createdVia: json["createdVia"],
    lastActivity: json["lastActivity"] == null ? null : DateTime.parse(json["lastActivity"]),
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
    picture: json["picture"],
    claimed: json["claimed"],
    dealStatus: json["dealStatus"],
    dealStage: json["dealStage"],
    dealName: json["dealName"],
    dealCloseDate: json["dealCloseDate"],
    dealPrice: json["dealPrice"],
    firstToClaimOffer: json["firstToClaimOffer"],
    clickId: json["clickId"],
    leadTags: json["lead_tags"] == null ? [] : List<LeadTag>.from(json["lead_tags"]!.map((x) => LeadTag.fromJson(x))),
    emails: json["emails"] == null ? [] : List<Email>.from(json["emails"]!.map((x) => Email.fromJson(x))),
    phones: json["phones"] == null ? [] : List<Email>.from(json["phones"]!.map((x) => Email.fromJson(x))),
    addresses: json["addresses"] == null ? [] : List<Address>.from(json["addresses"]!.map((x) => Address.fromJson(x))),
    socialData: json["socialData"],
    collaborators: json["collaborators"] == null ? [] : List<Collaborator>.from(json["collaborators"]!.map((x) => Collaborator.fromJson(x))),
    leadTasks: json["lead_tasks"] == null ? [] : List<LeadTask>.from(json["lead_tasks"]!.map((x) => LeadTask.fromJson(x))),
    appointments: json["appointments"] == null ? [] : List<Appointment>.from(json["appointments"]!.map((x) => Appointment.fromJson(x))),
    leadFiles: json["lead_files"] == null ? [] : List<LeadFile>.from(json["lead_files"]!.map((x) => LeadFile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
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
    "picture": picture,
    "claimed": claimed,
    "dealStatus": dealStatus,
    "dealStage": dealStage,
    "dealName": dealName,
    "dealCloseDate": dealCloseDate,
    "dealPrice": dealPrice,
    "firstToClaimOffer": firstToClaimOffer,
    "clickId": clickId,
    "lead_tags": leadTags == null ? [] : List<dynamic>.from(leadTags!.map((x) => x.toJson())),
    "emails": emails == null ? [] : List<dynamic>.from(emails!.map((x) => x.toJson())),
    "phones": phones == null ? [] : List<dynamic>.from(phones!.map((x) => x.toJson())),
    "addresses": addresses == null ? [] : List<dynamic>.from(addresses!.map((x) => x.toJson())),
    "socialData": socialData,
    "collaborators": collaborators == null ? [] : List<dynamic>.from(collaborators!.map((x) => x.toJson())),
    "lead_tasks": leadTasks == null ? [] : List<dynamic>.from(leadTasks!.map((x) => x.toJson())),
    "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x.toJson())),
    "lead_files": leadFiles == null ? [] : List<dynamic>.from(leadFiles!.map((x) => x.toJson())),
  };
}

class Address {
  int? id;
  int? leadId;
  dynamic leadRelationshipId;
  dynamic realtorAgentId;
  String? type;
  String? street;
  String? city;
  String? state;
  String? code;
  String? country;

  Address({
    this.id,
    this.leadId,
    this.leadRelationshipId,
    this.realtorAgentId,
    this.type,
    this.street,
    this.city,
    this.state,
    this.code,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    leadId: json["lead_id"],
    leadRelationshipId: json["lead_relationship_id"],
    realtorAgentId: json["realtor_agent_id"],
    type: json["type"],
    street: json["street"],
    city: json["city"],
    state: json["state"],
    code: json["code"],
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "lead_relationship_id": leadRelationshipId,
    "realtor_agent_id": realtorAgentId,
    "type": type,
    "street": street,
    "city": city,
    "state": state,
    "code": code,
    "country": country,
  };
}

class Appointment {
  int? id;
  DateTime? created;
  DateTime? updated;
  int? createdById;
  int? updatedById;
  int? leadId;
  String? title;
  String? description;
  String? staffDescription;
  DateTime? start;
  DateTime? end;
  String? timezone;
  bool? allDay;
  bool? originFub;
  String? location;
  dynamic typeId;
  dynamic outcomeId;
  bool? isEditable;
  bool? detailsVisible;
  dynamic type;
  dynamic outcome;
  dynamic staffEventId;
  dynamic leadEventId;
  int? fubId;
  List<AppointmentInvitee>? appointmentInvitees;

  Appointment({
    this.id,
    this.created,
    this.updated,
    this.createdById,
    this.updatedById,
    this.leadId,
    this.title,
    this.description,
    this.staffDescription,
    this.start,
    this.end,
    this.timezone,
    this.allDay,
    this.originFub,
    this.location,
    this.typeId,
    this.outcomeId,
    this.isEditable,
    this.detailsVisible,
    this.type,
    this.outcome,
    this.staffEventId,
    this.leadEventId,
    this.fubId,
    this.appointmentInvitees,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) => Appointment(
    id: json["id"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    createdById: json["createdById"],
    updatedById: json["updatedById"],
    leadId: json["lead_id"],
    title: json["title"],
    description: json["description"],
    staffDescription: json["staffDescription"],
    start: json["start"] == null ? null : DateTime.parse(json["start"]),
    end: json["end"] == null ? null : DateTime.parse(json["end"]),
    timezone: json["timezone"],
    allDay: json["allDay"],
    originFub: json["originFub"],
    location: json["location"],
    typeId: json["typeId"],
    outcomeId: json["outcomeId"],
    isEditable: json["isEditable"],
    detailsVisible: json["detailsVisible"],
    type: json["type"],
    outcome: json["outcome"],
    staffEventId: json["staffEventId"],
    leadEventId: json["leadEventId"],
    fubId: json["fub_id"],
    appointmentInvitees: json["appointment_invitees"] == null ? [] : List<AppointmentInvitee>.from(json["appointment_invitees"]!.map((x) => AppointmentInvitee.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created": created?.toIso8601String(),
    "updated": updated?.toIso8601String(),
    "createdById": createdById,
    "updatedById": updatedById,
    "lead_id": leadId,
    "title": title,
    "description": description,
    "staffDescription": staffDescription,
    "start": start?.toIso8601String(),
    "end": end?.toIso8601String(),
    "timezone": timezone,
    "allDay": allDay,
    "originFub": originFub,
    "location": location,
    "typeId": typeId,
    "outcomeId": outcomeId,
    "isEditable": isEditable,
    "detailsVisible": detailsVisible,
    "type": type,
    "outcome": outcome,
    "staffEventId": staffEventId,
    "leadEventId": leadEventId,
    "fub_id": fubId,
    "appointment_invitees": appointmentInvitees == null ? [] : List<dynamic>.from(appointmentInvitees!.map((x) => x.toJson())),
  };
}

class AppointmentInvitee {
  int? id;
  int? appointmentId;
  int? userId;
  int? leadId;
  dynamic leadRelationshipId;
  String? name;
  String? email;
  String? picture;

  AppointmentInvitee({
    this.id,
    this.appointmentId,
    this.userId,
    this.leadId,
    this.leadRelationshipId,
    this.name,
    this.email,
    this.picture,
  });

  factory AppointmentInvitee.fromJson(Map<String, dynamic> json) => AppointmentInvitee(
    id: json["id"],
    appointmentId: json["appointment_id"],
    userId: json["user_id"],
    leadId: json["lead_id"],
    leadRelationshipId: json["lead_relationship_id"],
    name: json["name"],
    email: json["email"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "appointment_id": appointmentId,
    "user_id": userId,
    "lead_id": leadId,
    "lead_relationship_id": leadRelationshipId,
    "name": name,
    "email": email,
    "picture": picture,
  };
}

class Collaborator {
  int? id;
  String? name;
  bool? assigned;
  String? role;

  Collaborator({
    this.id,
    this.name,
    this.assigned,
    this.role,
  });

  factory Collaborator.fromJson(Map<String, dynamic> json) => Collaborator(
    id: json["id"],
    name: json["name"],
    assigned: json["assigned"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "assigned": assigned,
    "role": role,
  };
}

class Email {
  int? id;
  int? leadId;
  dynamic leadRelationshipId;
  dynamic realtorAgentId;
  String? value;
  String? type;
  String? status;
  bool? isPrimary;
  bool? isEditable;
  String? normalized;
  bool? badNumber;

  Email({
    this.id,
    this.leadId,
    this.leadRelationshipId,
    this.realtorAgentId,
    this.value,
    this.type,
    this.status,
    this.isPrimary,
    this.isEditable,
    this.normalized,
    this.badNumber,
  });

  factory Email.fromJson(Map<String, dynamic> json) => Email(
    id: json["id"],
    leadId: json["lead_id"],
    leadRelationshipId: json["lead_relationship_id"],
    realtorAgentId: json["realtor_agent_id"],
    value: json["value"],
    type: json["type"],
    status: json["status"],
    isPrimary: json["isPrimary"],
    isEditable: json["isEditable"],
    normalized: json["normalized"],
    badNumber: json["bad_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "lead_relationship_id": leadRelationshipId,
    "realtor_agent_id": realtorAgentId,
    "value": value,
    "type": type,
    "status": status,
    "isPrimary": isPrimary,
    "isEditable": isEditable,
    "normalized": normalized,
    "bad_number": badNumber,
  };
}

class LeadFile {
  int? id;
  int? leadId;
  int? createdById;
  dynamic updatedById;
  dynamic deletedById;
  String? fileName;
  String? filePath;
  String? relativeFilePath;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  CreatedBy? createdBy;

  LeadFile({
    this.id,
    this.leadId,
    this.createdById,
    this.updatedById,
    this.deletedById,
    this.fileName,
    this.filePath,
    this.relativeFilePath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.createdBy,
  });

  factory LeadFile.fromJson(Map<String, dynamic> json) => LeadFile(
    id: json["id"],
    leadId: json["lead_id"],
    createdById: json["createdById"],
    updatedById: json["updatedById"],
    deletedById: json["deletedById"],
    fileName: json["fileName"],
    filePath: json["filePath"],
    relativeFilePath: json["relativeFilePath"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
    createdBy: json["createdBy"] == null ? null : CreatedBy.fromJson(json["createdBy"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "createdById": createdById,
    "updatedById": updatedById,
    "deletedById": deletedById,
    "fileName": fileName,
    "filePath": filePath,
    "relativeFilePath": relativeFilePath,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
    "createdBy": createdBy?.toJson(),
  };
}

class CreatedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;

  CreatedBy({
    this.id,
    this.firstName,
    this.lastName,
    this.fullName,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    fullName: json["full_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "full_name": fullName,
  };
}

class LeadTag {
  int? id;
  int? leadId;
  dynamic tagNameId;
  String? tag;

  LeadTag({
    this.id,
    this.leadId,
    this.tagNameId,
    this.tag,
  });

  factory LeadTag.fromJson(Map<String, dynamic> json) => LeadTag(
    id: json["id"],
    leadId: json["lead_id"],
    tagNameId: json["tag_name_id"],
    tag: json["tag"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lead_id": leadId,
    "tag_name_id": tagNameId,
    "tag": tag,
  };
}

class LeadTask {
  int? id;
  int? fubId;
  DateTime? created;
  DateTime? updated;
  String? createdBy;
  String? updatedBy;
  int? leadId;
  dynamic realtorAgentId;
  String? assignedTo;
  int? assignedUserId;
  String? name;
  String? type;
  bool? isCompleted;
  DateTime? dueDate;
  DateTime? dueDateTime;
  String? externalTaskLink;
  int? externalCalendarId;
  int? remindSecondsBefore;

  LeadTask({
    this.id,
    this.fubId,
    this.created,
    this.updated,
    this.createdBy,
    this.updatedBy,
    this.leadId,
    this.realtorAgentId,
    this.assignedTo,
    this.assignedUserId,
    this.name,
    this.type,
    this.isCompleted,
    this.dueDate,
    this.dueDateTime,
    this.externalTaskLink,
    this.externalCalendarId,
    this.remindSecondsBefore,
  });

  factory LeadTask.fromJson(Map<String, dynamic> json) => LeadTask(
    id: json["id"],
    fubId: json["fub_id"],
    created: json["created"] == null ? null : DateTime.parse(json["created"]),
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    createdBy: json["createdBy"],
    updatedBy: json["updatedBy"],
    leadId: json["lead_id"],
    realtorAgentId: json["realtor_agent_id"],
    assignedTo: json["AssignedTo"],
    assignedUserId: json["assignedUserId"],
    name: json["name"],
    type: json["type"],
    isCompleted: json["isCompleted"],
    dueDate: json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
    dueDateTime: json["dueDateTime"] == null ? null : DateTime.parse(json["dueDateTime"]),
    externalTaskLink: json["externalTaskLink"],
    externalCalendarId: json["externalCalendarId"],
    remindSecondsBefore: json["remindSecondsBefore"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fub_id": fubId,
    "created": created?.toIso8601String(),
    "updated": updated?.toIso8601String(),
    "createdBy": createdBy,
    "updatedBy": updatedBy,
    "lead_id": leadId,
    "realtor_agent_id": realtorAgentId,
    "AssignedTo": assignedTo,
    "assignedUserId": assignedUserId,
    "name": name,
    "type": type,
    "isCompleted": isCompleted,
    "dueDate": "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
    "dueDateTime": dueDateTime?.toIso8601String(),
    "externalTaskLink": externalTaskLink,
    "externalCalendarId": externalCalendarId,
    "remindSecondsBefore": remindSecondsBefore,
  };
}
