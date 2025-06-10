class GetCloseTransactionResponseModel {
  int? status;
  Data? data;

  GetCloseTransactionResponseModel({this.status, this.data});

  GetCloseTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? count;
  List<Contracts>? contracts;
  int? totalClosed;
  int? totalActive;
  int? thisMonthClosed;
  int? thisMonthVolume;
  dynamic thisYearVolume;
  int? thisWeekClosing;
  int? totalPastContingencies;

  Data(
      {this.count,
      this.contracts,
      this.totalClosed,
      this.totalActive,
      this.thisMonthClosed,
      this.thisMonthVolume,
      this.thisYearVolume,
      this.thisWeekClosing,
      this.totalPastContingencies});

  Data.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['contracts'] != null) {
      contracts = <Contracts>[];
      json['contracts'].forEach((v) {
        contracts!.add(new Contracts.fromJson(v));
      });
    }
    totalClosed = json['total_closed'];
    totalActive = json['total_active'];
    thisMonthClosed = json['this_month_closed'];
    thisMonthVolume = json['this_month_volume'];
    thisYearVolume = json['this_year_volume'];
    thisWeekClosing = json['this_week_closing'];
    totalPastContingencies = json['total_past_contingencies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.contracts != null) {
      data['contracts'] = this.contracts!.map((v) => v.toJson()).toList();
    }
    data['total_closed'] = this.totalClosed;
    data['total_active'] = this.totalActive;
    data['this_month_closed'] = this.thisMonthClosed;
    data['this_month_volume'] = this.thisMonthVolume;
    data['this_year_volume'] = this.thisYearVolume;
    data['this_week_closing'] = this.thisWeekClosing;
    data['total_past_contingencies'] = this.totalPastContingencies;
    return data;
  }
}

class Contracts {
  int? id;
  String? contractType;
  String? agentName;
  int? agentId;
  dynamic buyer0PersonId;
  String? buyer0Type;
  String? buyer0FirstName;
  dynamic buyer0MiddleInitials;
  String? buyer0LastName;
  dynamic buyer0Phone;
  dynamic buyer0Email;
  dynamic buyer0EntityName;
  dynamic buyer1PersonId;
  String? buyer1Type;
  String? buyer1FirstName;
  dynamic buyer1MiddleInitials;
  String? buyer1LastName;
  dynamic buyer1Phone;
  dynamic buyer1Email;
  dynamic buyer1EntityName;
  dynamic seller0PersonId;
  String? seller0Type;
  String? seller0FirstName;
  dynamic seller0MiddleInitials;
  String? seller0LastName;
  dynamic seller0Phone;
  dynamic seller0Email;
  String? seller0EntityName;
  dynamic seller1PersonId;
  String? seller1Type;
  String? seller1FirstName;
  dynamic seller1MiddleInitials;
  String? seller1LastName;
  dynamic seller1Phone;
  dynamic seller1Email;
  dynamic seller1EntityName;
  String? propertyType;
  String? propertyAddress;
  dynamic unitNumber;
  dynamic lotNumber;
  String? street;
  String? city;
  String? state;
  String? zipcode;
  String? price;
  String? bindingDate;
  String? closingDate;
  String? dueDilligenceDays;
  dynamic dueDilligenceDate;
  String? financingType;
  String? financeContingencyDays;
  String? financeContingencyDate;
  String? appraisalContingencyDays;
  String? appraisalContingencyDate;
  String? earnestMoneyAmount;
  String? earnestMoneyHolder;
  String? earnestMoneyDueDate;
  int? closingAttorneyId;
  String? closingAttorneyFirstName;
  String? closingAttorneyLastName;
  String? closingAttorneyPhone;
  String? closingAttorneyCompany;
  String? closingAttorneyEmail;
  String? lenderCompanyName;
  int? loanOfficerId;
  dynamic lenderCompanyPhone;
  String? loanOfficerEmail;
  String? loanOfficerFirstName;
  String? loanOfficerLastName;
  String? loanOfficerPhone;
  String? oppositePartyName;
  dynamic coOpAgentId;
  String? coOpFirstName;
  String? coOpLastName;
  String? coOpEmail;
  String? coOpPhone;
  String? coOpAgentCompany;
  String? status;
  int? attachedListing;
  dynamic fubId;
  dynamic weRepresent;
  int? bedrooms;
  int? baths;
  int? sqFeet;
  String? fmlsNumber;
  dynamic gamlsNumber;
  dynamic gci;
  dynamic agentSplit;
  dynamic assignedAgentSplit;
  dynamic companyDollar;
  dynamic qbSubCustomerId;
  dynamic closedUnprocessedStatusDate;
  dynamic closedProcessedStatusDate;
  String? propertyImg;
  dynamic submittedBy;
  dynamic qbInvoiceId;
  dynamic homeWarrantyCompany;
  dynamic homeWarrantyAmount;
  dynamic powerCompany;
  dynamic powerCompanyPhone;
  dynamic waterCompany;
  dynamic waterCompanyPhone;
  dynamic sanitationCompany;
  dynamic sanitationCompanyPhone;
  dynamic bindingAgreementDate;
  dynamic netCommission;
  dynamic commissionPlainId;
  dynamic closingNotes;
  dynamic closedBy;
  dynamic closedById;
  dynamic deductableAmount;
  dynamic privateRemark;
  dynamic referralParentContractId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<TransactionDocuments>? transactionDocuments;
  Agent? agent;

