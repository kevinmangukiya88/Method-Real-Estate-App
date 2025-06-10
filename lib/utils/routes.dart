import 'package:agentapp/screens/advanced_search_screen.dart';
import 'package:agentapp/screens/agent_lookup_screen.dart';
import 'package:agentapp/screens/change_password.dart';
import 'package:agentapp/screens/knowledgebase_screen.dart';
import 'package:agentapp/screens/leads/lead_claim_bottomsheet.dart';
import 'package:agentapp/screens/method_menu.dart';
import 'package:agentapp/screens/no_login_screen.dart';
import 'package:agentapp/screens/payments/payment_detail_screen.dart';
import 'package:agentapp/screens/profile_settings.dart';
import 'package:agentapp/screens/propertyDetail/propery_detail_screen.dart';
import 'package:agentapp/screens/registration_screen.dart';
import 'package:agentapp/screens/video_player_screen.dart';
import 'package:get/get.dart';
import '../screens/home_screen.dart';
import '../screens/leads/lead_activity_screen.dart';
import '../screens/leads/lead_detail_screen.dart';
import '../screens/login_screen.dart';
import '../screens/payments/payment_screen.dart';
import '../screens/searchResults/search_result_screen.dart';
import '../screens/transactions/transaction_detail_screen.dart';
import '../screens/transactions/transactions_screen.dart';
import 'constants.dart';

class Routes {
  static var pages = [
    GetPage(
      name: NamedRoutes.routeLogin,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeRegister,
      page: () => const RegisterationScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeHome,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: NamedRoutes.routePropertyDetail,
      page: () => const PropertyDetailScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeAdvancedSearch,
      page: () => const AdvancedSearchScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeSearchResults,
      page: () => const SearchResultScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeProfileSettings,
      page: () => const ProfileSettings(),
    ),
    GetPage(
      name: NamedRoutes.routeChangePassword,
      page: () => const ChangePassword(),
    ),
    GetPage(
      name: NamedRoutes.routeMethodMenu,
      page: () => const MethodMenu(),
    ),
    GetPage(
      name: NamedRoutes.knowledgebase,
      page: () => const KnowledgebaseScreen(),
    ),
    GetPage(
      name: NamedRoutes.routeVideoPlayer,
      page: () => const VideoPlayerScreen(),
    ),
    GetPage(
      name: NamedRoutes.agentLoopUp,
      page: () => const AgentLookUpScreen(),
    ),
    GetPage(
      name: NamedRoutes.leadActivityScreen,
      page: () => const LeadActivityScreen(),
    ),
    GetPage(
      name: NamedRoutes.leadDetailScreen,
      page: () => const LeadDetailScreen(),
    ),
    GetPage(
      name: NamedRoutes.transactionScreen,
      page: () => const TransactionScreen(),
    ),
    GetPage(
      name: NamedRoutes.transactionDetailScreen,
      page: () => const TransactionDetailScreen(),
    ),
    GetPage(
      name: NamedRoutes.paymentScreen,
      page: () => const PaymentScreen(),
    ),
    GetPage(
      name: NamedRoutes.paymentDetailScreen,
      page: () => const PaymentDetailScreen(),
    ),
    GetPage(
      name: NamedRoutes.noLoginScreen,
      page: () => const NoLoginScreen(),
    ),
    GetPage(
      name: NamedRoutes.bottomSheet,
      page: () => appModalBottomSheet(),
    ),
  ];
}
