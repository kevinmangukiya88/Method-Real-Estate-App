class GetLeadsTimelineResponseModel {
  Metadata? mMetadata;
  List<Timelines>? timelines;

  GetLeadsTimelineResponseModel({this.mMetadata, this.timelines});

  GetLeadsTimelineResponseModel.fromJson(Map<String, dynamic> json) {
    mMetadata = json['_metadata'] != null
        ? new Metadata.fromJson(json['_metadata'])
        : null;
    if (json['timelines'] != null) {
      timelines = <Timelines>[];
      json['timelines'].forEach((v) {
        timelines!.add(new Timelines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMetadata != null) {
      data['_metadata'] = this.mMetadata!.toJson();
    }
    if (this.timelines != null) {
      data['timelines'] = this.timelines!.map((v) => v.toJson()).toList();
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

class Timelines {
  int? id;
  int? leadId;
  int? callId;
  dynamic noteId;
  int? textMessageId;
  int? emailId;
  int? fileId;
  String? type;
  bool? isIncoming;
  bool? isStarred;
  String? createdAt;
  String? updatedAt;
  Call? call;
  dynamic note;
  TextMessage? textMessage;
  EmailsDatum? emailsDatum;
  LeadFile? leadFile;

  Timelines(
      {this.id,
      this.leadId,
      this.callId,
      this.noteId,
      this.textMessageId,
      this.emailId,
      this.fileId,
      this.type,
      this.isIncoming,
      this.isStarred,
      this.createdAt,
      this.updatedAt,
      this.call,
      this.note,
      this.textMessage,
      this.emailsDatum,
      this.leadFile});

  Timelines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    callId = json['call_id'];
    noteId = json['note_id'] == null ? 0 : json['note_id'];
    textMessageId = json['text_message_id'];
    emailId = json['email_id'];
    fileId = json['file_id'];
    type = json['type'];
    isIncoming = json['is_incoming'];
    isStarred = json['is_starred'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    call = json['call'] != null ? new Call.fromJson(json['call']) : null;
    note = json['note'];
    textMessage = json['text_message'] != null
        ? new TextMessage.fromJson(json['text_message'])
        : null;
    emailsDatum = json['emails_datum'] != null
        ? new EmailsDatum.fromJson(json['emails_datum'])
        : null;
    leadFile = json['lead_file'] != null
        ? new LeadFile.fromJson(json['lead_file'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['call_id'] = this.callId;
    data['note_id'] = this.noteId;
    data['text_message_id'] = this.textMessageId;
    data['email_id'] = this.emailId;
    data['file_id'] = this.fileId;
    data['type'] = this.type;
    data['is_incoming'] = this.isIncoming;
    data['is_starred'] = this.isStarred;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.call != null) {
      data['call'] = this.call!.toJson();
    }
    data['note'] = this.note;
    if (this.textMessage != null) {
      data['text_message'] = this.textMessage!.toJson();
    }
    if (this.emailsDatum != null) {
      data['emails_datum'] = this.emailsDatum!.toJson();
    }
    if (this.leadFile != null) {
      data['lead_file'] = this.leadFile!.toJson();
    }
    return data;
  }
}

class Call {
  int? id;
  String? created;
  String? updated;
  int? createdById;
  int? updatedById;
  int? leadId;
  int? realtorAgentId;
  String? name;
  String? firstName;
  String? lastName;
  int? userId;
  String? userName;
  String? phone;
  String? fromNumber;
  String? toNumber;
  dynamic forwardNumber;
  String? note;
  String? outcome;
  bool? isIncoming;
  int? duration;
  String? recordingUrl;
  int? sharedInboxId;
  String? conferenceCallId;
  String? callerSID;
  dynamic systemId;
  bool? coldTransferInProgress;
  int? extensionId;
  String? extensionCallSid;
  String? numberPrefixLabel;
  dynamic profileImg;
  int? fubCallId;

  Call(
      {this.id,
      this.created,
      this.updated,
      this.createdById,
      this.updatedById,
      this.leadId,
      this.realtorAgentId,
      this.name,
      this.firstName,
      this.lastName,
      this.userId,
      this.userName,
      this.phone,
      this.fromNumber,
      this.toNumber,
      this.forwardNumber,
      this.note,
      this.outcome,
      this.isIncoming,
      this.duration,
      this.recordingUrl,
      this.sharedInboxId,
      this.conferenceCallId,
      this.callerSID,
      this.systemId,
      this.coldTransferInProgress,
      this.extensionId,
      this.extensionCallSid,
      this.numberPrefixLabel,
      this.profileImg,
      this.fubCallId});

  Call.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    leadId = json['lead_id'];
    realtorAgentId = json['realtor_agent_id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userId = json['userId'];
    userName = json['userName'];
    phone = json['phone'];
    fromNumber = json['fromNumber'];
    toNumber = json['toNumber'];
    forwardNumber = json['forwardNumber'];
    note = json['note'];
    outcome = json['outcome'];
    isIncoming = json['isIncoming'];
    duration = json['duration'];
    recordingUrl = json['recordingUrl'];
    sharedInboxId = json['sharedInboxId'];
    conferenceCallId = json['conferenceCallId'];
    callerSID = json['callerSID'];
    systemId = json['systemId'];
    coldTransferInProgress = json['cold_transfer_in_progress'];
    extensionId = json['extension_id'];
    extensionCallSid = json['extension_call_sid'];
    numberPrefixLabel = json['number_prefix_label'];
    profileImg = json['profile_img'];
    fubCallId = json['fub_call_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['lead_id'] = this.leadId;
    data['realtor_agent_id'] = this.realtorAgentId;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['phone'] = this.phone;
    data['fromNumber'] = this.fromNumber;
    data['toNumber'] = this.toNumber;
    data['forwardNumber'] = this.forwardNumber;
    data['note'] = this.note;
    data['outcome'] = this.outcome;
    data['isIncoming'] = this.isIncoming;
    data['duration'] = this.duration;
    data['recordingUrl'] = this.recordingUrl;
    data['sharedInboxId'] = this.sharedInboxId;
    data['conferenceCallId'] = this.conferenceCallId;
    data['callerSID'] = this.callerSID;
    data['systemId'] = this.systemId;
    data['cold_transfer_in_progress'] = this.coldTransferInProgress;
    data['extension_id'] = this.extensionId;
    data['extension_call_sid'] = this.extensionCallSid;
    data['number_prefix_label'] = this.numberPrefixLabel;
    data['profile_img'] = this.profileImg;
    data['fub_call_id'] = this.fubCallId;
    return data;
  }
}

class TextMessage {
  int? id;
  String? created;
  String? updated;
  int? createdById;
  int? updatedById;
  int? leadId;
  dynamic realtorAgentId;
  dynamic marketId;
  String? name;
  String? firstName;
  String? lastName;
  dynamic picture;
  int? userId;
  String? userName;
  String? status;
  String? message;
  String? fromNumber;
  String? toNumber;
  String? sent;
  bool? isIncoming;
  bool? archived;
  bool? read;
  int? sharedInboxId;
  int? actionplanId;
  dynamic groupTextId;
  bool? isExternal;
  dynamic externalUrl;
  dynamic externalLabel;
  String? systemId;
  dynamic systemName;
  String? profileImg;
  int? fubMessageId;

  TextMessage(
      {this.id,
      this.created,
      this.updated,
      this.createdById,
      this.updatedById,
      this.leadId,
      this.realtorAgentId,
      this.marketId,
      this.name,
      this.firstName,
      this.lastName,
      this.picture,
      this.userId,
      this.userName,
      this.status,
      this.message,
      this.fromNumber,
      this.toNumber,
      this.sent,
      this.isIncoming,
      this.archived,
      this.read,
      this.sharedInboxId,
      this.actionplanId,
      this.groupTextId,
      this.isExternal,
      this.externalUrl,
      this.externalLabel,
      this.systemId,
      this.systemName,
      this.profileImg,
      this.fubMessageId});

  TextMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    leadId = json['lead_id'];
    realtorAgentId = json['realtor_agent_id'];
    marketId = json['market_id'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
    userId = json['userId'];
    userName = json['userName'];
    status = json['status'];
    message = json['message'];
    fromNumber = json['fromNumber'];
    toNumber = json['toNumber'];
    sent = json['sent'];
    isIncoming = json['isIncoming'];
    archived = json['archived'];
    read = json['read'];
    sharedInboxId = json['sharedInboxId'];
    actionplanId = json['actionplanId'];
    groupTextId = json['groupTextId'];
    isExternal = json['isExternal'];
    externalUrl = json['externalUrl'];
    externalLabel = json['externalLabel'];
    systemId = json['systemId'];
    systemName = json['systemName'];
    profileImg = json['profile_img'];
    fubMessageId = json['fub_message_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created'] = this.created;
    data['updated'] = this.updated;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['lead_id'] = this.leadId;
    data['realtor_agent_id'] = this.realtorAgentId;
    data['market_id'] = this.marketId;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['picture'] = this.picture;
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['status'] = this.status;
    data['message'] = this.message;
    data['fromNumber'] = this.fromNumber;
    data['toNumber'] = this.toNumber;
    data['sent'] = this.sent;
    data['isIncoming'] = this.isIncoming;
    data['archived'] = this.archived;
    data['read'] = this.read;
    data['sharedInboxId'] = this.sharedInboxId;
    data['actionplanId'] = this.actionplanId;
    data['groupTextId'] = this.groupTextId;
    data['isExternal'] = this.isExternal;
    data['externalUrl'] = this.externalUrl;
    data['externalLabel'] = this.externalLabel;
    data['systemId'] = this.systemId;
    data['systemName'] = this.systemName;
    data['profile_img'] = this.profileImg;
    data['fub_message_id'] = this.fubMessageId;
    return data;
  }
}

class EmailsDatum {
  int? id;
  int? createdById;
  String? createdBy;
  String? created;
  int? leadId;
  dynamic realtorAgentId;
  dynamic contractId;
  String? to;
  dynamic toEmails;
  dynamic cc;
  dynamic bcc;
  String? from;
  dynamic fromEmails;
  String? subject;
  dynamic publishTime;
  String? messageId;
  dynamic scheduledAt;
  String? type;
  dynamic status;
  dynamic profileImg;
  String? recipientUid;
  int? count;
  dynamic threadId;
  dynamic threadGmailId;
  SentBy? sentBy;
  BodyData? bodyData;
  List<dynamic>? emailOpenTimes;

  EmailsDatum(
      {this.id,
      this.createdById,
      this.createdBy,
      this.created,
      this.leadId,
      this.realtorAgentId,
      this.contractId,
      this.to,
      this.toEmails,
      this.cc,
      this.bcc,
      this.from,
      this.fromEmails,
      this.subject,
      this.publishTime,
      this.messageId,
      this.scheduledAt,
      this.type,
      this.status,
      this.profileImg,
      this.recipientUid,
      this.count,
      this.threadId,
      this.threadGmailId,
      this.sentBy,
      this.bodyData,
      this.emailOpenTimes});

  EmailsDatum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdById = json['createdById'];
    createdBy = json['createdBy'];
    created = json['created'];
    leadId = json['lead_id'];
    realtorAgentId = json['realtor_agent_id'];
    contractId = json['contract_id'];
    to = json['to'];
    toEmails = json['to_emails'];
    cc = json['cc'];
    bcc = json['bcc'];
    from = json['from'];
    fromEmails = json['from_emails'];
    subject = json['subject'];
    publishTime = json['publish_time'];
    messageId = json['message_id'];
    scheduledAt = json['scheduled_at'];
    type = json['type'];
    status = json['status'];
    profileImg = json['profile_img'];
    recipientUid = json['recipient_uid'];
    count = json['count'];
    threadId = json['thread_id'];
    threadGmailId = json['thread_gmail_id'];
    sentBy =
        json['sent_by'] != null ? new SentBy.fromJson(json['sent_by']) : null;
    bodyData = json['body_data'] != null
        ? new BodyData.fromJson(json['body_data'])
        : null;
    if (json['email_open_times'] != null) {
      emailOpenTimes = <dynamic>[];
      json['email_open_times'].forEach((v) {
        emailOpenTimes!.add(json['email_open_times']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdById'] = this.createdById;
    data['createdBy'] = this.createdBy;
    data['created'] = this.created;
    data['lead_id'] = this.leadId;
    data['realtor_agent_id'] = this.realtorAgentId;
    data['contract_id'] = this.contractId;
    data['to'] = this.to;
    data['to_emails'] = this.toEmails;
    data['cc'] = this.cc;
    data['bcc'] = this.bcc;
    data['from'] = this.from;
    data['from_emails'] = this.fromEmails;
    data['subject'] = this.subject;
    data['publish_time'] = this.publishTime;
    data['message_id'] = this.messageId;
    data['scheduled_at'] = this.scheduledAt;
    data['type'] = this.type;
    data['status'] = this.status;
    data['profile_img'] = this.profileImg;
    data['recipient_uid'] = this.recipientUid;
    data['count'] = this.count;
    data['thread_id'] = this.threadId;
    data['thread_gmail_id'] = this.threadGmailId;
    if (this.sentBy != null) {
      data['sent_by'] = this.sentBy!.toJson();
    }
    if (this.bodyData != null) {
      data['body_data'] = this.bodyData!.toJson();
    }
    if (this.emailOpenTimes != null) {
      data['email_open_times'] =
          this.emailOpenTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SentBy {
  String? fullName;
  String? firstName;
  String? lastName;
  String? email;

  SentBy({this.fullName, this.firstName, this.lastName, this.email});

  SentBy.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    return data;
  }
}

class BodyData {
  int? id;
  int? leadEmailId;
  dynamic bodyText;
  String? bodyHtml;

  BodyData({this.id, this.leadEmailId, this.bodyText, this.bodyHtml});

  BodyData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadEmailId = json['lead_email_id'];
    bodyText = json['body_text'];
    bodyHtml = json['body_html'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_email_id'] = this.leadEmailId;
    data['body_text'] = this.bodyText;
    data['body_html'] = this.bodyHtml;
    return data;
  }
}

class LeadFile {
  int? id;
  int? leadId;
  int? createdById;
  dynamic updatedById;
  int? deletedById;
  String? fileName;
  String? filePath;
  String? relativeFilePath;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  CreatedBy? createdBy;
  CreatedBy? deletedBy;

  LeadFile(
      {this.id,
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
      this.deletedBy});

  LeadFile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leadId = json['lead_id'];
    createdById = json['createdById'];
    updatedById = json['updatedById'];
    deletedById = json['deletedById'];
    fileName = json['fileName'];
    filePath = json['filePath'];
    relativeFilePath = json['relativeFilePath'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    createdBy = json['createdBy'] != null
        ? new CreatedBy.fromJson(json['createdBy'])
        : null;
    deletedBy = json['deletedBy'] != null
        ? new CreatedBy.fromJson(json['deletedBy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lead_id'] = this.leadId;
    data['createdById'] = this.createdById;
    data['updatedById'] = this.updatedById;
    data['deletedById'] = this.deletedById;
    data['fileName'] = this.fileName;
    data['filePath'] = this.filePath;
    data['relativeFilePath'] = this.relativeFilePath;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.createdBy != null) {
      data['createdBy'] = this.createdBy!.toJson();
    }
    if (this.deletedBy != null) {
      data['deletedBy'] = this.deletedBy!.toJson();
    }
    return data;
  }
}

class CreatedBy {
  int? id;
  String? firstName;
  String? lastName;
  String? fullName;

  CreatedBy({this.id, this.firstName, this.lastName, this.fullName});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    return data;
  }
}
