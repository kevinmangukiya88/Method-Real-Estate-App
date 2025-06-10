// To parse this JSON data, do
//
//     final getSuggestionResponseModel = getSuggestionResponseModelFromJson(jsonString);

import 'dart:convert';

GetSuggestionResponseModel getSuggestionResponseModelFromJson(String str) =>
    GetSuggestionResponseModel.fromJson(json.decode(str));

String getSuggestionResponseModelToJson(GetSuggestionResponseModel data) =>
    json.encode(data.toJson());

class GetSuggestionResponseModel {
  Schools? schools;
  List<City>? cities;
  List<City>? zipCodes;
  List<PropertyType>? propertyTypes;

  GetSuggestionResponseModel({
    this.schools,
    this.cities,
    this.zipCodes,
    this.propertyTypes,
  });

  factory GetSuggestionResponseModel.fromJson(Map<String, dynamic> json) =>
      GetSuggestionResponseModel(
        schools:
            json["schools"] == null ? null : Schools.fromJson(json["schools"]),
        cities: json["cities"] == null
            ? []
            : List<City>.from(json["cities"]!.map((x) => City.fromJson(x))),
        zipCodes: json["zipCodes"] == null
            ? []
            : List<City>.from(json["zipCodes"]!.map((x) => City.fromJson(x))),
        propertyTypes: json["property_types"] == null
            ? []
            : List<PropertyType>.from(
                json["property_types"]!.map((x) => PropertyType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "schools": schools?.toJson(),
        "cities": cities == null
            ? []
            : List<dynamic>.from(cities!.map((x) => x.toJson())),
        "zipCodes": zipCodes == null
            ? []
            : List<dynamic>.from(zipCodes!.map((x) => x.toJson())),
        "property_types": propertyTypes == null
            ? []
            : List<dynamic>.from(propertyTypes!.map((x) => x.toJson())),
      };
}

class City {
  int? id;
  String? name;

  City({
    this.id,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class PropertyType {
  List<String>? subType;
  int? id;
  String? type;

  PropertyType({
    this.subType,
    this.id,
    this.type,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) => PropertyType(
        subType: json["sub_type"] == null
            ? []
            : List<String>.from(json["sub_type"]!.map((x) => x)),
        id: json["id"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "sub_type":
            subType == null ? [] : List<dynamic>.from(subType!.map((x) => x)),
        "id": id,
        "type": type,
      };
}

class Schools {
  List<School>? highSchool;
  List<School>? middleSchool;
  List<School>? elementarySchool;

  Schools({
    this.highSchool,
    this.middleSchool,
    this.elementarySchool,
  });

  factory Schools.fromJson(Map<String, dynamic> json) => Schools(
        highSchool: json["High School"] == null
            ? []
            : List<School>.from(
                json["High School"]!.map((x) => School.fromJson(x))),
        middleSchool: json["Middle School"] == null
            ? []
            : List<School>.from(
                json["Middle School"]!.map((x) => School.fromJson(x))),
        elementarySchool: json["Elementary School"] == null
            ? []
            : List<School>.from(
                json["Elementary School"]!.map((x) => School.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "High School": highSchool == null
            ? []
            : List<dynamic>.from(highSchool!.map((x) => x.toJson())),
        "Middle School": middleSchool == null
            ? []
            : List<dynamic>.from(middleSchool!.map((x) => x.toJson())),
        "Elementary School": elementarySchool == null
            ? []
            : List<dynamic>.from(elementarySchool!.map((x) => x.toJson())),
      };
}

class School {
  int? id;
  Type? type;
  String? name;

  School({
    this.id,
    this.type,
    this.name,
  });

  factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["id"],
        type: typeValues.map[json["type"]]!,
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": typeValues.reverse[type],
        "name": name,
      };
}

enum Type { ELEMENTARY_SCHOOL, HIGH_SCHOOL, MIDDLE_SCHOOL }

final typeValues = EnumValues({
  "Elementary School": Type.ELEMENTARY_SCHOOL,
  "High School": Type.HIGH_SCHOOL,
  "Middle School": Type.MIDDLE_SCHOOL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
