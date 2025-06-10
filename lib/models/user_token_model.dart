class UserTokenModel {
  UserDetailsBean? userDetails;
  dynamic token;

  static UserTokenModel fromMap(Map<String, dynamic> map) {
    UserTokenModel userModelBean = UserTokenModel();
    userModelBean.userDetails = UserDetailsBean.fromMap(map['userDetails']??{});
    userModelBean.token = map['token']??'';
    return userModelBean;
  }

  Map toJson() => {
    "userDetails": userDetails,
    "token": token,
  };
}

class UserDetailsBean {
  dynamic id;
  dynamic firstName;
  dynamic lastName;
  dynamic phone;
  dynamic email;
  dynamic fullName;
  dynamic roleId;
  dynamic profileImg;
  dynamic slackTeamId;
  dynamic fmlsId;
  dynamic gamlsId;
  dynamic fubApiKey;
  dynamic slackChannelId;
  Market? market;
  List<EventsBean>? events;

  static UserDetailsBean fromMap(Map<String, dynamic> map) {

    UserDetailsBean userDetailsBean = UserDetailsBean();
    userDetailsBean.id = map['id']??0;
    userDetailsBean.firstName = map['first_name']??'';
    userDetailsBean.lastName = map['last_name']??'';
    userDetailsBean.phone = map['phone']??'';
    userDetailsBean.email = map['email']??'';
    userDetailsBean.fullName = map['full_name']??'';
    userDetailsBean.roleId = map['role_id']??0;
    userDetailsBean.profileImg = map['profile_img']??'';
    userDetailsBean.slackTeamId = map['slack_team_id'];
    userDetailsBean.fmlsId = map['fmls_id'];
    userDetailsBean.gamlsId = map['gamls_id'];
    userDetailsBean.fubApiKey = map['fub_api_key']??'';
    userDetailsBean.slackChannelId = map['slack_channel_id'];
    userDetailsBean.market = Market.fromMap(map['market']??{});
    userDetailsBean.events = ((map['events'] ?? []) as List).map((o) => EventsBean.fromMap(o)).toList();
    return userDetailsBean;
  }

  Map toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "phone": phone,
    "email": email,
    "full_name": fullName,
    "role_id": roleId,
    "profile_img": profileImg,
    "slack_team_id": slackTeamId,
    "fmls_id": fmlsId,
    "gamls_id": gamlsId,
    "fub_api_key": fubApiKey,
    "slack_channel_id": slackChannelId,
    "events": events,
  };
}

class EventsBean {
  int? id;
  String? occured;
  int? userId;
  int? leadPropertyId;
  dynamic message;
  dynamic description;
  dynamic noteId;
  String? source;
  String? type;
  dynamic pageTitle;
  dynamic pageUrl;
  int? pageDuration;
  String? createdAt;
  String? updatedAt;
  PropertyBean? property;

  static EventsBean fromMap(Map<String, dynamic> map) {
    EventsBean eventsBean = EventsBean();
    eventsBean.id = map['id']??0;
    eventsBean.occured = map['occured']??'';
    eventsBean.userId = map['user_id']??0;
    eventsBean.leadPropertyId = map['lead_property_id']??0;
    eventsBean.message = map['message'];
    eventsBean.description = map['description'];
    eventsBean.noteId = map['note_id'];
    eventsBean.source = map['source']??'';
    eventsBean.type = map['type']??'';
    eventsBean.pageTitle = map['pageTitle']??'';
    eventsBean.pageUrl = map['pageUrl']??'';
    eventsBean.pageDuration = map['pageDuration']??0;
    eventsBean.createdAt = map['createdAt']??'';
    eventsBean.updatedAt = map['updatedAt']??'';
    eventsBean.property = PropertyBean.fromMap(map['property']??{});
    return eventsBean;
  }

  Map toJson() => {
    "id": id,
    "occured": occured,
    "user_id": userId,
    "lead_property_id": leadPropertyId,
    "message": message,
    "description": description,
    "note_id": noteId,
    "source": source,
    "type": type,
    "pageTitle": pageTitle,
    "pageUrl": pageUrl,
    "pageDuration": pageDuration,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "property": property,
  };
}

class PropertyBean {
  int? id;
  String? street;
  String? city;
  String? state;
  String? code;
  String? mlsNumber;
  int? price;
  bool? forRent;
  String? url;
  String? type;
  dynamic bedrooms;
  dynamic bathrooms;
  dynamic area;
  dynamic lot;
  dynamic lat;
  dynamic lng;

  static PropertyBean fromMap(Map<String, dynamic> map) {
    PropertyBean propertyBean = PropertyBean();
    propertyBean.id = map['id']??0;
    propertyBean.street = map['street']??'';
    propertyBean.city = map['city']??'';
    propertyBean.state = map['state']??'';
    propertyBean.code = map['code']??'';
    propertyBean.mlsNumber = map['mlsNumber']??'';
    propertyBean.price = map['price']??0;
    propertyBean.forRent = map['forRent']??false;
    propertyBean.url = map['url']??'';
    propertyBean.type = map['type']??'';
    propertyBean.bedrooms = map['bedrooms']??'';
    propertyBean.bathrooms = map['bathrooms']??'';
    propertyBean.area = map['area']??'';
    propertyBean.lot = map['lot'];
    propertyBean.lat = map['lat'];
    propertyBean.lng = map['lng'];
    return propertyBean;
  }

  Map toJson() => {
    "id": id,
    "street": street,
    "city": city,
    "state": state,
    "code": code,
    "mlsNumber": mlsNumber,
    "price": price,
    "forRent": forRent,
    "url": url,
    "type": type,
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "area": area,
    "lot": lot,
    "lat": lat,
    "lng": lng,
  };
}

class Market {
  List<String>? datasets;
  dynamic id;
  dynamic name;

  static Market fromMap(Map<String, dynamic> map) {
    Market testBean = Market();
    testBean.datasets = ((map['datasets'] ?? []) as List).map((o) => o.toString()).toList();
    testBean.id = map['id'] ?? 0;
    testBean.name = map['name'] ?? '';
    return testBean;
  }

  Map toJson() => {
        "datasets": datasets,
        "id": id,
        "name": name,
      };
}