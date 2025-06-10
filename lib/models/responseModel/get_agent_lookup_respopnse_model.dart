// To parse this JSON data, do
//
//     final getAdvanceSearchPropertyResponseModel = getAdvanceSearchPropertyResponseModelFromJson(jsonString);

import 'dart:convert';

GetAgentLookUpResponseModel getAdvanceSearchPropertyResponseModelFromJson(
        String str) =>
    GetAgentLookUpResponseModel.fromJson(json.decode(str));

String getAdvanceSearchPropertyResponseModelToJson(
        GetAgentLookUpResponseModel data) =>
    json.encode(data.toJson());

class GetAgentLookUpResponseModel {
  ResponseHeader? responseHeader;
  Response? response;

  GetAgentLookUpResponseModel({
    this.responseHeader,
    this.response,
  });

  factory GetAgentLookUpResponseModel.fromJson(Map<String, dynamic> json) =>
      GetAgentLookUpResponseModel(
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
  dynamic numFound;
  dynamic start;
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
  dynamic associationFee;
  dynamic associationFee2;
  String? associationFee2Frequency;
  String? associationFeeFrequency;
  dynamic associationYn;
  DateTime? availabilityDate;
  List<String>? basement;
  dynamic bathroomsFull;
  dynamic bathroomsHalf;
  dynamic bathroomsTotalDecimal;
  dynamic bedroomsTotal;
  DateTime? bridgeModificationTimestamp;
  String? buildingAreaSource;
  dynamic buildingAreaTotal;
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
  List<dynamic>? coordinates;
  String? country;
  String? countyOrParish;
  dynamic cumulativeDaysOnMarket;
  dynamic daysOnMarket;
  String? directions;
  bool? dualVariableCompensationYn;
  String? elementarySchool;
  DateTime? expirationDate;
  List<String>? exteriorFeatures;
  dynamic fmlsActiveOpenHouseCount;
  bool? fmlsAssessmentDueContemplatedYn;
  bool? fmlsAssumableYn;
  String? fmlsAvailabilitytoReceiveOffers;
  String? fmlsBuyerFirmMlsId;
  bool? fmlsBuyerOfficePresentOffersYn;
  dynamic fmlsCurrentPrice;
  String? fmlsDeedBook;
  String? fmlsDeedPage;
  String? fmlsDistrict;
  List<String>? fmlsDock;
  String? fmlsHersIndexRating;
  String? fmlsInitiationFee;
  String? fmlsLandLot;
  String? fmlsListFirmMlsId;
  bool? fmlsMatrixTesting;
  dynamic fmlsOpenHouseCount;
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
  String? fmlsWaterfrontageLength;
  List<String>? fencing;
  List<String>? fireplaceFeatures;
  dynamic fireplacesTotal;
  List<dynamic>? flooring;
  dynamic garageSpaces;
  List<String>? greenEnergyEfficient;
  bool? habitableResidenceYn;
  List<String>? heating;
  String? highSchool;
  dynamic homeWarrantyYn;
  List<String>? interiorFeatures;
  dynamic internetAddressDisplayYn;
  dynamic internetAutomatedValuationDisplayYn;
  dynamic internetConsumerCommentYn;
  dynamic internetEntireListingDisplayYn;
  List<String>? laundryFeatures;
  List<String>? levels;
  String? listAgentDirectPhone;
  String? listAgentFullName;
  String? listAgentKey;
  dynamic listAgentKeyNumeric;
  String? listAgentMlsId;
  String? listOfficeKey;
  dynamic listOfficeKeyNumeric;
  String? listOfficeMlsId;
  String? listOfficeName;
  String? listOfficePhone;
  String? listOfficeUrl;
  dynamic listPrice;
  DateTime? listingContractDate;
  String? listingId;
  Key? listingKey;
  dynamic listingKeyNumeric;
  List<String>? lockBoxType;
  List<String>? lotFeatures;
  String? lotSizeDimensions;
  dynamic mainLevelBathrooms;
  dynamic mainLevelBedrooms;
  String? middleOrJuniorSchool;
  String? mlsStatus;
  DateTime? modificationTimestamp;
  DateTime? offMarketDate;
  dynamic openParkingYn;
  dynamic originalListPrice;
  String? originatingSystemId;
  String? originatingSystemKey;
  String? originatingSystemName;
  List<String>? otherEquipment;
  List<String>? otherStructures;
  String? parcelNumber;
  List<String>? parkingFeatures;
  List<String>? patioAndPorchFeatures;
  DateTime? photosChangeTimestamp;
  dynamic photosCount;
  List<String>? poolFeatures;
  bool? poolPrivateYn;
  String? postalCode;
  dynamic previousListPrice;
  String? privateRemarks;
  dynamic propertyAttachedYn;
  List<String>? propertyCondition;
  String? propertySubType;
  String? propertyType;
  String? publicRemarks;
  DateTime? purchaseContractDate;
  List<String>? roadSurfaceType;
  List<String>? roomBedroomFeatures;
  List<String>? roomDiningRoomFeatures;
  List<String>? roomKitchenFeatures;
  List<String>? roomMasterBathroomFeatures;
  List<String>? roomType;
  List<String>? securityFeatures;
  List<String>? sewer;
  List<dynamic>? showingRequirements;
  String? sourceSystemId;
  String? sourceSystemKey;
  String? sourceSystemName;
  List<String>? specialListingConditions;
  String? standardStatus;
  String? stateOrProvince;
  String? streetName;
  String? streetNumber;
  dynamic streetNumberNumeric;
  String? streetSuffix;
  String? subdivisionName;
  dynamic taxAnnualAmount;
  String? taxBlock;
  String? taxLot;
  String? taxParcelLetter;
  dynamic taxYear;
  String? unparsedAddress;
  List<String>? utilities;
  List<dynamic>? view;
  String? waterBodyName;
  List<String>? waterSource;
  dynamic yearBuilt;
  List<String>? feedTypes;
  List<String>? mediaOrder;
  List<String>? mediaKey;
  List<String>? mediaUrl;
  List<dynamic>? mediaResourceRecordKey;
  List<MediaResourceName>? mediaResourceName;
  List<MediaClassName>? mediaClassName;
  List<MediaCategory>? mediaCategory;
  List<MediaMimeType>? mediaMimeType;
  List<String>? mediaObjectId;
  List<String>? media;
  double? version;
  String? fmlsSwimTennisFeeDue;
  String? fmlsVirtualTourUrlUnbranded2;
  String? streetDirPrefix;
  String? postalCodePlus4;
  List<String>? windowFeatures;
  String? fmlsSchoolBusRouteElemYn;
  String? fmlsSchoolBusRouteHighYn;
  String? fmlsSchoolBusRouteMiddleYn;
  DateTime? priceChangeTimestamp;
  List<dynamic>? roof;
  DateTime? statusChangeTimestamp;
  List<dynamic>? businessType;
  String? coListAgentDirectPhone;
  String? coListAgentFullName;
  String? coListAgentKey;
  String? coListAgentKeyNumeric;
  String? coListAgentMlsId;
  String? fmlsAnnualUtilitiesAmount;
  List<dynamic>? fmlsLoadingDesc;
  List<String>? fmlsRecommendedZoning;
  String? fmlsRoadFrontFeet;
  List<String>? fmlsSaleIncludes;
  List<dynamic>? listingTerms;
  dynamic lotSizeAcres;
  String? numberOfBuildings;
  List<String>? ownerPays;
  String? parkingTotal;
  String? zoning;
  List<String>? associationFeeIncludes;
  String? associationPhone;
  String? fmlsManagementCompany;
  String? fmlsManagementCompanyEmail;
  String? fmlsManagementPhone;
  String? numberOfUnitsInCommunity;
  String? ownership;
  String? unitNumber;

  Doc({
    this.accessibilityFeatures,
    this.appliances,
    this.architecturalStyle,
    this.associationFee,
    this.associationFee2,
    this.associationFee2Frequency,
    this.associationFeeFrequency,
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
    this.fmlsCurrentPrice,
    this.fmlsDeedBook,
    this.fmlsDeedPage,
    this.fmlsDistrict,
    this.fmlsDock,
    this.fmlsHersIndexRating,
    this.fmlsInitiationFee,
    this.fmlsLandLot,
    this.fmlsListFirmMlsId,
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
    this.offMarketDate,
    this.openParkingYn,
    this.originalListPrice,
    this.originatingSystemId,
    this.originatingSystemKey,
    this.originatingSystemName,
    this.otherEquipment,
    this.otherStructures,
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
    this.roadSurfaceType,
    this.roomBedroomFeatures,
    this.roomDiningRoomFeatures,
    this.roomKitchenFeatures,
    this.roomMasterBathroomFeatures,
    this.roomType,
    this.securityFeatures,
    this.sewer,
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
    this.unparsedAddress,
    this.utilities,
    this.view,
    this.waterBodyName,
    this.waterSource,
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
    this.media,
    this.version,
    this.fmlsSwimTennisFeeDue,
    this.fmlsVirtualTourUrlUnbranded2,
    this.streetDirPrefix,
    this.postalCodePlus4,
    this.windowFeatures,
    this.fmlsSchoolBusRouteElemYn,
    this.fmlsSchoolBusRouteHighYn,
    this.fmlsSchoolBusRouteMiddleYn,
    this.priceChangeTimestamp,
    this.roof,
    this.statusChangeTimestamp,
    this.businessType,
    this.coListAgentDirectPhone,
    this.coListAgentFullName,
    this.coListAgentKey,
    this.coListAgentKeyNumeric,
    this.coListAgentMlsId,
    this.fmlsAnnualUtilitiesAmount,
    this.fmlsLoadingDesc,
    this.fmlsRecommendedZoning,
    this.fmlsRoadFrontFeet,
    this.fmlsSaleIncludes,
    this.listingTerms,
    this.lotSizeAcres,
    this.numberOfBuildings,
    this.ownerPays,
    this.parkingTotal,
    this.zoning,
    this.associationFeeIncludes,
    this.associationPhone,
    this.fmlsManagementCompany,
    this.fmlsManagementCompanyEmail,
    this.fmlsManagementPhone,
    this.numberOfUnitsInCommunity,
    this.ownership,
    this.unitNumber,
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
            : List<dynamic>.from(json["Coordinates"]!.map((x) => x)),
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
        fmlsCurrentPrice: json["FMLS_CurrentPrice"],
        fmlsDeedBook: json["FMLS_DeedBook"],
        fmlsDeedPage: json["FMLS_DeedPage"],
        fmlsDistrict: json["FMLS_District"],
        fmlsDock: json["FMLS_Dock"] == null
            ? []
            : List<String>.from(json["FMLS_Dock"]!.map((x) => x)),
        fmlsHersIndexRating: json["FMLS_HERSIndexRating"],
        fmlsInitiationFee: json["FMLS_InitiationFee"],
        fmlsLandLot: json["FMLS_LandLot"] ?? '',
        fmlsListFirmMlsId: json["FMLS_ListFirmMlsId"],
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
            : List<dynamic>.from(
                json["Flooring"]!.map((x) => businessTypeValues.map[x])),
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
        listingKey: keyValues.map[json["ListingKey"]],
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
        propertyType: json["PropertyType"],
        publicRemarks: json["PublicRemarks"],
        purchaseContractDate: json["PurchaseContractDate"] == null
            ? null
            : DateTime.parse(json["PurchaseContractDate"]),
        roadSurfaceType: json["RoadSurfaceType"] == null
            ? []
            : List<String>.from(json["RoadSurfaceType"]!.map((x) => x)),
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
        sewer: json["Sewer"] == null
            ? []
            : List<String>.from(json["Sewer"]!.map((x) => x)),
        showingRequirements: json["ShowingRequirements"] == null
            ? []
            : List<dynamic>.from(json["ShowingRequirements"]!
                .map((x) => showingRequirementValues.map[x])),
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
        unparsedAddress: json["UnparsedAddress"],
        utilities: json["Utilities"] == null
            ? []
            : List<String>.from(json["Utilities"]!.map((x) => x)),
        view: json["View"] == null
            ? []
            : List<dynamic>.from(
                json["View"]!.map((x) => businessTypeValues.map[x])),
        waterBodyName: json["WaterBodyName"],
        waterSource: json["WaterSource"] == null
            ? []
            : List<String>.from(json["WaterSource"]!.map((x) => x)),
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
            : List<dynamic>.from(json["MediaResourceRecordKey"]!
                .map((x) => keyValues.map[x] ?? [])),
        mediaResourceName: json["MediaResourceName"] == null
            ? []
            : List<MediaResourceName>.from(json["MediaResourceName"]!
                .map((x) => mediaResourceNameValues.map[x]!)),
        mediaClassName: json["MediaClassName"] == null
            ? []
            : List<MediaClassName>.from(json["MediaClassName"]!
                .map((x) => mediaClassNameValues.map[x]!)),
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
        media: json["Media"] == null
            ? []
            : List<String>.from(json["Media"]!.map((x) => x)),
        version: json["_version_"]?.toDouble(),
        fmlsSwimTennisFeeDue: json["FMLS_SwimTennisFeeDue"],
        fmlsVirtualTourUrlUnbranded2: json["FMLS_VirtualTourURLUnbranded2"],
        streetDirPrefix: json["StreetDirPrefix"],
        postalCodePlus4: json["PostalCodePlus4"],
        windowFeatures: json["WindowFeatures"] == null
            ? []
            : List<String>.from(json["WindowFeatures"]!.map((x) => x)),
        fmlsSchoolBusRouteElemYn: json["FMLS_SchoolBusRouteElemYN"],
        fmlsSchoolBusRouteHighYn: json["FMLS_SchoolBusRouteHighYN"],
        fmlsSchoolBusRouteMiddleYn: json["FMLS_SchoolBusRouteMiddleYN"],
        priceChangeTimestamp: json["PriceChangeTimestamp"] == null
            ? null
            : DateTime.parse(json["PriceChangeTimestamp"]),
        roof: json["Roof"] == null
            ? []
            : List<dynamic>.from(
                json["Roof"]!.map((x) => businessTypeValues.map[x])),
        statusChangeTimestamp: json["StatusChangeTimestamp"] == null
            ? null
            : DateTime.parse(json["StatusChangeTimestamp"]),
        businessType: json["BusinessType"] == null
            ? []
            : List<dynamic>.from(
                json["BusinessType"]!.map((x) => businessTypeValues.map[x])),
        coListAgentDirectPhone: json["CoListAgentDirectPhone"],
        coListAgentFullName: json["CoListAgentFullName"],
        coListAgentKey: json["CoListAgentKey"],
        coListAgentKeyNumeric: json["CoListAgentKeyNumeric"],
        coListAgentMlsId: json["CoListAgentMlsId"],
        fmlsAnnualUtilitiesAmount: json["FMLS_AnnualUtilitiesAmount"],
        fmlsLoadingDesc: json["FMLS_LoadingDesc"] == null
            ? []
            : List<dynamic>.from(json["FMLS_LoadingDesc"]!
                .map((x) => businessTypeValues.map[x])),
        fmlsRecommendedZoning: json["FMLS_RecommendedZoning"] == null
            ? []
            : List<String>.from(json["FMLS_RecommendedZoning"]!.map((x) => x)),
        fmlsRoadFrontFeet: json["FMLS_RoadFrontFeet"],
        fmlsSaleIncludes: json["FMLS_SaleIncludes"] == null
            ? []
            : List<String>.from(json["FMLS_SaleIncludes"]!.map((x) => x)),
        listingTerms: json["ListingTerms"] == null
            ? []
            : List<dynamic>.from(
                json["ListingTerms"]!.map((x) => businessTypeValues.map[x])),
        lotSizeAcres: json["LotSizeAcres"],
        numberOfBuildings: json["NumberOfBuildings"],
        ownerPays: json["OwnerPays"] == null
            ? []
            : List<String>.from(json["OwnerPays"]!.map((x) => x)),
        parkingTotal: json["ParkingTotal"],
        zoning: json["Zoning"],
        associationFeeIncludes: json["AssociationFeeIncludes"] == null
            ? []
            : List<String>.from(json["AssociationFeeIncludes"]!.map((x) => x)),
        associationPhone: json["AssociationPhone"],
        fmlsManagementCompany: json["FMLS_ManagementCompany"],
        fmlsManagementCompanyEmail: json["FMLS_ManagementCompanyEmail"],
        fmlsManagementPhone: json["FMLS_ManagementPhone"],
        numberOfUnitsInCommunity: json["NumberOfUnitsInCommunity"],
        ownership: json["Ownership"],
        unitNumber: json["UnitNumber"],
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
        "FMLS_WaterfrontageLength": fmlsWaterfrontageLength,
        "Fencing":
            fencing == null ? [] : List<dynamic>.from(fencing!.map((x) => x)),
        "FireplaceFeatures": fireplaceFeatures == null
            ? []
            : List<dynamic>.from(fireplaceFeatures!.map((x) => x)),
        "FireplacesTotal": fireplacesTotal,
        "Flooring": flooring == null
            ? []
            : List<dynamic>.from(
                flooring!.map((x) => businessTypeValues.reverse[x])),
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
        "PropertyType": propertyType,
        "PublicRemarks": publicRemarks,
        "PurchaseContractDate":
            "${purchaseContractDate!.year.toString().padLeft(4, '0')}-${purchaseContractDate!.month.toString().padLeft(2, '0')}-${purchaseContractDate!.day.toString().padLeft(2, '0')}",
        "RoadSurfaceType": roadSurfaceType == null
            ? []
            : List<dynamic>.from(roadSurfaceType!.map((x) => x)),
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
        "Sewer": sewer == null ? [] : List<dynamic>.from(sewer!.map((x) => x)),
        "ShowingRequirements": showingRequirements == null
            ? []
            : List<dynamic>.from(showingRequirements!
                .map((x) => showingRequirementValues.reverse[x])),
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
        "UnparsedAddress": unparsedAddress,
        "Utilities": utilities == null
            ? []
            : List<dynamic>.from(utilities!.map((x) => x)),
        "View": view == null
            ? []
            : List<dynamic>.from(
                view!.map((x) => businessTypeValues.reverse[x])),
        "WaterBodyName": waterBodyName,
        "WaterSource": waterSource == null
            ? []
            : List<dynamic>.from(waterSource!.map((x) => x)),
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
                mediaClassName!.map((x) => mediaClassNameValues.reverse[x])),
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
        "Media": media == null ? [] : List<dynamic>.from(media!.map((x) => x)),
        "_version_": version,
        "FMLS_SwimTennisFeeDue": fmlsSwimTennisFeeDue,
        "FMLS_VirtualTourURLUnbranded2": fmlsVirtualTourUrlUnbranded2,
        "StreetDirPrefix": streetDirPrefix,
        "PostalCodePlus4": postalCodePlus4,
        "WindowFeatures": windowFeatures == null
            ? []
            : List<dynamic>.from(windowFeatures!.map((x) => x)),
        "FMLS_SchoolBusRouteElemYN": fmlsSchoolBusRouteElemYn,
        "FMLS_SchoolBusRouteHighYN": fmlsSchoolBusRouteHighYn,
        "FMLS_SchoolBusRouteMiddleYN": fmlsSchoolBusRouteMiddleYn,
        "PriceChangeTimestamp": priceChangeTimestamp?.toIso8601String(),
        "Roof": roof == null
            ? []
            : List<dynamic>.from(
                roof!.map((x) => businessTypeValues.reverse[x])),
        "StatusChangeTimestamp": statusChangeTimestamp?.toIso8601String(),
        "BusinessType": businessType == null
            ? []
            : List<dynamic>.from(
                businessType!.map((x) => businessTypeValues.reverse[x])),
        "CoListAgentDirectPhone": coListAgentDirectPhone,
        "CoListAgentFullName": coListAgentFullName,
        "CoListAgentKey": coListAgentKey,
        "CoListAgentKeyNumeric": coListAgentKeyNumeric,
        "CoListAgentMlsId": coListAgentMlsId,
        "FMLS_AnnualUtilitiesAmount": fmlsAnnualUtilitiesAmount,
        "FMLS_LoadingDesc": fmlsLoadingDesc == null
            ? []
            : List<dynamic>.from(
                fmlsLoadingDesc!.map((x) => businessTypeValues.reverse[x])),
        "FMLS_RecommendedZoning": fmlsRecommendedZoning == null
            ? []
            : List<dynamic>.from(fmlsRecommendedZoning!.map((x) => x)),
        "FMLS_RoadFrontFeet": fmlsRoadFrontFeet,
        "FMLS_SaleIncludes": fmlsSaleIncludes == null
            ? []
            : List<dynamic>.from(fmlsSaleIncludes!.map((x) => x)),
        "ListingTerms": listingTerms == null
            ? []
            : List<dynamic>.from(
                listingTerms!.map((x) => businessTypeValues.reverse[x])),
        "LotSizeAcres": lotSizeAcres,
        "NumberOfBuildings": numberOfBuildings,
        "OwnerPays": ownerPays == null
            ? []
            : List<dynamic>.from(ownerPays!.map((x) => x)),
        "ParkingTotal": parkingTotal,
        "Zoning": zoning,
        "AssociationFeeIncludes": associationFeeIncludes == null
            ? []
            : List<dynamic>.from(associationFeeIncludes!.map((x) => x)),
        "AssociationPhone": associationPhone,
        "FMLS_ManagementCompany": fmlsManagementCompany,
        "FMLS_ManagementCompanyEmail": fmlsManagementCompanyEmail,
        "FMLS_ManagementPhone": fmlsManagementPhone,
        "NumberOfUnitsInCommunity": numberOfUnitsInCommunity,
        "Ownership": ownership,
        "UnitNumber": unitNumber,
      };
}

enum BusinessType { CARPET, HARDWOOD, OTHER }

final businessTypeValues = EnumValues({
  "Carpet": BusinessType.CARPET,
  "Hardwood": BusinessType.HARDWOOD,
  "Other": BusinessType.OTHER
});

enum Key {
  THE_736_CF9682_ABB87_B4_D5_B67_C3_DC17_BACB1,
  THE_106_BFC2981229_F5_B186_B044_B648_A0169,
  THE_566041277_A20_C2_C4208_EBA7234452353,
  DBC6_A776_EA8_FED74_BF6_D869_EBC610_EE4,
  THE_88274_D7_B4_BAD2_B5_BD328_EEC7_B6_D8_BEDC,
  THE_13_FAD422_AC1_DD6_B8_C8_FF06083_C5856_FB,
  C095565_BFD30943508_E65_E7_A37_C72_D64
}

final keyValues = EnumValues({
  "c095565bfd30943508e65e7a37c72d64":
      Key.C095565_BFD30943508_E65_E7_A37_C72_D64,
  "dbc6a776ea8fed74bf6d869ebc610ee4":
      Key.DBC6_A776_EA8_FED74_BF6_D869_EBC610_EE4,
  "106bfc2981229f5b186b044b648a0169":
      Key.THE_106_BFC2981229_F5_B186_B044_B648_A0169,
  "13fad422ac1dd6b8c8ff06083c5856fb":
      Key.THE_13_FAD422_AC1_DD6_B8_C8_FF06083_C5856_FB,
  "566041277a20c2c4208eba7234452353":
      Key.THE_566041277_A20_C2_C4208_EBA7234452353,
  "736cf9682abb87b4d5b67c3dc17bacb1":
      Key.THE_736_CF9682_ABB87_B4_D5_B67_C3_DC17_BACB1,
  "88274d7b4bad2b5bd328eec7b6d8bedc":
      Key.THE_88274_D7_B4_BAD2_B5_BD328_EEC7_B6_D8_BEDC
});

enum MediaCategory { PHOTO }

final mediaCategoryValues = EnumValues({"Photo": MediaCategory.PHOTO});

enum MediaClassName { RESIDENTIAL }

final mediaClassNameValues =
    EnumValues({"Residential": MediaClassName.RESIDENTIAL});

enum MediaMimeType { IMAGE_JPEG }

final mediaMimeTypeValues =
    EnumValues({"image/jpeg": MediaMimeType.IMAGE_JPEG});

enum MediaResourceName { PROPERTY }

final mediaResourceNameValues =
    EnumValues({"Property": MediaResourceName.PROPERTY});

enum ShowingRequirement { VACANT, ANYTIME_ACCESS, CALL_LISTING_OFFICE }

final showingRequirementValues = EnumValues({
  "Anytime Access": ShowingRequirement.ANYTIME_ACCESS,
  "Call Listing Office": ShowingRequirement.CALL_LISTING_OFFICE,
  "Vacant": ShowingRequirement.VACANT
});

class ResponseHeader {
  dynamic status;
  dynamic qTime;
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
