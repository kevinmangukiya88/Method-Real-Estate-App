// To parse this JSON data, do
//
//     final listingHistoryResponseModel = listingHistoryResponseModelFromJson(jsonString);

import 'dart:convert';

ListingHistoryResponseModel listingHistoryResponseModelFromJson(String str) =>
    ListingHistoryResponseModel.fromJson(json.decode(str));

String listingHistoryResponseModelToJson(ListingHistoryResponseModel data) =>
    json.encode(data.toJson());

class ListingHistoryResponseModel {
  ResponseHeader? responseHeader;
  Response? response;

  ListingHistoryResponseModel({
    this.responseHeader,
    this.response,
  });

  factory ListingHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      ListingHistoryResponseModel(
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
  String? associationFeeFrequency;
  List<String>? associationFeeIncludes;
  bool? associationYn;
  List<String>? basement;
  dynamic bathroomsFull;
  dynamic bathroomsHalf;
  dynamic bathroomsTotalDecimal;
  dynamic bathroomsTotalInteger;
  dynamic bedroomsTotal;
  DateTime? bridgeModificationTimestamp;
  String? builderName;
  String? buildingAreaSource;
  dynamic buildingAreaTotal;
  String? buyerAgencyCompensation;
  String? buyerAgencyCompensationType;
  String? city;
  List<String>? commonWalls;
  List<String>? communityFeatures;
  List<String>? constructionMaterials;
  List<String>? cooling;
  List<double>? coordinates;
  String? country;
  String? countyOrParish;
  dynamic cumulativeDaysOnMarket;
  dynamic daysOnMarket;
  String? directions;
  bool? dualVariableCompensationYn;
  List<String>? electric;
  String? elementarySchool;
  List<String>? exteriorFeatures;
  dynamic fmlsActiveOpenHouseCount;
  bool? fmlsAssessmentDueContemplatedYn;
  bool? fmlsAssociationRentRestrictionsYn;
  bool? fmlsAssumableYn;
  String? fmlsAvailabilitytoReceiveOffers;
  bool? fmlsBuyerOfficePresentOffersYn;
  dynamic fmlsCurrentPrice;
  bool? fmlsDpryn;
  String? fmlsDistrict;
  List<String>? fmlsDock;
  String? fmlsInitiationFee;
  String? fmlsLandLot;
  String? fmlsListFirmMlsId;
  String? fmlsManagementCompany;
  String? fmlsManagementCompanyEmail;
  String? fmlsManagementPhone;
  bool? fmlsMatrixTesting;
  dynamic fmlsOpenHouseCount;
  bool? fmlsOwnerFinancingYn;
  bool? fmlsOwnerSecondYn;
  String? fmlsPlatBook;
  String? fmlsPlatPage;
  String? fmlsSchoolBusRouteElemYn;
  String? fmlsSchoolBusRouteHighYn;
  String? fmlsSchoolBusRouteMiddleYn;
  String? fmlsSectionGmd;
  List<String>? fmlsSpecialCircumstances;
  String? fmlsVirtualTourUrlUnbranded2;
  List<String>? fencing;
  List<String>? fireplaceFeatures;
  dynamic fireplacesTotal;
  List<String>? flooring;
  List<String>? foundationDetails;
  dynamic garageSpaces;
  List<String>? greenEnergyEfficient;
  List<String>? greenEnergyGeneration;
  bool? habitableResidenceYn;
  List<String>? heating;
  String? highSchool;
  bool? homeWarrantyYn;
  List<String>? horseAmenities;
  List<String>? interiorFeatures;
  bool? internetAddressDisplayYn;
  bool? internetAutomatedValuationDisplayYn;
  bool? internetConsumerCommentYn;
  bool? internetEntireListingDisplayYn;
  bool? landLeaseYn;
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
  dynamic lotSizeAcres;
  String? lotSizeDimensions;
  String? lotSizeSource;
  dynamic mainLevelBathrooms;
  dynamic mainLevelBedrooms;
  DateTime? majorChangeTimestamp;
  String? majorChangeType;
  String? middleOrJuniorSchool;
  String? mlsStatus;
  DateTime? modificationTimestamp;
  String? occupantType;
  DateTime? onMarketDate;
  bool? openParkingYn;
  dynamic originalListPrice;
  String? originatingSystemId;
  String? originatingSystemKey;
  String? originatingSystemName;
  List<String>? otherEquipment;
  List<String>? otherStructures;
  List<String>? parkingFeatures;
  String? parkingTotal;
  List<String>? patioAndPorchFeatures;
  DateTime? photosChangeTimestamp;
  dynamic photosCount;
  List<String>? poolFeatures;
  bool? poolPrivateYn;
  List<String>? possession;
  String? postalCode;
  String? privateRemarks;
  bool? propertyAttachedYn;
  List<String>? propertyCondition;
  String? propertySubType;
  PropertyType? propertyType;
  String? publicRemarks;
  List<String>? roadFrontageType;
  List<String>? roadSurfaceType;
  List<String>? roof;
  List<String>? roomBedroomFeatures;
  List<String>? roomDiningRoomFeatures;
  List<String>? roomKitchenFeatures;
  List<String>? roomMasterBathroomFeatures;
  List<String>? roomType;
  List<String>? securityFeatures;
  List<String>? sewer;
  String? showingContactName;
  String? showingContactPhone;
  List<String>? showingRequirements;
  String? sourceSystemKey;
  List<String>? spaFeatures;
  List<String>? specialListingConditions;
  String? standardStatus;
  String? stateOrProvince;
  DateTime? statusChangeTimestamp;
  String? streetDirSuffix;
  String? streetName;
  String? streetNumber;
  dynamic streetNumberNumeric;
  String? streetSuffix;
  String? subdivisionName;
  dynamic taxAnnualAmount;
  String? taxBlock;
  String? taxLegalDescription;
  String? taxLot;
  String? taxParcelLetter;
  dynamic taxYear;
  String? unparsedAddress;
  List<String>? utilities;
  List<String>? view;
  String? waterBodyName;
  List<String>? waterSource;
  List<String>? waterfrontFeatures;
  List<String>? windowFeatures;
  dynamic yearBuilt;
  List<String>? feedTypes;
  List<String>? mediaOrder;
  List<String>? mediaKey;
  List<String>? mediaUrl;
  List<dynamic>? mediaResourceRecordKey;
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
    this.associationFeeFrequency,
    this.associationFeeIncludes,
    this.associationYn,
    this.basement,
    this.bathroomsFull,
    this.bathroomsHalf,
    this.bathroomsTotalDecimal,
    this.bathroomsTotalInteger,
    this.bedroomsTotal,
    this.bridgeModificationTimestamp,
    this.builderName,
    this.buildingAreaSource,
    this.buildingAreaTotal,
    this.buyerAgencyCompensation,
    this.buyerAgencyCompensationType,
    this.city,
    this.commonWalls,
    this.communityFeatures,
    this.constructionMaterials,
    this.cooling,
    this.coordinates,
    this.country,
    this.countyOrParish,
    this.cumulativeDaysOnMarket,
    this.daysOnMarket,
    this.directions,
    this.dualVariableCompensationYn,
    this.electric,
    this.elementarySchool,
    this.exteriorFeatures,
    this.fmlsActiveOpenHouseCount,
    this.fmlsAssessmentDueContemplatedYn,
    this.fmlsAssociationRentRestrictionsYn,
    this.fmlsAssumableYn,
    this.fmlsAvailabilitytoReceiveOffers,
    this.fmlsBuyerOfficePresentOffersYn,
    this.fmlsCurrentPrice,
    this.fmlsDpryn,
    this.fmlsDistrict,
    this.fmlsDock,
    this.fmlsInitiationFee,
    this.fmlsLandLot,
    this.fmlsListFirmMlsId,
    this.fmlsManagementCompany,
    this.fmlsManagementCompanyEmail,
    this.fmlsManagementPhone,
    this.fmlsMatrixTesting,
    this.fmlsOpenHouseCount,
    this.fmlsOwnerFinancingYn,
    this.fmlsOwnerSecondYn,
    this.fmlsPlatBook,
    this.fmlsPlatPage,
    this.fmlsSchoolBusRouteElemYn,
    this.fmlsSchoolBusRouteHighYn,
    this.fmlsSchoolBusRouteMiddleYn,
    this.fmlsSectionGmd,
    this.fmlsSpecialCircumstances,
    this.fmlsVirtualTourUrlUnbranded2,
    this.fencing,
    this.fireplaceFeatures,
    this.fireplacesTotal,
    this.flooring,
    this.foundationDetails,
    this.garageSpaces,
    this.greenEnergyEfficient,
    this.greenEnergyGeneration,
    this.habitableResidenceYn,
    this.heating,
    this.highSchool,
    this.homeWarrantyYn,
    this.horseAmenities,
    this.interiorFeatures,
    this.internetAddressDisplayYn,
    this.internetAutomatedValuationDisplayYn,
    this.internetConsumerCommentYn,
    this.internetEntireListingDisplayYn,
    this.landLeaseYn,
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
    this.lotSizeAcres,
    this.lotSizeDimensions,
    this.lotSizeSource,
    this.mainLevelBathrooms,
    this.mainLevelBedrooms,
    this.majorChangeTimestamp,
    this.majorChangeType,
    this.middleOrJuniorSchool,
    this.mlsStatus,
    this.modificationTimestamp,
    this.occupantType,
    this.onMarketDate,
    this.openParkingYn,
    this.originalListPrice,
    this.originatingSystemId,
    this.originatingSystemKey,
    this.originatingSystemName,
    this.otherEquipment,
    this.otherStructures,
    this.parkingFeatures,
    this.parkingTotal,
    this.patioAndPorchFeatures,
    this.photosChangeTimestamp,
    this.photosCount,
    this.poolFeatures,
    this.poolPrivateYn,
    this.possession,
    this.postalCode,
    this.privateRemarks,
    this.propertyAttachedYn,
    this.propertyCondition,
    this.propertySubType,
    this.propertyType,
    this.publicRemarks,
    this.roadFrontageType,
    this.roadSurfaceType,
    this.roof,
    this.roomBedroomFeatures,
    this.roomDiningRoomFeatures,
    this.roomKitchenFeatures,
    this.roomMasterBathroomFeatures,
    this.roomType,
    this.securityFeatures,
    this.sewer,
    this.showingContactName,
    this.showingContactPhone,
    this.showingRequirements,
    this.sourceSystemKey,
    this.spaFeatures,
    this.specialListingConditions,
    this.standardStatus,
    this.stateOrProvince,
    this.statusChangeTimestamp,
    this.streetDirSuffix,
    this.streetName,
    this.streetNumber,
    this.streetNumberNumeric,
    this.streetSuffix,
    this.subdivisionName,
    this.taxAnnualAmount,
    this.taxBlock,
    this.taxLegalDescription,
    this.taxLot,
    this.taxParcelLetter,
    this.taxYear,
    this.unparsedAddress,
    this.utilities,
    this.view,
    this.waterBodyName,
    this.waterSource,
    this.waterfrontFeatures,
    this.windowFeatures,
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
        associationFeeFrequency: json["AssociationFeeFrequency"],
        associationFeeIncludes: json["AssociationFeeIncludes"] == null
            ? []
            : List<String>.from(json["AssociationFeeIncludes"]!.map((x) => x)),
        associationYn: json["AssociationYN"],
        basement: json["Basement"] == null
            ? []
            : List<String>.from(json["Basement"]!.map((x) => x)),
        bathroomsFull: json["BathroomsFull"],
        bathroomsHalf: json["BathroomsHalf"],
        bathroomsTotalDecimal: json["BathroomsTotalDecimal"],
        bathroomsTotalInteger: json["BathroomsTotalInteger"],
        bedroomsTotal: json["BedroomsTotal"],
        bridgeModificationTimestamp: json["BridgeModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["BridgeModificationTimestamp"]),
        builderName: json["BuilderName"],
        buildingAreaSource: json["BuildingAreaSource"],
        buildingAreaTotal: json["BuildingAreaTotal"],
        buyerAgencyCompensation: json["BuyerAgencyCompensation"],
        buyerAgencyCompensationType: json["BuyerAgencyCompensationType"],
        city: json["City"],
        commonWalls: json["CommonWalls"] == null
            ? []
            : List<String>.from(json["CommonWalls"]!.map((x) => x)),
        communityFeatures: json["CommunityFeatures"] == null
            ? []
            : List<String>.from(json["CommunityFeatures"]!.map((x) => x)),
        constructionMaterials: json["ConstructionMaterials"] == null
            ? []
            : List<String>.from(json["ConstructionMaterials"]!.map((x) => x)),
        cooling: json["Cooling"] == null
            ? []
            : List<String>.from(json["Cooling"]!.map((x) => x)),
        coordinates: json["Coordinates"] == null
            ? []
            : List<double>.from(json["Coordinates"]!.map((x) => x?.toDouble())),
        country: json["Country"],
        countyOrParish: json["CountyOrParish"],
        cumulativeDaysOnMarket: json["CumulativeDaysOnMarket"],
        daysOnMarket: json["DaysOnMarket"],
        directions: json["Directions"],
        dualVariableCompensationYn: json["DualVariableCompensationYN"],
        electric: json["Electric"] == null
            ? []
            : List<String>.from(json["Electric"]!.map((x) => x)),
        elementarySchool: json["ElementarySchool"],
        exteriorFeatures: json["ExteriorFeatures"] == null
            ? []
            : List<String>.from(json["ExteriorFeatures"]!.map((x) => x)),
        fmlsActiveOpenHouseCount: json["FMLS_ActiveOpenHouseCount"],
        fmlsAssessmentDueContemplatedYn:
            json["FMLS_AssessmentDueContemplatedYN"],
        fmlsAssociationRentRestrictionsYn:
            json["FMLS_AssociationRentRestrictionsYN"],
        fmlsAssumableYn: json["FMLS_AssumableYN"],
        fmlsAvailabilitytoReceiveOffers:
            json["FMLS_AvailabilitytoReceiveOffers"],
        fmlsBuyerOfficePresentOffersYn: json["FMLS_BuyerOfficePresentOffersYN"],
        fmlsCurrentPrice: json["FMLS_CurrentPrice"],
        fmlsDpryn: json["FMLS_DPRYN"],
        fmlsDistrict: json["FMLS_District"],
        fmlsDock: json["FMLS_Dock"] == null
            ? []
            : List<String>.from(json["FMLS_Dock"]!.map((x) => x)),
        fmlsInitiationFee: json["FMLS_InitiationFee"],
        fmlsLandLot: json["FMLS_LandLot"],
        fmlsListFirmMlsId: json["FMLS_ListFirmMlsId"],
        fmlsManagementCompany: json["FMLS_ManagementCompany"],
        fmlsManagementCompanyEmail: json["FMLS_ManagementCompanyEmail"],
        fmlsManagementPhone: json["FMLS_ManagementPhone"],
        fmlsMatrixTesting: json["FMLS_MatrixTesting"],
        fmlsOpenHouseCount: json["FMLS_OpenHouseCount"],
        fmlsOwnerFinancingYn: json["FMLS_OwnerFinancingYN"],
        fmlsOwnerSecondYn: json["FMLS_OwnerSecondYN"],
        fmlsPlatBook: json["FMLS_PlatBook"],
        fmlsPlatPage: json["FMLS_PlatPage"],
        fmlsSchoolBusRouteElemYn: json["FMLS_SchoolBusRouteElemYN"],
        fmlsSchoolBusRouteHighYn: json["FMLS_SchoolBusRouteHighYN"],
        fmlsSchoolBusRouteMiddleYn: json["FMLS_SchoolBusRouteMiddleYN"],
        fmlsSectionGmd: json["FMLS_SectionGMD"],
        fmlsSpecialCircumstances: json["FMLS_SpecialCircumstances"] == null
            ? []
            : List<String>.from(
                json["FMLS_SpecialCircumstances"]!.map((x) => x)),
        fmlsVirtualTourUrlUnbranded2: json["FMLS_VirtualTourURLUnbranded2"],
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
        foundationDetails: json["FoundationDetails"] == null
            ? []
            : List<String>.from(json["FoundationDetails"]!.map((x) => x)),
        garageSpaces: json["GarageSpaces"],
        greenEnergyEfficient: json["GreenEnergyEfficient"] == null
            ? []
            : List<String>.from(json["GreenEnergyEfficient"]!.map((x) => x)),
        greenEnergyGeneration: json["GreenEnergyGeneration"] == null
            ? []
            : List<String>.from(json["GreenEnergyGeneration"]!.map((x) => x)),
        habitableResidenceYn: json["HabitableResidenceYN"],
        heating: json["Heating"] == null
            ? []
            : List<String>.from(json["Heating"]!.map((x) => x)),
        highSchool: json["HighSchool"],
        homeWarrantyYn: json["HomeWarrantyYN"],
        horseAmenities: json["HorseAmenities"] == null
            ? []
            : List<String>.from(json["HorseAmenities"]!.map((x) => x)),
        interiorFeatures: json["InteriorFeatures"] == null
            ? []
            : List<String>.from(json["InteriorFeatures"]!.map((x) => x)),
        internetAddressDisplayYn: json["InternetAddressDisplayYN"],
        internetAutomatedValuationDisplayYn:
            json["InternetAutomatedValuationDisplayYN"],
        internetConsumerCommentYn: json["InternetConsumerCommentYN"],
        internetEntireListingDisplayYn: json["InternetEntireListingDisplayYN"],
        landLeaseYn: json["LandLeaseYN"],
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
        lotSizeAcres: json["LotSizeAcres"],
        lotSizeDimensions: json["LotSizeDimensions"],
        lotSizeSource: json["LotSizeSource"],
        mainLevelBathrooms: json["MainLevelBathrooms"],
        mainLevelBedrooms: json["MainLevelBedrooms"],
        majorChangeTimestamp: json["MajorChangeTimestamp"] == null
            ? null
            : DateTime.parse(json["MajorChangeTimestamp"]),
        majorChangeType: json["MajorChangeType"],
        middleOrJuniorSchool: json["MiddleOrJuniorSchool"],
        mlsStatus: json["MlsStatus"],
        modificationTimestamp: json["ModificationTimestamp"] == null
            ? null
            : DateTime.parse(json["ModificationTimestamp"]),
        occupantType: json["OccupantType"],
        onMarketDate: json["OnMarketDate"] == null
            ? null
            : DateTime.parse(json["OnMarketDate"]),
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
        parkingFeatures: json["ParkingFeatures"] == null
            ? []
            : List<String>.from(json["ParkingFeatures"]!.map((x) => x)),
        parkingTotal: json["ParkingTotal"],
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
        possession: json["Possession"] == null
            ? []
            : List<String>.from(json["Possession"]!.map((x) => x)),
        postalCode: json["PostalCode"],
        privateRemarks: json["PrivateRemarks"],
        propertyAttachedYn: json["PropertyAttachedYN"],
        propertyCondition: json["PropertyCondition"] == null
            ? []
            : List<String>.from(json["PropertyCondition"]!.map((x) => x)),
        propertySubType: json["PropertySubType"],
        propertyType: propertyTypeValues.map[json["PropertyType"]],
        publicRemarks: json["PublicRemarks"],
        roadFrontageType: json["RoadFrontageType"] == null
            ? []
            : List<String>.from(json["RoadFrontageType"]!.map((x) => x)),
        roadSurfaceType: json["RoadSurfaceType"] == null
            ? []
            : List<String>.from(json["RoadSurfaceType"]!.map((x) => x)),
        roof: json["Roof"] == null
            ? []
            : List<String>.from(json["Roof"]!.map((x) => x)),
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
        showingContactName: json["ShowingContactName"],
        showingContactPhone: json["ShowingContactPhone"],
        showingRequirements: json["ShowingRequirements"] == null
            ? []
            : List<String>.from(json["ShowingRequirements"]!.map((x) => x)),
        sourceSystemKey: json["SourceSystemKey"],
        spaFeatures: json["SpaFeatures"] == null
            ? []
            : List<String>.from(json["SpaFeatures"]!.map((x) => x)),
        specialListingConditions: json["SpecialListingConditions"] == null
            ? []
            : List<String>.from(
                json["SpecialListingConditions"]!.map((x) => x)),
        standardStatus: json["StandardStatus"],
        stateOrProvince: json["StateOrProvince"],
        statusChangeTimestamp: json["StatusChangeTimestamp"] == null
            ? null
            : DateTime.parse(json["StatusChangeTimestamp"]),
        streetDirSuffix: json["StreetDirSuffix"],
        streetName: json["StreetName"],
        streetNumber: json["StreetNumber"],
        streetNumberNumeric: json["StreetNumberNumeric"],
        streetSuffix: json["StreetSuffix"],
        subdivisionName: json["SubdivisionName"],
        taxAnnualAmount: json["TaxAnnualAmount"],
        taxBlock: json["TaxBlock"],
        taxLegalDescription: json["TaxLegalDescription"],
        taxLot: json["TaxLot"],
        taxParcelLetter: json["TaxParcelLetter"],
        taxYear: json["TaxYear"],
        unparsedAddress: json["UnparsedAddress"],
        utilities: json["Utilities"] == null
            ? []
            : List<String>.from(json["Utilities"]!.map((x) => x)),
        view: json["View"] == null
            ? []
            : List<String>.from(json["View"]!.map((x) => x)),
        waterBodyName: json["WaterBodyName"],
        waterSource: json["WaterSource"] == null
            ? []
            : List<String>.from(json["WaterSource"]!.map((x) => x)),
        waterfrontFeatures: json["WaterfrontFeatures"] == null
            ? []
            : List<String>.from(json["WaterfrontFeatures"]!.map((x) => x)),
        windowFeatures: json["WindowFeatures"] == null
            ? []
            : List<String>.from(json["WindowFeatures"]!.map((x) => x)),
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
            : List<dynamic>.from(
                json["MediaResourceRecordKey"]!.map((x) => keyValues.map[x])),
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
        "AssociationFeeFrequency": associationFeeFrequency,
        "AssociationFeeIncludes": associationFeeIncludes == null
            ? []
            : List<dynamic>.from(associationFeeIncludes!.map((x) => x)),
        "AssociationYN": associationYn,
        "Basement":
            basement == null ? [] : List<dynamic>.from(basement!.map((x) => x)),
        "BathroomsFull": bathroomsFull,
        "BathroomsHalf": bathroomsHalf,
        "BathroomsTotalDecimal": bathroomsTotalDecimal,
        "BathroomsTotalInteger": bathroomsTotalInteger,
        "BedroomsTotal": bedroomsTotal,
        "BridgeModificationTimestamp":
            bridgeModificationTimestamp?.toIso8601String(),
        "BuilderName": builderName,
        "BuildingAreaSource": buildingAreaSource,
        "BuildingAreaTotal": buildingAreaTotal,
        "BuyerAgencyCompensation": buyerAgencyCompensation,
        "BuyerAgencyCompensationType": buyerAgencyCompensationType,
        "City": city,
        "CommonWalls": commonWalls == null
            ? []
            : List<dynamic>.from(commonWalls!.map((x) => x)),
        "CommunityFeatures": communityFeatures == null
            ? []
            : List<dynamic>.from(communityFeatures!.map((x) => x)),
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
        "Electric":
            electric == null ? [] : List<dynamic>.from(electric!.map((x) => x)),
        "ElementarySchool": elementarySchool,
        "ExteriorFeatures": exteriorFeatures == null
            ? []
            : List<dynamic>.from(exteriorFeatures!.map((x) => x)),
        "FMLS_ActiveOpenHouseCount": fmlsActiveOpenHouseCount,
        "FMLS_AssessmentDueContemplatedYN": fmlsAssessmentDueContemplatedYn,
        "FMLS_AssociationRentRestrictionsYN": fmlsAssociationRentRestrictionsYn,
        "FMLS_AssumableYN": fmlsAssumableYn,
        "FMLS_AvailabilitytoReceiveOffers": fmlsAvailabilitytoReceiveOffers,
        "FMLS_BuyerOfficePresentOffersYN": fmlsBuyerOfficePresentOffersYn,
        "FMLS_CurrentPrice": fmlsCurrentPrice,
        "FMLS_DPRYN": fmlsDpryn,
        "FMLS_District": fmlsDistrict,
        "FMLS_Dock":
            fmlsDock == null ? [] : List<dynamic>.from(fmlsDock!.map((x) => x)),
        "FMLS_InitiationFee": fmlsInitiationFee,
        "FMLS_LandLot": fmlsLandLot,
        "FMLS_ListFirmMlsId": fmlsListFirmMlsId,
        "FMLS_ManagementCompany": fmlsManagementCompany,
        "FMLS_ManagementCompanyEmail": fmlsManagementCompanyEmail,
        "FMLS_ManagementPhone": fmlsManagementPhone,
        "FMLS_MatrixTesting": fmlsMatrixTesting,
        "FMLS_OpenHouseCount": fmlsOpenHouseCount,
        "FMLS_OwnerFinancingYN": fmlsOwnerFinancingYn,
        "FMLS_OwnerSecondYN": fmlsOwnerSecondYn,
        "FMLS_PlatBook": fmlsPlatBook,
        "FMLS_PlatPage": fmlsPlatPage,
        "FMLS_SchoolBusRouteElemYN": fmlsSchoolBusRouteElemYn,
        "FMLS_SchoolBusRouteHighYN": fmlsSchoolBusRouteHighYn,
        "FMLS_SchoolBusRouteMiddleYN": fmlsSchoolBusRouteMiddleYn,
        "FMLS_SectionGMD": fmlsSectionGmd,
        "FMLS_SpecialCircumstances": fmlsSpecialCircumstances == null
            ? []
            : List<dynamic>.from(fmlsSpecialCircumstances!.map((x) => x)),
        "FMLS_VirtualTourURLUnbranded2": fmlsVirtualTourUrlUnbranded2,
        "Fencing":
            fencing == null ? [] : List<dynamic>.from(fencing!.map((x) => x)),
        "FireplaceFeatures": fireplaceFeatures == null
            ? []
            : List<dynamic>.from(fireplaceFeatures!.map((x) => x)),
        "FireplacesTotal": fireplacesTotal,
        "Flooring":
            flooring == null ? [] : List<dynamic>.from(flooring!.map((x) => x)),
        "FoundationDetails": foundationDetails == null
            ? []
            : List<dynamic>.from(foundationDetails!.map((x) => x)),
        "GarageSpaces": garageSpaces,
        "GreenEnergyEfficient": greenEnergyEfficient == null
            ? []
            : List<dynamic>.from(greenEnergyEfficient!.map((x) => x)),
        "GreenEnergyGeneration": greenEnergyGeneration == null
            ? []
            : List<dynamic>.from(greenEnergyGeneration!.map((x) => x)),
        "HabitableResidenceYN": habitableResidenceYn,
        "Heating":
            heating == null ? [] : List<dynamic>.from(heating!.map((x) => x)),
        "HighSchool": highSchool,
        "HomeWarrantyYN": homeWarrantyYn,
        "HorseAmenities": horseAmenities == null
            ? []
            : List<dynamic>.from(horseAmenities!.map((x) => x)),
        "InteriorFeatures": interiorFeatures == null
            ? []
            : List<dynamic>.from(interiorFeatures!.map((x) => x)),
        "InternetAddressDisplayYN": internetAddressDisplayYn,
        "InternetAutomatedValuationDisplayYN":
            internetAutomatedValuationDisplayYn,
        "InternetConsumerCommentYN": internetConsumerCommentYn,
        "InternetEntireListingDisplayYN": internetEntireListingDisplayYn,
        "LandLeaseYN": landLeaseYn,
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
        "LotSizeAcres": lotSizeAcres,
        "LotSizeDimensions": lotSizeDimensions,
        "LotSizeSource": lotSizeSource,
        "MainLevelBathrooms": mainLevelBathrooms,
        "MainLevelBedrooms": mainLevelBedrooms,
        "MajorChangeTimestamp": majorChangeTimestamp?.toIso8601String(),
        "MajorChangeType": majorChangeType,
        "MiddleOrJuniorSchool": middleOrJuniorSchool,
        "MlsStatus": mlsStatus,
        "ModificationTimestamp": modificationTimestamp?.toIso8601String(),
        "OccupantType": occupantType,
        "OnMarketDate":
            "${onMarketDate!.year.toString().padLeft(4, '0')}-${onMarketDate!.month.toString().padLeft(2, '0')}-${onMarketDate!.day.toString().padLeft(2, '0')}",
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
        "ParkingFeatures": parkingFeatures == null
            ? []
            : List<dynamic>.from(parkingFeatures!.map((x) => x)),
        "ParkingTotal": parkingTotal,
        "PatioAndPorchFeatures": patioAndPorchFeatures == null
            ? []
            : List<dynamic>.from(patioAndPorchFeatures!.map((x) => x)),
        "PhotosChangeTimestamp": photosChangeTimestamp?.toIso8601String(),
        "PhotosCount": photosCount,
        "PoolFeatures": poolFeatures == null
            ? []
            : List<dynamic>.from(poolFeatures!.map((x) => x)),
        "PoolPrivateYN": poolPrivateYn,
        "Possession": possession == null
            ? []
            : List<dynamic>.from(possession!.map((x) => x)),
        "PostalCode": postalCode,
        "PrivateRemarks": privateRemarks,
        "PropertyAttachedYN": propertyAttachedYn,
        "PropertyCondition": propertyCondition == null
            ? []
            : List<dynamic>.from(propertyCondition!.map((x) => x)),
        "PropertySubType": propertySubType,
        "PropertyType": propertyTypeValues.reverse[propertyType],
        "PublicRemarks": publicRemarks,
        "RoadFrontageType": roadFrontageType == null
            ? []
            : List<dynamic>.from(roadFrontageType!.map((x) => x)),
        "RoadSurfaceType": roadSurfaceType == null
            ? []
            : List<dynamic>.from(roadSurfaceType!.map((x) => x)),
        "Roof": roof == null ? [] : List<dynamic>.from(roof!.map((x) => x)),
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
        "ShowingContactName": showingContactName,
        "ShowingContactPhone": showingContactPhone,
        "ShowingRequirements": showingRequirements == null
            ? []
            : List<dynamic>.from(showingRequirements!.map((x) => x)),
        "SourceSystemKey": sourceSystemKey,
        "SpaFeatures": spaFeatures == null
            ? []
            : List<dynamic>.from(spaFeatures!.map((x) => x)),
        "SpecialListingConditions": specialListingConditions == null
            ? []
            : List<dynamic>.from(specialListingConditions!.map((x) => x)),
        "StandardStatus": standardStatus,
        "StateOrProvince": stateOrProvince,
        "StatusChangeTimestamp": statusChangeTimestamp?.toIso8601String(),
        "StreetDirSuffix": streetDirSuffix,
        "StreetName": streetName,
        "StreetNumber": streetNumber,
        "StreetNumberNumeric": streetNumberNumeric,
        "StreetSuffix": streetSuffix,
        "SubdivisionName": subdivisionName,
        "TaxAnnualAmount": taxAnnualAmount,
        "TaxBlock": taxBlock,
        "TaxLegalDescription": taxLegalDescription,
        "TaxLot": taxLot,
        "TaxParcelLetter": taxParcelLetter,
        "TaxYear": taxYear,
        "UnparsedAddress": unparsedAddress,
        "Utilities": utilities == null
            ? []
            : List<dynamic>.from(utilities!.map((x) => x)),
        "View": view == null ? [] : List<dynamic>.from(view!.map((x) => x)),
        "WaterBodyName": waterBodyName,
        "WaterSource": waterSource == null
            ? []
            : List<dynamic>.from(waterSource!.map((x) => x)),
        "WaterfrontFeatures": waterfrontFeatures == null
            ? []
            : List<dynamic>.from(waterfrontFeatures!.map((x) => x)),
        "WindowFeatures": windowFeatures == null
            ? []
            : List<dynamic>.from(windowFeatures!.map((x) => x)),
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

enum Key { EC8_FACB53_E060634_A498959_AE61769_A9 }

final keyValues = EnumValues({
  "ec8facb53e060634a498959ae61769a9": Key.EC8_FACB53_E060634_A498959_AE61769_A9
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
