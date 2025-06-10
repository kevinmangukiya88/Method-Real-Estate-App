class APIEndpoints {
  //static String BASE_URL = 'https://testv2api.ourmethod.com';
  static String BASE_URL = 'https://api.ourmethod.com';
  static String SIGN_UP = '${BASE_URL}/api/user/sign_up';
  static String LOGIN = '${BASE_URL}/api/users/login';
  static String RECENTLY_ADDED_KNOWLEDGEBASES =
      '${BASE_URL}/api/knowledgebase/get-main-screen-data';
  static String SAVE_VIDEO_PROGRESS =
      '${BASE_URL}/api/knowledgebase/save-video-progress';
  static String CHANGE_PASSWORD = '${BASE_URL}/api/users/change-password';
  static String VERIFY_OTP = '${BASE_URL}/api/verify/check_verification_code';
  static String FORGOT_PASSWORD = '${BASE_URL}/api/user/generate_verifcode';
  static String RECENT_LEADS =
      '/api/leads/events?type=shared_property_via_email,Saved Property,Viewed Property&limit=10&offset=';
  static String SMART_LISTS = '/api/smartlists?limit=10&offset=';
  static String TEXT_MESSAGE_TEMPLATES = '/api/templates/textMessage';
  static String SUGGESTION = '/api/common/suggestions?market_id=';
  static String LEADS_DETAILS = '/api/leads/people/';
  static String GET_LEADS_STATUS = '/api/leadbot/lead-status/';
  static String PDF_LINK = '/api/transactions/signed-url?src=';
  static String LEADS_STAGES = '/api/leads/stages';
  static String UPDATE_LEADS_STAGES = '/api/leads/stages/';
  static String UPDATE_DEVICE_TOKEN = '/api/users/update-device-token';
  static String LEADS_TIMELINE =
      '/api/leads/timelines?sortBy=id&sortOrder=DESC&pageNumber=1&pageSize=25&';
  static String LEADS_APPOINTMENT = '/api/leads/appointments?personId=';
  static String EMAIL_TEMPLATES = '/api/templates';
  static String KNOWLEDGE_SEARCH = '/api/knowledgebase/post/search?search=';
  static String KNOWLEDGE = '/api/knowledgebase/get-main-screen-data';
  static String CLAIM_LEADS = '/api/leadbot/claim-lead';
  static String PAYMENT_RECORDS = '/api/users/payment_records/';
  static String TRANSACTIONS_CONTRACTS = '/api/transactions/contracts?';
  static String CLIENT_LIST = '/api/leads/people';
  static String DRAFT_OFFER = '/api/projects/draft-offer';
  APIEndpoints._();
}

class BridgeAPIEndpoints {
  static String BASE_URL = 'https://api.bridgedataoutput.com/api/v2/OData';
  static String property(String dataset) => '${BASE_URL}/${dataset}/Property?';
  static String RESO_ACCESS_TOKEN = '51cfcd476147e3f0163f78c19afd9c22';
  static String RESO_ACCESS_TOKEN_MIAMIRE = '51cfcd476147e3f0163f78c19afd9c22';
  BridgeAPIEndpoints._();
}

class NamedRoutes {
  static String routeSplash = '/splash';
  static String routeIntro = '/intro';
  static String routeLogin = '/login';
  static String routeRegister = '/register';
  static String routeAdvancedSearch = '/advancedSearch';
  static var routeHome = '/home';
  static var routePropertyDetail = '/propertyDetail';
  static var routeSearchResults = '/searchResults';
  static var routeProfileSettings = '/profileSettings';
  static var routeChangePassword = '/changePassword';
  static var routeMethodMenu = '/methodMenu';
  static var routeVideoPlayer = '/videoPlayer';
  static var knowledgebase = '/knowledgebase';
  static var agentLoopUp = '/agentLoopUp';
  static var leadActivityScreen = '/leadActivityScreen';
  static var leadDetailScreen = '/leadDetailScreen';
  static var transactionScreen = '/transactionScreen';
  static var transactionDetailScreen = '/transactionDetailScreen';
  static var paymentScreen = '/paymentScreen';
  static var paymentDetailScreen = '/paymentDetailScreen';
  static var noLoginScreen = '/noLoginScreen';
  static var bottomSheet = '/bottomSheetScreen';

  NamedRoutes._();
}

class BroadcastEvent {
  static String EVENT_API_ERROR_HANDLING = 'EVENT_API_ERROR_HANDLING';
  static String EVENT_REFRESH_API = 'EVENT_REFRESH_API';

  BroadcastEvent._();
}

enum FilePicker { photo, video }