  Contracts(
      {this.id,
      this.contractType,
      this.agentName,
      this.agentId,
      this.buyer0PersonId,
      this.buyer0Type,
      this.buyer0FirstName,
      this.buyer0MiddleInitials,
      this.buyer0LastName,
      this.buyer0Phone,
      this.buyer0Email,
      this.buyer0EntityName,
      this.buyer1PersonId,
      this.buyer1Type,
      this.buyer1FirstName,
      this.buyer1MiddleInitials,
      this.buyer1LastName,
      this.buyer1Phone,
      this.buyer1Email,
      this.buyer1EntityName,
      this.seller0PersonId,
      this.seller0Type,
      this.seller0FirstName,
      this.seller0MiddleInitials,
      this.seller0LastName,
      this.seller0Phone,
      this.seller0Email,
      this.seller0EntityName,
      this.seller1PersonId,
      this.seller1Type,
      this.seller1FirstName,
      this.seller1MiddleInitials,
      this.seller1LastName,
      this.seller1Phone,
      this.seller1Email,
      this.seller1EntityName,
      this.propertyType,
      this.propertyAddress,
      this.unitNumber,
      this.lotNumber,
      this.street,
      this.city,
      this.state,
      this.zipcode,
      this.price,
      this.bindingDate,
      this.closingDate,
      this.dueDilligenceDays,
      this.dueDilligenceDate,
      this.financingType,
      this.financeContingencyDays,
      this.financeContingencyDate,
      this.appraisalContingencyDays,
      this.appraisalContingencyDate,
      this.earnestMoneyAmount,
      this.earnestMoneyHolder,
      this.earnestMoneyDueDate,
      this.closingAttorneyId,
      this.closingAttorneyFirstName,
      this.closingAttorneyLastName,
      this.closingAttorneyPhone,
      this.closingAttorneyCompany,
      this.closingAttorneyEmail,
      this.lenderCompanyName,
      this.loanOfficerId,
      this.lenderCompanyPhone,
      this.loanOfficerEmail,
      this.loanOfficerFirstName,
      this.loanOfficerLastName,
      this.loanOfficerPhone,
      this.oppositePartyName,
      this.coOpAgentId,
      this.coOpFirstName,
      this.coOpLastName,
      this.coOpEmail,
      this.coOpPhone,
      this.coOpAgentCompany,
      this.status,
      this.attachedListing,
      this.fubId,
      this.weRepresent,
      this.bedrooms,
      this.baths,
      this.sqFeet,
      this.fmlsNumber,
      this.gamlsNumber,
      this.gci,
      this.agentSplit,
      this.assignedAgentSplit,
      this.companyDollar,
      this.qbSubCustomerId,
      this.closedUnprocessedStatusDate,
      this.closedProcessedStatusDate,
      this.propertyImg,
      this.submittedBy,
      this.qbInvoiceId,
      this.homeWarrantyCompany,
      this.homeWarrantyAmount,
      this.powerCompany,
      this.powerCompanyPhone,
      this.waterCompany,
      this.waterCompanyPhone,
      this.sanitationCompany,
      this.sanitationCompanyPhone,
      this.bindingAgreementDate,
      this.netCommission,
      this.commissionPlainId,
      this.closingNotes,
      this.closedBy,
      this.closedById,
      this.deductableAmount,
      this.privateRemark,
      this.referralParentContractId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.transactionDocuments,
      this.agent});

