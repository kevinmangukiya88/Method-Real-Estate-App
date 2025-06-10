import 'package:agentapp/utils/constants.dart';

List<Map<String, dynamic>> introImages = [
  {
    'image': 'assets/images/ic_onboarding1.png',
    'title': 'Sharing Information',
    'description':
        'Share interesting and useful\ninformation for Sobat Jejalin.',
  },
  {
    'image': 'assets/images/ic_onboarding2.png',
    'title': 'BerJejalin',
    'description': 'Connect with fellow Buddies\naround the world.',
  },
  {
    'image': 'assets/images/ic_onboarding3.png',
    'title': 'And many more!',
    'description': 'Enjoy plenty of our exciting features.',
  }
];

List<Map<String, dynamic>> profileSettings = [
  {
    'title': 'Notifications',
    'route': '',
  },
  {
    'title': 'Saved Searches',
    'route': '',
  },
  {
    'title': 'Change Password',
    'route': NamedRoutes.routeChangePassword,
  },
  {
    'title': 'Allow Location Access',
    'route': '',
  },
];

List<Map<String, dynamic>> methodMenu = [
  {
    'title': 'Search Property',
    'route': '',
  },
  {
    'title': 'Leads',
    'route': NamedRoutes.leadActivityScreen,
  },
  {
    'title': 'Transactions',
    'route': NamedRoutes.transactionScreen,
  },
  {
    'title': 'Payments',
    'route': NamedRoutes.paymentScreen,
  },
  {
    'title': 'Agent Lookup',
    'route': NamedRoutes.agentLoopUp,
  },
  {
    'title': 'Knowledgebase',
    'route': NamedRoutes.knowledgebase,
  },
];
