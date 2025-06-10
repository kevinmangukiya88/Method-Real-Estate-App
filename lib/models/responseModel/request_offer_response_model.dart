// To parse this JSON data, do
//
//     final requestOfferResponseModel = requestOfferResponseModelFromJson(jsonString);

import 'dart:convert';

RequestOfferResponseModel requestOfferResponseModelFromJson(String str) =>
    RequestOfferResponseModel.fromJson(json.decode(str));

String requestOfferResponseModelToJson(RequestOfferResponseModel data) =>
    json.encode(data.toJson());

class RequestOfferResponseModel {
  int? status;
  String? message;

  RequestOfferResponseModel({
    this.status,
    this.message,
  });

  factory RequestOfferResponseModel.fromJson(Map<String, dynamic> json) =>
      RequestOfferResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