  Contracts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contract_type'];
    agentName = json['agent_name'];
    agentId = json['agent_id'];
    buyer0PersonId = json['buyer0_personId'];
    buyer0Type = json['buyer0_type'];
    buyer0FirstName = json['buyer0_first_name'];
    buyer0MiddleInitials = json['buyer0_middle_initials'];
    buyer0LastName = json['buyer0_last_name'];
    buyer0Phone = json['buyer0_phone'];
    buyer0Email = json['buyer0_email'];
    buyer0EntityName = json['buyer0_entity_name'];
    buyer1PersonId = json['buyer1_personId'];
    buyer1Type = json['buyer1_type'];
    buyer1FirstName = json['buyer1_first_name'];
    buyer1MiddleInitials = json['buyer1_middle_initials'];
    buyer1LastName = json['buyer1_last_name'];
    buyer1Phone = json['buyer1_phone'];
    buyer1Email = json['buyer1_email'];
    buyer1EntityName = json['buyer1_entity_name'];
    seller0PersonId = json['seller0_personId'];
    seller0Type = json['seller0_type'];
    seller0FirstName = json['seller0_first_name'];
    seller0MiddleInitials = json['seller0_middle_initials'];
    seller0LastName = json['seller0_last_name'];
    seller0Phone = json['seller0_phone'];
    seller0Email = json['seller0_email'];
    seller0EntityName = json['seller0_entity_name'];
    seller1PersonId = json['seller1_personId'];
    seller1Type = json['seller1_type'];
    seller1FirstName = json['seller1_first_name'];
    seller1MiddleInitials = json['seller1_middle_initials'];
    seller1LastName = json['seller1_last_name'];
    seller1Phone = json['seller1_phone'];
    seller1Email = json['seller1_email'];
    seller1EntityName = json['seller1_entity_name'];
    propertyType = json['property_type'];
    propertyAddress = json['property_address'];
    unitNumber = json['unit_number'];
    lotNumber = json['lot_number'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    price = json['price'];
    bindingDate = json['binding_date'];
    closingDate = json['closing_date'];
    dueDilligenceDays = json['due_dilligence_days'];
    dueDilligenceDate = json['due_dilligence_date'];
    financingType = json['financing_type'];
    financeContingencyDays = json['finance_contingency_days'];
    financeContingencyDate = json['finance_contingency_date'];
    appraisalContingencyDays = json['appraisal_contingency_days'];
    appraisalContingencyDate = json['appraisal_contingency_date'];
    earnestMoneyAmount = json['earnest_money_amount'];
    earnestMoneyHolder = json['earnest_money_holder'];
    earnestMoneyDueDate = json['earnest_money_due_date'];
    closingAttorneyId = json['closing_attorney_id'];
    closingAttorneyFirstName = json['closing_attorney_first_name'];
    closingAttorneyLastName = json['closing_attorney_last_name'];
    closingAttorneyPhone = json['closing_attorney_phone'];
    closingAttorneyCompany = json['closing_attorney_company'];
    closingAttorneyEmail = json['closing_attorney_email'];
    lenderCompanyName = json['lender_company_name'];
    loanOfficerId = json['loan_officer_id'];
    lenderCompanyPhone = json['lender_company_phone'];
    loanOfficerEmail = json['loan_officer_email'];
    loanOfficerFirstName = json['loan_officer_first_name'];
    loanOfficerLastName = json['loan_officer_last_name'];
    loanOfficerPhone = json['loan_officer_phone'];
    oppositePartyName = json['opposite_party_name'];
    coOpAgentId = json['co_op_agent_id'];
    coOpFirstName = json['co_op_first_name'];
    coOpLastName = json['co_op_last_name'];
    coOpEmail = json['co_op_email'];
    coOpPhone = json['co_op_phone'];
    coOpAgentCompany = json['co_op_agent_company'];
    status = json['status'];
    attachedListing = json['attached_listing'];
    fubId = json['fub_id'];
    weRepresent = json['we_represent'];
    bedrooms = json['bedrooms'];
    baths = json['baths'];
    sqFeet = json['sq_feet'];
    fmlsNumber = json['fmls_number'];
    gamlsNumber = json['gamls_number'];
    gci = json['gci'];
    agentSplit = json['agent_split'];
    assignedAgentSplit = json['assigned_agent_split'];
    companyDollar = json['company_dollar'];
    qbSubCustomerId = json['qb_sub_customer_id'];
    closedUnprocessedStatusDate = json['closed_unprocessed_status_date'];
    closedProcessedStatusDate = json['closed_processed_status_date'];
    propertyImg = json['property_img'];
    submittedBy = json['submitted_by'];
    qbInvoiceId = json['qb_invoice_id'];
    homeWarrantyCompany = json['home_warranty_company'];
    homeWarrantyAmount = json['home_warranty_amount'];
    powerCompany = json['power_company'];
    powerCompanyPhone = json['power_company_phone'];
    waterCompany = json['water_company'];
    waterCompanyPhone = json['water_company_phone'];
    sanitationCompany = json['sanitation_company'];
    sanitationCompanyPhone = json['sanitation_company_phone'];
    bindingAgreementDate = json['binding_agreement_date'];
    netCommission = json['net_commission'];
    commissionPlainId = json['commission_plain_id'];
    closingNotes = json['closing_notes'];
    closedBy = json['closed_by'];
    closedById = json['closed_by_id'];
    deductableAmount = json['deductable_amount'];
    privateRemark = json['private_remark'];
    referralParentContractId = json['referral_parent_contract_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    if (json['transaction_documents'] != null) {
      transactionDocuments = <TransactionDocuments>[];
      json['transaction_documents'].forEach((v) {
        transactionDocuments!.add(new TransactionDocuments.fromJson(v));
      });
    }
    agent = json['agent'] != null ? new Agent.fromJson(json['agent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contract_type'] = this.contractType;
    data['agent_name'] = this.agentName;
    data['agent_id'] = this.agentId;
    data['buyer0_personId'] = this.buyer0PersonId;
    data['buyer0_type'] = this.buyer0Type;
    data['buyer0_first_name'] = this.buyer0FirstName;
    data['buyer0_middle_initials'] = this.buyer0MiddleInitials;
    data['buyer0_last_name'] = this.buyer0LastName;
    data['buyer0_phone'] = this.buyer0Phone;
    data['buyer0_email'] = this.buyer0Email;
    data['buyer0_entity_name'] = this.buyer0EntityName;
    data['buyer1_personId'] = this.buyer1PersonId;
    data['buyer1_type'] = this.buyer1Type;
    data['buyer1_first_name'] = this.buyer1FirstName;
    data['buyer1_middle_initials'] = this.buyer1MiddleInitials;
    data['buyer1_last_name'] = this.buyer1LastName;
    data['buyer1_phone'] = this.buyer1Phone;
    data['buyer1_email'] = this.buyer1Email;
    data['buyer1_entity_name'] = this.buyer1EntityName;
    data['seller0_personId'] = this.seller0PersonId;
    data['seller0_type'] = this.seller0Type;
    data['seller0_first_name'] = this.seller0FirstName;
    data['seller0_middle_initials'] = this.seller0MiddleInitials;
    data['seller0_last_name'] = this.seller0LastName;
    data['seller0_phone'] = this.seller0Phone;
    data['seller0_email'] = this.seller0Email;
    data['seller0_entity_name'] = this.seller0EntityName;
    data['seller1_personId'] = this.seller1PersonId;
    data['seller1_type'] = this.seller1Type;
    data['seller1_first_name'] = this.seller1FirstName;
    data['seller1_middle_initials'] = this.seller1MiddleInitials;
    data['seller1_last_name'] = this.seller1LastName;
    data['seller1_phone'] = this.seller1Phone;
    data['seller1_email'] = this.seller1Email;
    data['seller1_entity_name'] = this.seller1EntityName;
    data['property_type'] = this.propertyType;
    data['property_address'] = this.propertyAddress;
    data['unit_number'] = this.unitNumber;
    data['lot_number'] = this.lotNumber;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['price'] = this.price;
    data['binding_date'] = this.bindingDate;
    data['closing_date'] = this.closingDate;
    data['due_dilligence_days'] = this.dueDilligenceDays;
    data['due_dilligence_date'] = this.dueDilligenceDate;
    data['financing_type'] = this.financingType;
    data['finance_contingency_days'] = this.financeContingencyDays;
    data['finance_contingency_date'] = this.financeContingencyDate;
    data['appraisal_contingency_days'] = this.appraisalContingencyDays;
    data['appraisal_contingency_date'] = this.appraisalContingencyDate;
    data['earnest_money_amount'] = this.earnestMoneyAmount;
    data['earnest_money_holder'] = this.earnestMoneyHolder;
    data['earnest_money_due_date'] = this.earnestMoneyDueDate;
    data['closing_attorney_id'] = this.closingAttorneyId;
    data['closing_attorney_first_name'] = this.closingAttorneyFirstName;
    data['closing_attorney_last_name'] = this.closingAttorneyLastName;
    data['closing_attorney_phone'] = this.closingAttorneyPhone;
    data['closing_attorney_company'] = this.closingAttorneyCompany;
    data['closing_attorney_email'] = this.closingAttorneyEmail;
    data['lender_company_name'] = this.lenderCompanyName;
    data['loan_officer_id'] = this.loanOfficerId;
    data['lender_company_phone'] = this.lenderCompanyPhone;
    data['loan_officer_email'] = this.loanOfficerEmail;
    data['loan_officer_first_name'] = this.loanOfficerFirstName;
    data['loan_officer_last_name'] = this.loanOfficerLastName;
    data['loan_officer_phone'] = this.loanOfficerPhone;
    data['opposite_party_name'] = this.oppositePartyName;
    data['co_op_agent_id'] = this.coOpAgentId;
    data['co_op_first_name'] = this.coOpFirstName;
    data['co_op_last_name'] = this.coOpLastName;
    data['co_op_email'] = this.coOpEmail;
    data['co_op_phone'] = this.coOpPhone;
    data['co_op_agent_company'] = this.coOpAgentCompany;
    data['status'] = this.status;
    data['attached_listing'] = this.attachedListing;
    data['fub_id'] = this.fubId;
    data['we_represent'] = this.weRepresent;
    data['bedrooms'] = this.bedrooms;
    data['baths'] = this.baths;
    data['sq_feet'] = this.sqFeet;
    data['fmls_number'] = this.fmlsNumber;
    data['gamls_number'] = this.gamlsNumber;
    data['gci'] = this.gci;
    data['agent_split'] = this.agentSplit;
    data['assigned_agent_split'] = this.assignedAgentSplit;
    data['company_dollar'] = this.companyDollar;
    data['qb_sub_customer_id'] = this.qbSubCustomerId;
    data['closed_unprocessed_status_date'] = this.closedUnprocessedStatusDate;
    data['closed_processed_status_date'] = this.closedProcessedStatusDate;
    data['property_img'] = this.propertyImg;
    data['submitted_by'] = this.submittedBy;
    data['qb_invoice_id'] = this.qbInvoiceId;
    data['home_warranty_company'] = this.homeWarrantyCompany;
    data['home_warranty_amount'] = this.homeWarrantyAmount;
    data['power_company'] = this.powerCompany;
    data['power_company_phone'] = this.powerCompanyPhone;
    data['water_company'] = this.waterCompany;
    data['water_company_phone'] = this.waterCompanyPhone;
    data['sanitation_company'] = this.sanitationCompany;
    data['sanitation_company_phone'] = this.sanitationCompanyPhone;
    data['binding_agreement_date'] = this.bindingAgreementDate;
    data['net_commission'] = this.netCommission;
    data['commission_plain_id'] = this.commissionPlainId;
    data['closing_notes'] = this.closingNotes;
    data['closed_by'] = this.closedBy;
    data['closed_by_id'] = this.closedById;
    data['deductable_amount'] = this.deductableAmount;
    data['private_remark'] = this.privateRemark;
    data['referral_parent_contract_id'] = this.referralParentContractId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.transactionDocuments != null) {
      data['transaction_documents'] =
          this.transactionDocuments!.map((v) => v.toJson()).toList();
    }
    if (this.agent != null) {
      data['agent'] = this.agent!.toJson();
    }
    return data;
  }
}

