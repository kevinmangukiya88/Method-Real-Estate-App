// To parse this JSON data, do
//
//     final getSinglePropertyResponseModel = getSinglePropertyResponseModelFromJson(jsonString);

import 'dart:convert';

GetSinglePropertyResponseModel getSinglePropertyResponseModelFromJson(
        String str) =>
    GetSinglePropertyResponseModel.fromJson(json.decode(str));

String getSinglePropertyResponseModelToJson(
        GetSinglePropertyResponseModel data) =>
    json.encode(data.toJson());

class GetSinglePropertyResponseModel {
  ResponseHeader? responseHeader;
  Response? response;

  GetSinglePropertyResponseModel({
    this.responseHeader,
    this.response,
  });

  factory GetSinglePropertyResponseModel.fromJson(Map<String, dynamic> json) =>
      GetSinglePropertyResponseModel(
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
  List<String>? accessibilityFeatures;
  List<String>? appliances;
  List<String>? architecturalStyle;
  int? associationFee;
  int? associationFee2;
  String? associationFee2Frequency;
  String? associationFeeFrequency;
  List<String>? associationFeeIncludes;
  bool? associationYn;
  DateTime? availabilityDate;
  List<String>? basement;
  int? bathroomsFull;
  int? bathroomsHalf;
  int? bathroomsTotalDecimal;
  int? bedroomsTotal;
  DateTime? bridgeModificationTimestamp;
  String? buildingAreaSource;
  int? buildingAreaTotal;
  String? buyerAgencyCompensation;
  String? buyerAgentDirectPhone;
  String? buyerAgentFullName;
  String? buyerAgentKeyNumeric;
  String? buyerAgentMlsId;
  List<String>? buyerFinancing;
  String? buyerOfficeKeyNumeric;
  String? buyerOfficeMlsId;
  String? buyerOfficeName;
  String? buyerOfficePhone;
  String? city;
  DateTime? closeDate;
  String? closePrice;
  List<String>? commonWalls;
  List<String>? communityFeatures;
  String? concessionsAmount;
  List<String>? constructionMaterials;
  List<String>? cooling;
  List<int>? coordinates;
  String? country;
  String? countyOrParish;
  int? cumulativeDaysOnMarket;
  int? daysOnMarket;
  String? directions;
  bool? dualVariableCompensationYn;
  String? elementarySchool;
  DateTime? expirationDate;
  List<String>? exteriorFeatures;
  int? fmlsActiveOpenHouseCount;
  bool? fmlsAssessmentDueContemplatedYn;
  bool? fmlsAssumableYn;
  String? fmlsAvailabilitytoReceiveOffers;
  String? fmlsBuyerFirmMlsId;
  bool? fmlsBuyerOfficePresentOffersYn;
  String? fmlsCertProfHomeBldrs;
  int? fmlsCurrentPrice;
  String? fmlsDeedBook;
  String? fmlsDeedPage;
  String? fmlsDistrict;
  List<String>? fmlsDock;
  String? fmlsHersIndexRating;
  String? fmlsInitiationFee;
  String? fmlsLandLot;
  String? fmlsListFirmMlsId;
  String? fmlsManagementCompany;
  String? fmlsManagementPhone;
  bool? fmlsMatrixTesting;
  int? fmlsOpenHouseCount;
  bool? fmlsOwnerFinancingYn;
  bool? fmlsOwnerSecondYn;
  String? fmlsPlatBook;
  String? fmlsPlatPage;
  String? fmlsPreviousStatus;
  DateTime? fmlsProposedClosedDate;
  String? fmlsRatioClosePriceByListPrice;
  String? fmlsRatioClosePriceByOriginalListPrice;
  String? fmlsSectionGmd;
  List<String>? fmlsSpecialCircumstances;
  String? fmlsSwimTennisFee;
  String? fmlsUnitCount;
  String? fmlsVirtualTourUrlUnbranded2;
  String? fmlsWaterfrontageLength;
  List<String>? fencing;
  List<String>? fireplaceFeatures;
  int? fireplacesTotal;
  List<String>? flooring;
  int? garageSpaces;
  List<String>? greenEnergyEfficient;
  bool? habitableResidenceYn;
  List<String>? heating;
  String? highSchool;
  bool? homeWarrantyYn;
  List<String>? interiorFeatures;
  bool? internetAddressDisplayYn;
  bool? internetAutomatedValuationDisplayYn;
  bool? internetConsumerCommentYn;
  bool? internetEntireListingDisplayYn;
  List<String>? laundryFeatures;
  List<String>? levels;
  String? listAgentDirectPhone;
  String? listAgentFullName;
  String? listAgentKey;
  int? listAgentKeyNumeric;
  String? listAgentMlsId;
  String? listOfficeKey;
  int? listOfficeKeyNumeric;
  String? listOfficeMlsId;
  String? listOfficeName;
  String? listOfficePhone;
  String? listOfficeUrl;
  int? listPrice;
  DateTime? listingContractDate;
  String? listingId;
  Key? listingKey;
  int? listingKeyNumeric;
  List<String>? lockBoxType;
  List<String>? lotFeatures;
  String? lotSizeDimensions;
  int? mainLevelBathrooms;
  int? mainLevelBedrooms;
  String? middleOrJuniorSchool;
  String? mlsStatus;
  DateTime? modificationTimestamp;
  String? numberOfUnitsInCommunity;
  DateTime? offMarketDate;
  bool? openParkingYn;
  int? originalListPrice;
  String? originatingSystemId;
  String? originatingSystemKey;
  String? originatingSystemName;
  List<String>? otherEquipment;
  List<String>? otherStructures;
  String? ownership;
  String? parcelNumber;
  List<String>? parkingFeatures;
  List<String>? patioAndPorchFeatures;
  DateTime? photosChangeTimestamp;
  int? photosCount;
  List<String>? poolFeatures;
  bool? poolPrivateYn;
  String? postalCode;
  int? previousListPrice;
  String? privateRemarks;
  bool? propertyAttachedYn;
  List<String>? propertyCondition;
  String? propertySubType;
  PropertyType? propertyType;
  String? publicRemarks;
  DateTime? purchaseContractDate;
  List<String>? roomBedroomFeatures;
  List<String>? roomDiningRoomFeatures;
  List<String>? roomKitchenFeatures;
  List<String>? roomMasterBathroomFeatures;
  List<String>? roomType;
  List<String>? securityFeatures;
  List<String>? showingRequirements;
  String? sourceSystemId;
  String? sourceSystemKey;
  String? sourceSystemName;
  List<String>? specialListingConditions;
  String? standardStatus;
  String? stateOrProvince;
  String? streetName;
  String? streetNumber;
  int? streetNumberNumeric;
  String? streetSuffix;
  String? subdivisionName;
  int? taxAnnualAmount;
  String? taxBlock;
  String? taxLot;
  String? taxParcelLetter;
  int? taxYear;
  String? unitNumber;
  String? unparsedAddress;
  List<String>? utilities;
  List<String>? view;
  String? waterBodyName;
  int? yearBuilt;
  List<String>? feedTypes;
  List<String>? mediaOrder;
  List<String>? mediaKey;
  List<String>? mediaUrl;
  List<Key>? mediaResourceRecordKey;
  List<MediaResourceName>? mediaResourceName;
  List<PropertyType>? mediaClassName;
  List<MediaCategory>? mediaCategory;
  List<MediaMimeType>? mediaMimeType;
  List<String>? mediaObjectId;
  List<String>? mediaShortDescription;
  List<String>? media;
  double? version;

  Doc({
    this.accessibilityFeatures,
    this.appliances,
    this.architecturalStyle,
    this.associationFee,
    this.associationFee2,
    this.associationFee2Frequency,
    this.associationFeeFrequency,
    this.associationFeeIncludes,
    this.associationYn,
    this.availabilityDate,
    this.basement,
    this.bathroomsFull,
    this.bathroomsHalf,
    this.bathroomsTotalDecimal,
    this.bedroomsTotal,
    this.bridgeModificationTimestamp,
    this.buildingAreaSource,
    this.buildingAreaTotal,
    this.buyerAgencyCompensation,
    this.buyerAgentDirectPhone,
    this.buyerAgentFullName,
    this.buyerAgentKeyNumeric,
    this.buyerAgentMlsId,
    this.buyerFinancing,
    this.buyerOfficeKeyNumeric,
    this.buyerOfficeMlsId,
    this.buyerOfficeName,
    this.buyerOfficePhone,
    this.city,
    this.closeDate,
    this.closePrice,
    this.commonWalls,
    this.communityFeatures,
    this.concessionsAmount,
    this.constructionMaterials,
    this.cooling,
    this.coordinates,
    this.country,
    this.countyOrParish,
    this.cumulativeDaysOnMarket,
    this.daysOnMarket,
    this.directions,
    this.dualVariableCompensationYn,
    this.elementarySchool,
    this.expirationDate,
    this.exteriorFeatures,
    this.fmlsActiveOpenHouseCount,
    this.fmlsAssessmentDueContemplatedYn,
    this.fmlsAssumableYn,
    this.fmlsAvailabilitytoReceiveOffers,
    this.fmlsBuyerFirmMlsId,
    this.fmlsBuyerOfficePresentOffersYn,
    this.fmlsCertProfHomeBldrs,
    this.fmlsCurrentPrice,
    this.fmlsDeedBook,
    this.fmlsDeedPage,
    this.fmlsDistrict,
    this.fmlsDock,
    this.fmlsHersIndexRating,
    this.fmlsInitiationFee,
    this.fmlsLandLot,
    this.fmlsListFirmMlsId,
    this.fmlsManagementCompany,
    this.fmlsManagementPhone,
    this.fmlsMatrixTesting,
    this.fmlsOpenHouseCount,
    this.fmlsOwnerFinancingYn,
    this.fmlsOwnerSecondYn,
    this.fmlsPlatBook,
    this.fmlsPlatPage,
    this.fmlsPreviousStatus,
    this.fmlsProposedClosedDate,
    this.fmlsRatioClosePriceByListPrice,
    this.fmlsRatioClosePriceByOriginalListPrice,
    this.fmlsSectionGmd,
    this.fmlsSpecialCircumstances,
    this.fmlsSwimTennisFee,
    this.fmlsUnitCount,
    this.fmlsVirtualTourUrlUnbranded2,
    this.fmlsWaterfrontageLength,
    this.fencing,
    this.fireplaceFeatures,
    this.fireplacesTotal,
    this.flooring,
    this.garageSpaces,
    this.greenEnergyEfficient,
    this.habitableResidenceYn,
    this.heating,
    this.highSchool,
    this.homeWarrantyYn,
    this.interiorFeatures,
    this.internetAddressDisplayYn,
    this.internetAutomatedValuationDisplayYn,
    this.internetConsumerCommentYn,
    this.internetEntireListingDisplayYn,
    this.laundryFeatures,
    this.levels,
    this.listAgentDirectPhone,
    this.listAgentFullName,
    this.listAgentKey,
    this.listAgentKeyNumeric,
    this.listAgentMlsId,
    this.listOfficeKey,
    this.listOfficeKeyNumeric,
    this.listOfficeMlsId,
    this.listOfficeName,
    this.listOfficePhone,
    this.listOfficeUrl,
    this.listPrice,
    this.listingContractDate,
    this.listingId,
    this.listingKey,
    this.listingKeyNumeric,
    this.lockBoxType,
    this.lotFeatures,
    this.lotSizeDimensions,
    this.mainLevelBathrooms,
    this.mainLevelBedrooms,
    this.middleOrJuniorSchool,
    this.mlsStatus,
    this.modificationTimestamp,
    this.numberOfUnitsInCommunity,
    this.offMarketDate,
    this.openParkingYn,
    this.originalListPrice,
    this.originatingSystemId,
    this.originatingSystemKey,
    this.originatingSystemName,
    this.otherEquipment,
    this.otherStructures,
    this.ownership,
    this.parcelNumber,
    this.parkingFeatures,
    this.patioAndPorchFeatures,
    this.photosChangeTimestamp,
    this.photosCount,
    this.poolFeatures,
    this.poolPrivateYn,
    this.postalCode,
    this.previousListPrice,
    this.privateRemarks,
    this.propertyAttachedYn,
    this.propertyCondition,
    this.propertySubType,
    this.propertyType,
    this.publicRemarks,
    this.purchaseContractDate,
    this.roomBedroomFeatures,
    this.roomDiningRoomFeatures,
    this.roomKitchenFeatures,
    this.roomMasterBathroomFeatures,
    this.roomType,
    this.securityFeatures,
    this.showingRequirements,
    this.sourceSystemId,
    this.sourceSystemKey,
    this.sourceSystemName,
    this.specialListingConditions,
    this.standardStatus,
    this.stateOrProvince,
    this.streetName,
    this.streetNumber,
    this.streetNumberNumeric,
    this.streetSuffix,
    this.subdivisionName,
    this.taxAnnualAmount,
    this.taxBlock,
    this.taxLot,
    this.taxParcelLetter,
    this.taxYear,
    this.unitNumber,
    this.unparsedAddress,
    this.utilities,
    this.view,
    this.waterBodyName,
    this.yearBuilt,
    this.feedTypes,
    this.mediaOrder,
    this.mediaKey,
    this.mediaUrl,
    this.mediaResourceRecordKey,
    this.mediaResourceName,
    this.mediaClassName,
    this.mediaCategory,
    this.mediaMimeType,
    this.mediaObjectId,
    this.mediaShortDescription,
    this.media,
    this.version,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        accessibilityFeatures: json["AccessibilityFeatures"] == null
            ? []
            : List<String>.from(json["AccessibilityFeatures"]!.map((x) => x)),
        appliances: json["Appliances"] == null
            ? []
            : List<String>.from(json["Appliances"]!.map((x) => x)),
        architecturalStyle: json["ArchitecturalStyle"] == null
            ? []
            : List<String>.from(json["ArchitecturalStyle"]!.map((x) => x)),
        associationFee: json["AssociationFee"],
        associationFee2: json["AssociationFee2"],
        associationFee2Frequency: json["AssociationFee2Frequency"],
        associationFeeFrequency: json["AssociationFeeFrequency"],
        associationFeeIncludes: json["AssociationFeeIncludes"] == null
            ? []
            : List<String>.from(json["AssociationFeeIncludes"]!.map((x) => x)),
        associationYn: json["AssociationYN"],
        availabilityDate: json["AvailabilityDate"] == null
            ? null
            : DateTime.parse(json["AvailabilityDate"]),
        basement: json["Basement"] == null
            ? []
            : List<String>.from(json["Basement"]!.map((x) => x)),
        bathroomsFull: json["BathroomsFull"],
        bathroomsHalf: json["BathroomsHalf"],
        bathroomsTotalDecimal: json["BathroomsTotalDecimal"],
        bedroomsTotal: json["BedroomsTotal"],
        bridgeModificationTimestamp: json["BridgeModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["BridgeModificationTimestamp"]),
        buildingAreaSource: json["BuildingAreaSource"],
        buildingAreaTotal: json["BuildingAreaTotal"],
        buyerAgencyCompensation: json["BuyerAgencyCompensation"],
        buyerAgentDirectPhone: json["BuyerAgentDirectPhone"],
        buyerAgentFullName: json["BuyerAgentFullName"],
        buyerAgentKeyNumeric: json["BuyerAgentKeyNumeric"],
        buyerAgentMlsId: json["BuyerAgentMlsId"],
        buyerFinancing: json["BuyerFinancing"] == null
            ? []
            : List<String>.from(json["BuyerFinancing"]!.map((x) => x)),
        buyerOfficeKeyNumeric: json["BuyerOfficeKeyNumeric"],
        buyerOfficeMlsId: json["BuyerOfficeMlsId"],
        buyerOfficeName: json["BuyerOfficeName"],
        buyerOfficePhone: json["BuyerOfficePhone"],
        city: json["City"],
        closeDate: json["CloseDate"] == null
            ? null
            : DateTime.parse(json["CloseDate"]),
        closePrice: json["ClosePrice"],
        commonWalls: json["CommonWalls"] == null
            ? []
            : List<String>.from(json["CommonWalls"]!.map((x) => x)),
        communityFeatures: json["CommunityFeatures"] == null
            ? []
            : List<String>.from(json["CommunityFeatures"]!.map((x) => x)),
        concessionsAmount: json["ConcessionsAmount"],
        constructionMaterials: json["ConstructionMaterials"] == null
            ? []
            : List<String>.from(json["ConstructionMaterials"]!.map((x) => x)),
        cooling: json["Cooling"] == null
            ? []
            : List<String>.from(json["Cooling"]!.map((x) => x)),
        coordinates: json["Coordinates"] == null
            ? []
            : List<int>.from(json["Coordinates"]!.map((x) => x)),
        country: json["Country"],
        countyOrParish: json["CountyOrParish"],
        cumulativeDaysOnMarket: json["CumulativeDaysOnMarket"],
        daysOnMarket: json["DaysOnMarket"],
        directions: json["Directions"],
        dualVariableCompensationYn: json["DualVariableCompensationYN"],
        elementarySchool: json["ElementarySchool"],
        expirationDate: json["ExpirationDate"] == null
            ? null
            : DateTime.parse(json["ExpirationDate"]),
        exteriorFeatures: json["ExteriorFeatures"] == null
            ? []
            : List<String>.from(json["ExteriorFeatures"]!.map((x) => x)),
        fmlsActiveOpenHouseCount: json["FMLS_ActiveOpenHouseCount"],
        fmlsAssessmentDueContemplatedYn:
            json["FMLS_AssessmentDueContemplatedYN"],
        fmlsAssumableYn: json["FMLS_AssumableYN"],
        fmlsAvailabilitytoReceiveOffers:
            json["FMLS_AvailabilitytoReceiveOffers"],
        fmlsBuyerFirmMlsId: json["FMLS_BuyerFirmMlsId"],
        fmlsBuyerOfficePresentOffersYn: json["FMLS_BuyerOfficePresentOffersYN"],
        fmlsCertProfHomeBldrs: json["FMLS_CertProfHomeBldrs"],
        fmlsCurrentPrice: json["FMLS_CurrentPrice"],
        fmlsDeedBook: json["FMLS_DeedBook"],
        fmlsDeedPage: json["FMLS_DeedPage"],
        fmlsDistrict: json["FMLS_District"],
        fmlsDock: json["FMLS_Dock"] == null
            ? []
            : List<String>.from(json["FMLS_Dock"]!.map((x) => x)),
        fmlsHersIndexRating: json["FMLS_HERSIndexRating"],
        fmlsInitiationFee: json["FMLS_InitiationFee"],
        fmlsLandLot: json["FMLS_LandLot"],
        fmlsListFirmMlsId: json["FMLS_ListFirmMlsId"],
        fmlsManagementCompany: json["FMLS_ManagementCompany"],
        fmlsManagementPhone: json["FMLS_ManagementPhone"],
        fmlsMatrixTesting: json["FMLS_MatrixTesting"],
        fmlsOpenHouseCount: json["FMLS_OpenHouseCount"],
        fmlsOwnerFinancingYn: json["FMLS_OwnerFinancingYN"],
        fmlsOwnerSecondYn: json["FMLS_OwnerSecondYN"],
        fmlsPlatBook: json["FMLS_PlatBook"],
        fmlsPlatPage: json["FMLS_PlatPage"],
        fmlsPreviousStatus: json["FMLS_PreviousStatus"],
        fmlsProposedClosedDate: json["FMLS_ProposedClosedDate"] == null
            ? null
            : DateTime.parse(json["FMLS_ProposedClosedDate"]),
        fmlsRatioClosePriceByListPrice:
            json["FMLS_RATIO_ClosePrice_By_ListPrice"],
        fmlsRatioClosePriceByOriginalListPrice:
            json["FMLS_RATIO_ClosePrice_By_OriginalListPrice"],
        fmlsSectionGmd: json["FMLS_SectionGMD"],
        fmlsSpecialCircumstances: json["FMLS_SpecialCircumstances"] == null
            ? []
            : List<String>.from(
                json["FMLS_SpecialCircumstances"]!.map((x) => x)),
        fmlsSwimTennisFee: json["FMLS_SwimTennisFee"],
        fmlsUnitCount: json["FMLS_UnitCount"],
        fmlsVirtualTourUrlUnbranded2: json["FMLS_VirtualTourURLUnbranded2"],
        fmlsWaterfrontageLength: json["FMLS_WaterfrontageLength"],
        fencing: json["Fencing"] == null
            ? []
            : List<String>.from(json["Fencing"]!.map((x) => x)),
        fireplaceFeatures: json["FireplaceFeatures"] == null
            ? []
            : List<String>.from(json["FireplaceFeatures"]!.map((x) => x)),
        fireplacesTotal: json["FireplacesTotal"],
        flooring: json["Flooring"] == null
            ? []
            : List<String>.from(json["Flooring"]!.map((x) => x)),
        garageSpaces: json["GarageSpaces"],
        greenEnergyEfficient: json["GreenEnergyEfficient"] == null
            ? []
            : List<String>.from(json["GreenEnergyEfficient"]!.map((x) => x)),
        habitableResidenceYn: json["HabitableResidenceYN"],
        heating: json["Heating"] == null
            ? []
            : List<String>.from(json["Heating"]!.map((x) => x)),
        highSchool: json["HighSchool"],
        homeWarrantyYn: json["HomeWarrantyYN"],
        interiorFeatures: json["InteriorFeatures"] == null
            ? []
            : List<String>.from(json["InteriorFeatures"]!.map((x) => x)),
        internetAddressDisplayYn: json["InternetAddressDisplayYN"],
        internetAutomatedValuationDisplayYn:
            json["InternetAutomatedValuationDisplayYN"],
        internetConsumerCommentYn: json["InternetConsumerCommentYN"],
        internetEntireListingDisplayYn: json["InternetEntireListingDisplayYN"],
        laundryFeatures: json["LaundryFeatures"] == null
            ? []
            : List<String>.from(json["LaundryFeatures"]!.map((x) => x)),
        levels: json["Levels"] == null
            ? []
            : List<String>.from(json["Levels"]!.map((x) => x)),
        listAgentDirectPhone: json["ListAgentDirectPhone"],
        listAgentFullName: json["ListAgentFullName"],
        listAgentKey: json["ListAgentKey"],
        listAgentKeyNumeric: json["ListAgentKeyNumeric"],
        listAgentMlsId: json["ListAgentMlsId"],
        listOfficeKey: json["ListOfficeKey"],
        listOfficeKeyNumeric: json["ListOfficeKeyNumeric"],
        listOfficeMlsId: json["ListOfficeMlsId"],
        listOfficeName: json["ListOfficeName"],
        listOfficePhone: json["ListOfficePhone"],
        listOfficeUrl: json["ListOfficeURL"],
        listPrice: json["ListPrice"],
        listingContractDate: json["ListingContractDate"] == null
            ? null
            : DateTime.parse(json["ListingContractDate"]),
        listingId: json["ListingId"],
        listingKey: keyValues.map[json["ListingKey"]]!,
        listingKeyNumeric: json["ListingKeyNumeric"],
        lockBoxType: json["LockBoxType"] == null
            ? []
            : List<String>.from(json["LockBoxType"]!.map((x) => x)),
        lotFeatures: json["LotFeatures"] == null
            ? []
            : List<String>.from(json["LotFeatures"]!.map((x) => x)),
        lotSizeDimensions: json["LotSizeDimensions"],
        mainLevelBathrooms: json["MainLevelBathrooms"],
        mainLevelBedrooms: json["MainLevelBedrooms"],
        middleOrJuniorSchool: json["MiddleOrJuniorSchool"],
        mlsStatus: json["MlsStatus"],
        modificationTimestamp: json["ModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["ModificationTimestamp"]),
        numberOfUnitsInCommunity: json["NumberOfUnitsInCommunity"],
        offMarketDate: json["OffMarketDate"] == null
            ? null
            : DateTime.parse(json["OffMarketDate"]),
        openParkingYn: json["OpenParkingYN"],
        originalListPrice: json["OriginalListPrice"],
        originatingSystemId: json["OriginatingSystemID"],
        originatingSystemKey: json["OriginatingSystemKey"],
        originatingSystemName: json["OriginatingSystemName"],
        otherEquipment: json["OtherEquipment"] == null
            ? []
            : List<String>.from(json["OtherEquipment"]!.map((x) => x)),
        otherStructures: json["OtherStructures"] == null
            ? []
            : List<String>.from(json["OtherStructures"]!.map((x) => x)),
        ownership: json["Ownership"],
        parcelNumber: json["ParcelNumber"],
        parkingFeatures: json["ParkingFeatures"] == null
            ? []
            : List<String>.from(json["ParkingFeatures"]!.map((x) => x)),
        patioAndPorchFeatures: json["PatioAndPorchFeatures"] == null
            ? []
            : List<String>.from(json["PatioAndPorchFeatures"]!.map((x) => x)),
        photosChangeTimestamp: json["PhotosChangeTimestamp"] == null
            ? null
            : DateTime.parse(json["PhotosChangeTimestamp"]),
        photosCount: json["PhotosCount"],
        poolFeatures: json["PoolFeatures"] == null
            ? []
            : List<String>.from(json["PoolFeatures"]!.map((x) => x)),
        poolPrivateYn: json["PoolPrivateYN"],
        postalCode: json["PostalCode"],
        previousListPrice: json["PreviousListPrice"],
        privateRemarks: json["PrivateRemarks"],
        propertyAttachedYn: json["PropertyAttachedYN"],
        propertyCondition: json["PropertyCondition"] == null
            ? []
            : List<String>.from(json["PropertyCondition"]!.map((x) => x)),
        propertySubType: json["PropertySubType"],
        propertyType: propertyTypeValues.map[json["PropertyType"]]!,
        publicRemarks: json["PublicRemarks"],
        purchaseContractDate: json["PurchaseContractDate"] == null
            ? null
            : DateTime.parse(json["PurchaseContractDate"]),
        roomBedroomFeatures: json["RoomBedroomFeatures"] == null
            ? []
            : List<String>.from(json["RoomBedroomFeatures"]!.map((x) => x)),
        roomDiningRoomFeatures: json["RoomDiningRoomFeatures"] == null
            ? []
            : List<String>.from(json["RoomDiningRoomFeatures"]!.map((x) => x)),
        roomKitchenFeatures: json["RoomKitchenFeatures"] == null
            ? []
            : List<String>.from(json["RoomKitchenFeatures"]!.map((x) => x)),
        roomMasterBathroomFeatures: json["RoomMasterBathroomFeatures"] == null
            ? []
            : List<String>.from(
                json["RoomMasterBathroomFeatures"]!.map((x) => x)),
        roomType: json["RoomType"] == null
            ? []
            : List<String>.from(json["RoomType"]!.map((x) => x)),
        securityFeatures: json["SecurityFeatures"] == null
            ? []
            : List<String>.from(json["SecurityFeatures"]!.map((x) => x)),
        showingRequirements: json["ShowingRequirements"] == null
            ? []
            : List<String>.from(json["ShowingRequirements"]!.map((x) => x)),
        sourceSystemId: json["SourceSystemID"],
        sourceSystemKey: json["SourceSystemKey"],
        sourceSystemName: json["SourceSystemName"],
        specialListingConditions: json["SpecialListingConditions"] == null
            ? []
            : List<String>.from(
                json["SpecialListingConditions"]!.map((x) => x)),
        standardStatus: json["StandardStatus"],
        stateOrProvince: json["StateOrProvince"],
        streetName: json["StreetName"],
        streetNumber: json["StreetNumber"],
        streetNumberNumeric: json["StreetNumberNumeric"],
        streetSuffix: json["StreetSuffix"],
        subdivisionName: json["SubdivisionName"],
        taxAnnualAmount: json["TaxAnnualAmount"],
        taxBlock: json["TaxBlock"],
        taxLot: json["TaxLot"],
        taxParcelLetter: json["TaxParcelLetter"],
        taxYear: json["TaxYear"],
        unitNumber: json["UnitNumber"],
        unparsedAddress: json["UnparsedAddress"],
        utilities: json["Utilities"] == null
            ? []
            : List<String>.from(json["Utilities"]!.map((x) => x)),
        view: json["View"] == null
            ? []
            : List<String>.from(json["View"]!.map((x) => x)),
        waterBodyName: json["WaterBodyName"],
        yearBuilt: json["YearBuilt"],
        feedTypes: json["FeedTypes"] == null
            ? []
            : List<String>.from(json["FeedTypes"]!.map((x) => x)),
        mediaOrder: json["MediaOrder"] == null
            ? []
            : List<String>.from(json["MediaOrder"]!.map((x) => x)),
        mediaKey: json["MediaKey"] == null
            ? []
            : List<String>.from(json["MediaKey"]!.map((x) => x)),
        mediaUrl: json["MediaURL"] == null
            ? []
            : List<String>.from(json["MediaURL"]!.map((x) => x)),
        mediaResourceRecordKey: json["MediaResourceRecordKey"] == null
            ? []
            : List<Key>.from(
                json["MediaResourceRecordKey"]!.map((x) => keyValues.map[x]!)),
        mediaResourceName: json["MediaResourceName"] == null
            ? []
            : List<MediaResourceName>.from(json["MediaResourceName"]!
                .map((x) => mediaResourceNameValues.map[x]!)),
        mediaClassName: json["MediaClassName"] == null
            ? []
            : List<PropertyType>.from(
                json["MediaClassName"]!.map((x) => propertyTypeValues.map[x]!)),
        mediaCategory: json["MediaCategory"] == null
            ? []
            : List<MediaCategory>.from(
                json["MediaCategory"]!.map((x) => mediaCategoryValues.map[x]!)),
        mediaMimeType: json["MediaMimeType"] == null
            ? []
            : List<MediaMimeType>.from(
                json["MediaMimeType"]!.map((x) => mediaMimeTypeValues.map[x]!)),
        mediaObjectId: json["MediaObjectID"] == null
            ? []
            : List<String>.from(json["MediaObjectID"]!.map((x) => x)),
        mediaShortDescription: json["MediaShortDescription"] == null
            ? []
            : List<String>.from(json["MediaShortDescription"]!.map((x) => x)),
        media: json["Media"] == null
            ? []
            : List<String>.from(json["Media"]!.map((x) => x)),
        version: json["_version_"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "AccessibilityFeatures": accessibilityFeatures == null
            ? []
            : List<dynamic>.from(accessibilityFeatures!.map((x) => x)),
        "Appliances": appliances == null
            ? []
            : List<dynamic>.from(appliances!.map((x) => x)),
        "ArchitecturalStyle": architecturalStyle == null
            ? []
            : List<dynamic>.from(architecturalStyle!.map((x) => x)),
        "AssociationFee": associationFee,
        "AssociationFee2": associationFee2,
        "AssociationFee2Frequency": associationFee2Frequency,
        "AssociationFeeFrequency": associationFeeFrequency,
        "AssociationFeeIncludes": associationFeeIncludes == null
            ? []
            : List<dynamic>.from(associationFeeIncludes!.map((x) => x)),
        "AssociationYN": associationYn,
        "AvailabilityDate":
            "${availabilityDate!.year.toString().padLeft(4, '0')}-${availabilityDate!.month.toString().padLeft(2, '0')}-${availabilityDate!.day.toString().padLeft(2, '0')}",
        "Basement":
            basement == null ? [] : List<dynamic>.from(basement!.map((x) => x)),
        "BathroomsFull": bathroomsFull,
        "BathroomsHalf": bathroomsHalf,
        "BathroomsTotalDecimal": bathroomsTotalDecimal,
        "BedroomsTotal": bedroomsTotal,
        "BridgeModificationTimestamp":
            bridgeModificationTimestamp?.toIso8601String(),
        "BuildingAreaSource": buildingAreaSource,
        "BuildingAreaTotal": buildingAreaTotal,
        "BuyerAgencyCompensation": buyerAgencyCompensation,
        "BuyerAgentDirectPhone": buyerAgentDirectPhone,
        "BuyerAgentFullName": buyerAgentFullName,
        "BuyerAgentKeyNumeric": buyerAgentKeyNumeric,
        "BuyerAgentMlsId": buyerAgentMlsId,
        "BuyerFinancing": buyerFinancing == null
            ? []
            : List<dynamic>.from(buyerFinancing!.map((x) => x)),
        "BuyerOfficeKeyNumeric": buyerOfficeKeyNumeric,
        "BuyerOfficeMlsId": buyerOfficeMlsId,
        "BuyerOfficeName": buyerOfficeName,
        "BuyerOfficePhone": buyerOfficePhone,
        "City": city,
        "CloseDate":
            "${closeDate!.year.toString().padLeft(4, '0')}-${closeDate!.month.toString().padLeft(2, '0')}-${closeDate!.day.toString().padLeft(2, '0')}",
        "ClosePrice": closePrice,
        "CommonWalls": commonWalls == null
            ? []
            : List<dynamic>.from(commonWalls!.map((x) => x)),
        "CommunityFeatures": communityFeatures == null
            ? []
            : List<dynamic>.from(communityFeatures!.map((x) => x)),
        "ConcessionsAmount": concessionsAmount,
        "ConstructionMaterials": constructionMaterials == null
            ? []
            : List<dynamic>.from(constructionMaterials!.map((x) => x)),
        "Cooling":
            cooling == null ? [] : List<dynamic>.from(cooling!.map((x) => x)),
        "Coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
        "Country": country,
        "CountyOrParish": countyOrParish,
        "CumulativeDaysOnMarket": cumulativeDaysOnMarket,
        "DaysOnMarket": daysOnMarket,
        "Directions": directions,
        "DualVariableCompensationYN": dualVariableCompensationYn,
        "ElementarySchool": elementarySchool,
        "ExpirationDate":
            "${expirationDate!.year.toString().padLeft(4, '0')}-${expirationDate!.month.toString().padLeft(2, '0')}-${expirationDate!.day.toString().padLeft(2, '0')}",
        "ExteriorFeatures": exteriorFeatures == null
            ? []
            : List<dynamic>.from(exteriorFeatures!.map((x) => x)),
        "FMLS_ActiveOpenHouseCount": fmlsActiveOpenHouseCount,
        "FMLS_AssessmentDueContemplatedYN": fmlsAssessmentDueContemplatedYn,
        "FMLS_AssumableYN": fmlsAssumableYn,
        "FMLS_AvailabilitytoReceiveOffers": fmlsAvailabilitytoReceiveOffers,
        "FMLS_BuyerFirmMlsId": fmlsBuyerFirmMlsId,
        "FMLS_BuyerOfficePresentOffersYN": fmlsBuyerOfficePresentOffersYn,
        "FMLS_CertProfHomeBldrs": fmlsCertProfHomeBldrs,
        "FMLS_CurrentPrice": fmlsCurrentPrice,
        "FMLS_DeedBook": fmlsDeedBook,
        "FMLS_DeedPage": fmlsDeedPage,
        "FMLS_District": fmlsDistrict,
        "FMLS_Dock":
            fmlsDock == null ? [] : List<dynamic>.from(fmlsDock!.map((x) => x)),
        "FMLS_HERSIndexRating": fmlsHersIndexRating,
        "FMLS_InitiationFee": fmlsInitiationFee,
        "FMLS_LandLot": fmlsLandLot,
        "FMLS_ListFirmMlsId": fmlsListFirmMlsId,
        "FMLS_ManagementCompany": fmlsManagementCompany,
        "FMLS_ManagementPhone": fmlsManagementPhone,
        "FMLS_MatrixTesting": fmlsMatrixTesting,
        "FMLS_OpenHouseCount": fmlsOpenHouseCount,
        "FMLS_OwnerFinancingYN": fmlsOwnerFinancingYn,
        "FMLS_OwnerSecondYN": fmlsOwnerSecondYn,
        "FMLS_PlatBook": fmlsPlatBook,
        "FMLS_PlatPage": fmlsPlatPage,
        "FMLS_PreviousStatus": fmlsPreviousStatus,
        "FMLS_ProposedClosedDate": fmlsProposedClosedDate?.toIso8601String(),
        "FMLS_RATIO_ClosePrice_By_ListPrice": fmlsRatioClosePriceByListPrice,
        "FMLS_RATIO_ClosePrice_By_OriginalListPrice":
            fmlsRatioClosePriceByOriginalListPrice,
        "FMLS_SectionGMD": fmlsSectionGmd,
        "FMLS_SpecialCircumstances": fmlsSpecialCircumstances == null
            ? []
            : List<dynamic>.from(fmlsSpecialCircumstances!.map((x) => x)),
        "FMLS_SwimTennisFee": fmlsSwimTennisFee,
        "FMLS_UnitCount": fmlsUnitCount,
        "FMLS_VirtualTourURLUnbranded2": fmlsVirtualTourUrlUnbranded2,
        "FMLS_WaterfrontageLength": fmlsWaterfrontageLength,
        "Fencing":
            fencing == null ? [] : List<dynamic>.from(fencing!.map((x) => x)),
        "FireplaceFeatures": fireplaceFeatures == null
            ? []
            : List<dynamic>.from(fireplaceFeatures!.map((x) => x)),
        "FireplacesTotal": fireplacesTotal,
        "Flooring":
            flooring == null ? [] : List<dynamic>.from(flooring!.map((x) => x)),
        "GarageSpaces": garageSpaces,
        "GreenEnergyEfficient": greenEnergyEfficient == null
            ? []
            : List<dynamic>.from(greenEnergyEfficient!.map((x) => x)),
        "HabitableResidenceYN": habitableResidenceYn,
        "Heating":
            heating == null ? [] : List<dynamic>.from(heating!.map((x) => x)),
        "HighSchool": highSchool,
        "HomeWarrantyYN": homeWarrantyYn,
        "InteriorFeatures": interiorFeatures == null
            ? []
            : List<dynamic>.from(interiorFeatures!.map((x) => x)),
        "InternetAddressDisplayYN": internetAddressDisplayYn,
        "InternetAutomatedValuationDisplayYN":
            internetAutomatedValuationDisplayYn,
        "InternetConsumerCommentYN": internetConsumerCommentYn,
        "InternetEntireListingDisplayYN": internetEntireListingDisplayYn,
        "LaundryFeatures": laundryFeatures == null
            ? []
            : List<dynamic>.from(laundryFeatures!.map((x) => x)),
        "Levels":
            levels == null ? [] : List<dynamic>.from(levels!.map((x) => x)),
        "ListAgentDirectPhone": listAgentDirectPhone,
        "ListAgentFullName": listAgentFullName,
        "ListAgentKey": listAgentKey,
        "ListAgentKeyNumeric": listAgentKeyNumeric,
        "ListAgentMlsId": listAgentMlsId,
        "ListOfficeKey": listOfficeKey,
        "ListOfficeKeyNumeric": listOfficeKeyNumeric,
        "ListOfficeMlsId": listOfficeMlsId,
        "ListOfficeName": listOfficeName,
        "ListOfficePhone": listOfficePhone,
        "ListOfficeURL": listOfficeUrl,
        "ListPrice": listPrice,
        "ListingContractDate":
            "${listingContractDate!.year.toString().padLeft(4, '0')}-${listingContractDate!.month.toString().padLeft(2, '0')}-${listingContractDate!.day.toString().padLeft(2, '0')}",
        "ListingId": listingId,
        "ListingKey": keyValues.reverse[listingKey],
        "ListingKeyNumeric": listingKeyNumeric,
        "LockBoxType": lockBoxType == null
            ? []
            : List<dynamic>.from(lockBoxType!.map((x) => x)),
        "LotFeatures": lotFeatures == null
            ? []
            : List<dynamic>.from(lotFeatures!.map((x) => x)),
        "LotSizeDimensions": lotSizeDimensions,
        "MainLevelBathrooms": mainLevelBathrooms,
        "MainLevelBedrooms": mainLevelBedrooms,
        "MiddleOrJuniorSchool": middleOrJuniorSchool,
        "MlsStatus": mlsStatus,
        "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
        "NumberOfUnitsInCommunity": numberOfUnitsInCommunity,
        "OffMarketDate":
            "${offMarketDate!.year.toString().padLeft(4, '0')}-${offMarketDate!.month.toString().padLeft(2, '0')}-${offMarketDate!.day.toString().padLeft(2, '0')}",
        "OpenParkingYN": openParkingYn,
        "OriginalListPrice": originalListPrice,
        "OriginatingSystemID": originatingSystemId,
        "OriginatingSystemKey": originatingSystemKey,
        "OriginatingSystemName": originatingSystemName,
        "OtherEquipment": otherEquipment == null
            ? []
            : List<dynamic>.from(otherEquipment!.map((x) => x)),
        "OtherStructures": otherStructures == null
            ? []
            : List<dynamic>.from(otherStructures!.map((x) => x)),
        "Ownership": ownership,
        "ParcelNumber": parcelNumber,
        "ParkingFeatures": parkingFeatures == null
            ? []
            : List<dynamic>.from(parkingFeatures!.map((x) => x)),
        "PatioAndPorchFeatures": patioAndPorchFeatures == null
            ? []
            : List<dynamic>.from(patioAndPorchFeatures!.map((x) => x)),
        "PhotosChangeTimestamp": photosChangeTimestamp?.toIso8601String(),
        "PhotosCount": photosCount,
        "PoolFeatures": poolFeatures == null
            ? []
            : List<dynamic>.from(poolFeatures!.map((x) => x)),
        "PoolPrivateYN": poolPrivateYn,
        "PostalCode": postalCode,
        "PreviousListPrice": previousListPrice,
        "PrivateRemarks": privateRemarks,
        "PropertyAttachedYN": propertyAttachedYn,
        "PropertyCondition": propertyCondition == null
            ? []
            : List<dynamic>.from(propertyCondition!.map((x) => x)),
        "PropertySubType": propertySubType,
        "PropertyType": propertyTypeValues.reverse[propertyType],
        "PublicRemarks": publicRemarks,
        "PurchaseContractDate":
            "${purchaseContractDate!.year.toString().padLeft(4, '0')}-${purchaseContractDate!.month.toString().padLeft(2, '0')}-${purchaseContractDate!.day.toString().padLeft(2, '0')}",
        "RoomBedroomFeatures": roomBedroomFeatures == null
            ? []
            : List<dynamic>.from(roomBedroomFeatures!.map((x) => x)),
        "RoomDiningRoomFeatures": roomDiningRoomFeatures == null
            ? []
            : List<dynamic>.from(roomDiningRoomFeatures!.map((x) => x)),
        "RoomKitchenFeatures": roomKitchenFeatures == null
            ? []
            : List<dynamic>.from(roomKitchenFeatures!.map((x) => x)),
        "RoomMasterBathroomFeatures": roomMasterBathroomFeatures == null
            ? []
            : List<dynamic>.from(roomMasterBathroomFeatures!.map((x) => x)),
        "RoomType":
            roomType == null ? [] : List<dynamic>.from(roomType!.map((x) => x)),
        "SecurityFeatures": securityFeatures == null
            ? []
            : List<dynamic>.from(securityFeatures!.map((x) => x)),
        "ShowingRequirements": showingRequirements == null
            ? []
            : List<dynamic>.from(showingRequirements!.map((x) => x)),
        "SourceSystemID": sourceSystemId,
        "SourceSystemKey": sourceSystemKey,
        "SourceSystemName": sourceSystemName,
        "SpecialListingConditions": specialListingConditions == null
            ? []
            : List<dynamic>.from(specialListingConditions!.map((x) => x)),
        "StandardStatus": standardStatus,
        "StateOrProvince": stateOrProvince,
        "StreetName": streetName,
        "StreetNumber": streetNumber,
        "StreetNumberNumeric": streetNumberNumeric,
        "StreetSuffix": streetSuffix,
        "SubdivisionName": subdivisionName,
        "TaxAnnualAmount": taxAnnualAmount,
        "TaxBlock": taxBlock,
        "TaxLot": taxLot,
        "TaxParcelLetter": taxParcelLetter,
        "TaxYear": taxYear,
        "UnitNumber": unitNumber,
        "UnparsedAddress": unparsedAddress,
        "Utilities": utilities == null
            ? []
            : List<dynamic>.from(utilities!.map((x) => x)),
        "View": view == null ? [] : List<dynamic>.from(view!.map((x) => x)),
        "WaterBodyName": waterBodyName,
        "YearBuilt": yearBuilt,
        "FeedTypes": feedTypes == null
            ? []
            : List<dynamic>.from(feedTypes!.map((x) => x)),
        "MediaOrder": mediaOrder == null
            ? []
            : List<dynamic>.from(mediaOrder!.map((x) => x)),
        "MediaKey":
            mediaKey == null ? [] : List<dynamic>.from(mediaKey!.map((x) => x)),
        "MediaURL":
            mediaUrl == null ? [] : List<dynamic>.from(mediaUrl!.map((x) => x)),
        "MediaResourceRecordKey": mediaResourceRecordKey == null
            ? []
            : List<dynamic>.from(
                mediaResourceRecordKey!.map((x) => keyValues.reverse[x])),
        "MediaResourceName": mediaResourceName == null
            ? []
            : List<dynamic>.from(mediaResourceName!
                .map((x) => mediaResourceNameValues.reverse[x])),
        "MediaClassName": mediaClassName == null
            ? []
            : List<dynamic>.from(
                mediaClassName!.map((x) => propertyTypeValues.reverse[x])),
        "MediaCategory": mediaCategory == null
            ? []
            : List<dynamic>.from(
                mediaCategory!.map((x) => mediaCategoryValues.reverse[x])),
        "MediaMimeType": mediaMimeType == null
            ? []
            : List<dynamic>.from(
                mediaMimeType!.map((x) => mediaMimeTypeValues.reverse[x])),
        "MediaObjectID": mediaObjectId == null
            ? []
            : List<dynamic>.from(mediaObjectId!.map((x) => x)),
        "MediaShortDescription": mediaShortDescription == null
            ? []
            : List<dynamic>.from(mediaShortDescription!.map((x) => x)),
        "Media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "_version_": version,
      };
}

enum Key { THE_25939_F6595_A1_A6_B029_AE90_B93_B043_C27 }

final keyValues = EnumValues({
  "25939f6595a1a6b029ae90b93b043c27":
      Key.THE_25939_F6595_A1_A6_B029_AE90_B93_B043_C27
});

enum MediaCategory { PHOTO }

final mediaCategoryValues = EnumValues({"Photo": MediaCategory.PHOTO});

enum PropertyType { RESIDENTIAL }

final propertyTypeValues =
    EnumValues({"Residential": PropertyType.RESIDENTIAL});

enum MediaMimeType { IMAGE_JPEG }

final mediaMimeTypeValues =
    EnumValues({"image/jpeg": MediaMimeType.IMAGE_JPEG});

enum MediaResourceName { PROPERTY }

final mediaResourceNameValues =
    EnumValues({"Property": MediaResourceName.PROPERTY});

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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
