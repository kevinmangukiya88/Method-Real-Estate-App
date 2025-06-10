// To parse this JSON data, do
//
//     final getKnowledgeResponseModel = getKnowledgeResponseModelFromJson(jsonString);

import 'dart:convert';

GetKnowledgeResponseModel getKnowledgeResponseModelFromJson(String str) =>
    GetKnowledgeResponseModel.fromJson(json.decode(str));

String getKnowledgeResponseModelToJson(GetKnowledgeResponseModel data) =>
    json.encode(data.toJson());

class GetKnowledgeResponseModel {
  int? status;
  Data? data;
  String? message;

  GetKnowledgeResponseModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetKnowledgeResponseModel.fromJson(Map<String, dynamic> json) =>
      GetKnowledgeResponseModel(
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  List<RecentlyAdded>? recentlyAdded;
  List<Category>? categories;

  Data({
    this.recentlyAdded,
    this.categories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        recentlyAdded: json["recentlyAdded"] == null
            ? []
            : List<RecentlyAdded>.from(
                json["recentlyAdded"]!.map((x) => RecentlyAdded.fromJson(x))),
        categories: json["categories"] == null
            ? []
            : List<Category>.from(
                json["categories"]!.map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "recentlyAdded": recentlyAdded == null
            ? []
            : List<dynamic>.from(recentlyAdded!.map((x) => x.toJson())),
        "categories": categories == null
            ? []
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
      };
}

class Category {
  int? id;
  String? title;
  List<RecentlyAdded>? posts;

  Category({
    this.id,
    this.title,
    this.posts,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        posts: json["posts"] == null
            ? []
            : List<RecentlyAdded>.from(
                json["posts"]!.map((x) => RecentlyAdded.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class RecentlyAdded {
  int? id;
  String? title;
  String? body;
  String? thumbnail;
  String? videoSrc;
  Type? type;
  int? categoryId;
  Visibility? visibility;
  dynamic courseId;
  int? duration;
  int? views;
  int? authorId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  dynamic course;

  RecentlyAdded({
    this.id,
    this.title,
    this.body,
    this.thumbnail,
    this.videoSrc,
    this.type,
    this.categoryId,
    this.visibility,
    this.courseId,
    this.duration,
    this.views,
    this.authorId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.course,
  });

  factory RecentlyAdded.fromJson(Map<String, dynamic> json) => RecentlyAdded(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        thumbnail: json["thumbnail"],
        videoSrc: json["video_src"],
        type: typeValues.map[json["type"]]!,
        categoryId: json["category_id"],
        visibility: visibilityValues.map[json["visibility"]]!,
        courseId: json["course_id"],
        duration: json["duration"],
        views: json["views"],
        authorId: json["author_id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        course: json["course"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "thumbnail": thumbnail,
        "video_src": videoSrc,
        "type": typeValues.reverse[type],
        "category_id": categoryId,
        "visibility": visibilityValues.reverse[visibility],
        "course_id": courseId,
        "duration": duration,
        "views": views,
        "author_id": authorId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "deletedAt": deletedAt,
        "course": course,
      };
}

enum Type { VIDEO }

final typeValues = EnumValues({"video": Type.VIDEO});

enum Visibility { PUBLISHED }

final visibilityValues = EnumValues({"Published": Visibility.PUBLISHED});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