class TransactionDocuments {
  List<String>? oldFileSrcs;
  int? id;
  int? documentId;
  dynamic listingId;
  int? contractId;
  String? fileSrc;
  String? status;
  String? comment;
  bool? exempt;
  bool? deletedAndNotResolved;
  String? approvedBy;
  int? approvedById;
  int? exemptById;
  String? approvalTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Document? document;

  TransactionDocuments(
      {this.oldFileSrcs,
      this.id,
      this.documentId,
      this.listingId,
      this.contractId,
      this.fileSrc,
      this.status,
      this.comment,
      this.exempt,
      this.deletedAndNotResolved,
      this.approvedBy,
      this.approvedById,
      this.exemptById,
      this.approvalTime,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.document});

  TransactionDocuments.fromJson(Map<String, dynamic> json) {
    oldFileSrcs = json['old_file_srcs'].cast<String>();
    id = json['id'];
    documentId = json['document_id'];
    listingId = json['listing_id'];
    contractId = json['contract_id'];
    fileSrc = json['file_src'];
    status = json['status'];
    comment = json['comment'];
    exempt = json['exempt'];
    deletedAndNotResolved = json['deleted_and_not_resolved'];
    approvedBy = json['approved_by'];
    approvedById = json['approved_by_id'];
    exemptById = json['exempt_by_id'];
    approvalTime = json['approval_time'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    document = json['document'] != null
        ? new Document.fromJson(json['document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_file_srcs'] = this.oldFileSrcs;
    data['id'] = this.id;
    data['document_id'] = this.documentId;
    data['listing_id'] = this.listingId;
    data['contract_id'] = this.contractId;
    data['file_src'] = this.fileSrc;
    data['status'] = this.status;
    data['comment'] = this.comment;
    data['exempt'] = this.exempt;
    data['deleted_and_not_resolved'] = this.deletedAndNotResolved;
    data['approved_by'] = this.approvedBy;
    data['approved_by_id'] = this.approvedById;
    data['exempt_by_id'] = this.exemptById;
    data['approval_time'] = this.approvalTime;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.document != null) {
      data['document'] = this.document!.toJson();
    }
    return data;
  }
}

class Document {
  int? id;
  String? name;
  String? type;
  bool? temporary;
  bool? canExempted;
  bool? isRental;

  Document(
      {this.id,
      this.name,
      this.type,
      this.temporary,
      this.canExempted,
      this.isRental});

  Document.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    temporary = json['temporary'];
    canExempted = json['can_exempted'];
    isRental = json['is_rental'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['temporary'] = this.temporary;
    data['can_exempted'] = this.canExempted;
    data['is_rental'] = this.isRental;
    return data;
  }
}

class Agent {
  String? fullName;
  String? firstName;
  String? lastName;
  ProfileImages? profileImages;

  Agent({this.fullName, this.firstName, this.lastName, this.profileImages});

  Agent.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImages = json['profile_images'] != null
        ? new ProfileImages.fromJson(json['profile_images'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    if (this.profileImages != null) {
      data['profile_images'] = this.profileImages!.toJson();
    }
    return data;
  }
}

class ProfileImages {
  String? profileImgThumbnail;

  ProfileImages({this.profileImgThumbnail});

  ProfileImages.fromJson(Map<String, dynamic> json) {
    profileImgThumbnail = json['profile_img_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profile_img_thumbnail'] = this.profileImgThumbnail;
    return data;
  }
}
