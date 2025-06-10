// To parse this JSON data, do
//
//     final getPdfLinkResponseModel = getPdfLinkResponseModelFromJson(jsonString);

import 'dart:convert';

GetPdfLinkResponseModel getPdfLinkResponseModelFromJson(String str) =>
    GetPdfLinkResponseModel.fromJson(json.decode(str));

String getPdfLinkResponseModelToJson(GetPdfLinkResponseModel data) =>
    json.encode(data.toJson());

class GetPdfLinkResponseModel {
  int? status;
  String? data;
  String? message;

  GetPdfLinkResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetPdfLinkResponseModel.fromJson(Map<String, dynamic> json) =>
      GetPdfLinkResponseModel(
        status: json["status"],
        data: json["data"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data,
        "message": message,
      };
}
