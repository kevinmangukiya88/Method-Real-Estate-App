// To parse this JSON data, do
//
//     final getLeadsAppointmentResponseModel = getLeadsAppointmentResponseModelFromJson(jsonString);

import 'dart:convert';

GetLeadsAppointmentResponseModel getLeadsAppointmentResponseModelFromJson(String str) => GetLeadsAppointmentResponseModel.fromJson(json.decode(str));

String getLeadsAppointmentResponseModelToJson(GetLeadsAppointmentResponseModel data) => json.encode(data.toJson());

class GetLeadsAppointmentResponseModel {
  Metadata? metadata;
  List<Appointment>? appointments;

  GetLeadsAppointmentResponseModel({
    this.metadata,
    this.appointments,
  });

  factory GetLeadsAppointmentResponseModel.fromJson(Map<String, dynamic> json) => GetLeadsAppointmentResponseModel(
    metadata: json["_metadata"] == null ? null : Metadata.fromJson(json["_metadata"]),
    appointments: json["appointments"] == null ? [] : List<Appointment>.from(json["appointments"]!.map((x) => Appointment.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_metadata": metadata?.toJson(),
    "appointments": appointments == null ? [] : List<dynamic>.from(appointments!.map((x) => x.toJson())),
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
