import '../../utils/utils.dart';

class BaseModel{
  int? status;
  String? code;
  String? message;
  dynamic data;

  static BaseModel fromMap(Map<String, dynamic>? map) {
    if(isNotEmpty(map)){
      BaseModel baseModelBean = BaseModel();
      baseModelBean.data = map!['data'];
      baseModelBean.message = map['message']??'';
      baseModelBean.code = map['code']??'';
      baseModelBean.status = map['status']??0;
      return baseModelBean;
    }else{
      BaseModel baseModelBean = BaseModel();
      baseModelBean.data = null;
      baseModelBean.message = 'Something went wrong';
      baseModelBean.code = '';
      baseModelBean.status = 0;
      return baseModelBean;
    }
  }

  Map<String, dynamic> toJson() => {
    "data": data,
    "message": message,
    "code": code,
    "status": status,
  };
}