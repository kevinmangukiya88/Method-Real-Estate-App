class GetPaymentRecordResponseModel {
  int? status;
  Data? data;

  GetPaymentRecordResponseModel({this.status, this.data});

  GetPaymentRecordResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Records>? records;
  int? count;

  Data({this.records, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Records {
  int? id;
  String? type;
  int? agentId;
  int? vendorId;
  int? contractId;
  dynamic listingId;
  String? payeeName;
  String? amount;
  String? propertyAddress;
  String? status;
  String? transactionId;
  String? paymentId;
  dynamic qbPurchaseId;
  String? submittedBy;
  String? paymentType;
  bool? isApproved;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  TransactionContract? transactionContract;
  AllAgent? allAgent;

  Records(
      {this.id,
      this.type,
      this.agentId,
      this.vendorId,
      this.contractId,
      this.listingId,
      this.payeeName,
      this.amount,
      this.propertyAddress,
      this.status,
      this.transactionId,
      this.paymentId,
      this.qbPurchaseId,
      this.submittedBy,
      this.paymentType,
      this.isApproved,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.transactionContract,
      this.allAgent});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    agentId = json['agent_id'];
    vendorId = json['vendor_id'];
    contractId = json['contract_id'];
    listingId = json['listing_id'];
    payeeName = json['payee_name'];
    amount = json['amount'];
    propertyAddress = json['property_address'];
    status = json['status'];
    transactionId = json['transaction_id'];
    paymentId = json['payment_id'];
    qbPurchaseId = json['qb_purchase_id'];
    submittedBy = json['submitted_by'];
    paymentType = json['payment_type'];
    isApproved = json['is_approved'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    transactionContract = json['transaction_contract'] != null
        ? new TransactionContract.fromJson(json['transaction_contract'])
        : null;
    allAgent = json['all_agent'] != null
        ? new AllAgent.fromJson(json['all_agent'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['agent_id'] = this.agentId;
    data['vendor_id'] = this.vendorId;
    data['contract_id'] = this.contractId;
    data['listing_id'] = this.listingId;
    data['payee_name'] = this.payeeName;
    data['amount'] = this.amount;
    data['property_address'] = this.propertyAddress;
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    data['payment_id'] = this.paymentId;
    data['qb_purchase_id'] = this.qbPurchaseId;
    data['submitted_by'] = this.submittedBy;
    data['payment_type'] = this.paymentType;
    data['is_approved'] = this.isApproved;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    if (this.transactionContract != null) {
      data['transaction_contract'] = this.transactionContract!.toJson();
    }
    if (this.allAgent != null) {
      data['all_agent'] = this.allAgent!.toJson();
    }
    return data;
  }
}

class TransactionContract {
  CommissionDeductions? commissionDeductions;
  String? street;
  String? city;
  String? state;
  String? zipcode;
  String? gci;

  TransactionContract(
      {this.commissionDeductions,
      this.street,
      this.city,
      this.state,
      this.zipcode,
      this.gci});

  TransactionContract.fromJson(Map<String, dynamic> json) {
    commissionDeductions = json['commission_deductions'] != null
        ? new CommissionDeductions.fromJson(json['commission_deductions'])
        : null;
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipcode = json['zipcode'];
    gci = json['gci'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.commissionDeductions != null) {
      data['commission_deductions'] = this.commissionDeductions!.toJson();
    }
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zipcode'] = this.zipcode;
    data['gci'] = this.gci;
    return data;
  }
}

class CommissionDeductions {
  dynamic agentSplit;
  dynamic companyDollar;
  String? agentPercentage;
  dynamic netCommission;
  dynamic totalCompanyDollar;
  Deductions? deductions;

  CommissionDeductions(
      {this.agentSplit,
      this.companyDollar,
      this.agentPercentage,
      this.netCommission,
      this.totalCompanyDollar,
      this.deductions});

  CommissionDeductions.fromJson(Map<String, dynamic> json) {
    agentSplit = json['agent_split'];
    companyDollar = json['company_dollar'];
    agentPercentage = json['agent_percentage'];
    netCommission = json['net_commission'];
    totalCompanyDollar = json['total_company_dollar'];
    deductions = json['deductions'] != null
        ? new Deductions.fromJson(json['deductions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['agent_split'] = this.agentSplit;
    data['company_dollar'] = this.companyDollar;
    data['agent_percentage'] = this.agentPercentage;
    data['net_commission'] = this.netCommission;
    data['total_company_dollar'] = this.totalCompanyDollar;
    if (this.deductions != null) {
      data['deductions'] = this.deductions!.toJson();
    }
    return data;
  }
}

class Deductions {
  List<Gci>? gci;
  List<AgentSplit>? agentSplit;
  List<dynamic>? companyDollar;

  Deductions({this.gci, this.agentSplit, this.companyDollar});

  Deductions.fromJson(Map<String, dynamic> json) {
    if (json['gci'] != null) {
      gci = <Gci>[];
      json['gci'].forEach((v) {
        gci!.add(new Gci.fromJson(v));
      });
    }
    if (json['agent_split'] != null) {
      agentSplit = <AgentSplit>[];
      json['agent_split'].forEach((v) {
        agentSplit!.add(new AgentSplit.fromJson(v));
      });
    }
    if (json['company_dollar'] != null) {
      // companyDollar = <CompanyDollar>[];
      json['company_dollar'].forEach((v) {
        companyDollar?.add(json['company_dollar']);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.gci != null) {
      data['gci'] = this.gci!.map((v) => v.toJson()).toList();
    }
    if (this.agentSplit != null) {
      data['agent_split'] = this.agentSplit!.map((v) => v.toJson()).toList();
    }
    if (this.companyDollar != null) {
      data['company_dollar'] =
          this.companyDollar!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Gci {
  dynamic amount;
  dynamic id;
  String? name;
  String? acctName;
  String? acctCode;
  String? percentage;
  String? via;

  Gci(
      {this.amount,
      this.id,
      this.name,
      this.acctName,
      this.acctCode,
      this.percentage,
      this.via});

  Gci.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    id = json['id'];
    name = json['name'];
    acctName = json['acctName'];
    acctCode = json['acctCode'];
    percentage = json['percentage'];
    via = json['via'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['acctName'] = this.acctName;
    data['acctCode'] = this.acctCode;
    data['percentage'] = this.percentage;
    data['via'] = this.via;
    return data;
  }
}

class AgentSplit {
  dynamic amount;
  int? id;
  String? name;
  String? acctName;
  String? acctCode;
  String? percentage;
  String? via;

  AgentSplit(
      {this.amount,
      this.id,
      this.name,
      this.acctName,
      this.acctCode,
      this.percentage,
      this.via});

  AgentSplit.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    id = json['id'];
    name = json['name'];
    acctName = json['acctName'];
    acctCode = json['acctCode'];
    percentage = json['percentage'];
    via = json['via'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['acctName'] = this.acctName;
    data['acctCode'] = this.acctCode;
    data['percentage'] = this.percentage;
    data['via'] = this.via;
    return data;
  }
}

class AllAgent {
  BankDetail? bankDetail;

  AllAgent({this.bankDetail});

  AllAgent.fromJson(Map<String, dynamic> json) {
    bankDetail = json['bank_detail'] != null
        ? new BankDetail.fromJson(json['bank_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bankDetail != null) {
      data['bank_detail'] = this.bankDetail!.toJson();
    }
    return data;
  }
}

class BankDetail {
  String? accountNumber;
  String? routingNumber;

  BankDetail({this.accountNumber, this.routingNumber});

  BankDetail.fromJson(Map<String, dynamic> json) {
    accountNumber = json['account_number'];
    routingNumber = json['routing_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account_number'] = this.accountNumber;
    data['routing_number'] = this.routingNumber;
    return data;
  }
}
