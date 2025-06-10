class GetKnowledgeSearchResponseModel {
  int? status;
  List<KnowledgebaseModel>? data;

  GetKnowledgeSearchResponseModel({this.status, this.data});

  GetKnowledgeSearchResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <KnowledgebaseModel>[];
      json['data'].forEach((v) {
        data!.add(new KnowledgebaseModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Data {
//   int? id;
//   String? title;
//   String? body;
//   String? thumbnail;
//   String? videoSrc;
//   String? type;
//   int? categoryId;
//   String? visibility;
//   dynamic courseId;
//   int? duration;
//   int? views;
//   int? authorId;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//
//   Data(
//       {this.id,
//       this.title,
//       this.body,
//       this.thumbnail,
//       this.videoSrc,
//       this.type,
//       this.categoryId,
//       this.visibility,
//       this.courseId,
//       this.duration,
//       this.views,
//       this.authorId,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//     thumbnail = json['thumbnail'];
//     videoSrc = json['video_src'];
//     type = json['type'];
//     categoryId = json['category_id'];
//     visibility = json['visibility'];
//     courseId = json['course_id'];
//     duration = json['duration'];
//     views = json['views'];
//     authorId = json['author_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//     deletedAt = json['deletedAt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['body'] = this.body;
//     data['thumbnail'] = this.thumbnail;
//     data['video_src'] = this.videoSrc;
//     data['type'] = this.type;
//     data['category_id'] = this.categoryId;
//     data['visibility'] = this.visibility;
//     data['course_id'] = this.courseId;
//     data['duration'] = this.duration;
//     data['views'] = this.views;
//     data['author_id'] = this.authorId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     data['deletedAt'] = this.deletedAt;
//     return data;
//   }
// }
class KnowledgebaseModel {
  dynamic id;
  dynamic title;
  dynamic body;
  dynamic thumbnail;
  dynamic videoSrc;
  dynamic type;
  dynamic categoryId;
  dynamic visibility;
  dynamic courseId;
  dynamic duration;
  dynamic views;
  dynamic authorId;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;
  dynamic course;

  KnowledgebaseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    thumbnail = json['thumbnail'];
    videoSrc = json['video_src'];
    type = json['type'];
    categoryId = json['category_id'];
    visibility = json['visibility'];
    courseId = json['course_id'];
    duration = json['duration'];
    views = json['views'];
    authorId = json['author_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    data['thumbnail'] = this.thumbnail;
    data['video_src'] = this.videoSrc;
    data['type'] = this.type;
    data['category_id'] = this.categoryId;
    data['visibility'] = this.visibility;
    data['course_id'] = this.courseId;
    data['duration'] = this.duration;
    data['views'] = this.views;
    data['author_id'] = this.authorId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
