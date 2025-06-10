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

  static KnowledgebaseModel fromMap(Map<String, dynamic> map) {
    KnowledgebaseModel knowledgebaseModelBean = KnowledgebaseModel();
    knowledgebaseModelBean.id = map['id']??0;
    knowledgebaseModelBean.title = map['title']??'';
    knowledgebaseModelBean.body = map['body']??'';
    knowledgebaseModelBean.thumbnail = map['thumbnail']??'';
    knowledgebaseModelBean.videoSrc = map['video_src']??'';
    knowledgebaseModelBean.type = map['type']??'';
    knowledgebaseModelBean.categoryId = map['category_id']??0;
    knowledgebaseModelBean.visibility = map['visibility']??'';
    knowledgebaseModelBean.courseId = map['course_id'];
    knowledgebaseModelBean.duration = map['duration']??0;
    knowledgebaseModelBean.views = map['views']??0;
    knowledgebaseModelBean.authorId = map['author_id']??0;
    knowledgebaseModelBean.createdAt = map['createdAt']??'';
    knowledgebaseModelBean.updatedAt = map['updatedAt']??'';
    knowledgebaseModelBean.deletedAt = map['deletedAt'];
    knowledgebaseModelBean.course = map['course'];
    return knowledgebaseModelBean;
  }

  Map toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "thumbnail": thumbnail,
    "video_src": videoSrc,
    "type": type,
    "category_id": categoryId,
    "visibility": visibility,
    "course_id": courseId,
    "duration": duration,
    "views": views,
    "author_id": authorId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "deletedAt": deletedAt,
    "course": course,
  };
}