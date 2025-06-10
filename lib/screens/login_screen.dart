import 'dart:convert';
import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/models/user_token_model.dart';
import 'package:agentapp/utils/app_preferences.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/generic_api_response.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/utils/validate_input.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:agentapp/viewModel/get_single_propety_view_model.dart';
import 'package:agentapp/viewModel/store_payment_data.dart';
import 'package:agentapp/viewModel/update_device_token_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var proceededToLogin = false.obs;
  var emailValidated = false.obs;
  var passwordValidated = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  UpdateDeviceTokenViewModel _updateWebPushTokenViewModel =
      Get.put(UpdateDeviceTokenViewModel());

  late APIController apiController;
  GetSinglePropertyViewModel _getSinglePropertyViewModel =
      Get.put(GetSinglePropertyViewModel());
  final List<Map<String, dynamic>> data = [];
  @override
  void initState() {
    super.initState();
    apiController = Get.put(APIController(), tag: NamedRoutes.routeLogin);

    apiController.baseModel.listen((baseModel) {
      if (baseModel.status == 200) {
        var tokenInformation = UserTokenModel.fromMap(baseModel.data);
        globalPreferences?.setString(AppPreferences.USER_MODEL,
            jsonEncode(tokenInformation.userDetails?.toJson()));
        globalPreferences?.setString(
            AppPreferences.ID_USER, '${tokenInformation.userDetails?.id}');
        for (int i = 0; i < tokenInformation.userDetails!.events!.length; i++) {
          globalPreferences?.setString(AppPreferences.RECENTLY_VIEW, '');
          final vr = {
            'id':
                '${tokenInformation.userDetails!.events![i].property!.mlsNumber}',
            'street':
                '${tokenInformation.userDetails!.events![i].property!.street}',
            'city':
                '${tokenInformation.userDetails!.events![i].property!.city}',
            'state':
                '${tokenInformation.userDetails!.events![i].property!.state}',
            'code':
                '${tokenInformation.userDetails!.events![i].property!.code}',
            'url': '${tokenInformation.userDetails!.events![i].property!.url}',
          };
          data.add(vr);
        }
        globalPreferences?.setString(
            AppPreferences.RECENTLY_VIEW, '${json.encode(data)}');

        globalPreferences?.setString(
            AppPreferences.TOKEN, '${tokenInformation.token}');
        globalPreferences?.setString(AppPreferences.MARKET_ID,
            '${tokenInformation.userDetails!.market!.id}');
        globalPreferences?.setString(
            AppPreferences.MSL_ID, '${tokenInformation.userDetails!.fmlsId}');

        for (int i = 0; i < tokenInformation.userDetails!.events!.length; i++) {
          listingData.listingId
              .add(tokenInformation.userDetails!.events![i].id.toString());
        }

        _getSinglePropertyViewModel.getEventData();
        _updateWebPushTokenViewModel.updateDeviceTokenViewModel();
        Get.toNamed(NamedRoutes.routeHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      body: getBody(size),
    );
  }

  getBody(Size size) {
    return Stack(
      children: [
        MyCustomScrollBar(
          child: Container(
            width: size.width,
            height: size.height,
            padding: EdgeInsets.only(left: 20),
            child: SafeArea(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/ic_app_logo_variation1.png',
                      ),
                      verticalSpace(height: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Obx(() {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                  visible: !(proceededToLogin.value),
                                  child: RichText(
                                    text: TextSpan(
                                      text: 'method: ',
                                      style: boldWhiteText14(accentColor),
                                      children: [
                                        TextSpan(
                                          text:
                                              '(noun)  a procedure, technique, or way of doing something in order to ensure the desired outcome.',
                                          style:
                                              regularWhiteText14(accentColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Visibility(
                                      visible: proceededToLogin.value,
                                      child: SweetButton(
                                        onPressed: () {
                                          proceededToLogin.value = false;
                                        },
                                        child: Text(
                                          emailController.text,
                                          style: boldWhiteText24(accentColor),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Visibility(
                                      visible: !(proceededToLogin.value),
                                      child: Column(
                                        children: [
                                          MyTextField(
                                            controller: emailController,
                                            textLength: 40,
                                            keyboardType:
                                                TextInputType.emailAddress,
                                            hint: 'Email address',
                                            onChanged: (input) {
                                              emailValidated.value =
                                                  ValidateInput.email(input);
                                            },
                                          ),
                                          verticalSpace(height: 20),
                                          SweetButton(
                                            onPressed: () {
                                              if (emailValidated.value) {
                                                proceededToLogin.value = true;
                                              }
                                            },
                                            child: Container(
                                              decoration:
                                                  rectangularAppBarBoxDecorationWithRadiusElevation(
                                                      40, 4),
                                              child: CustomizedButton(
                                                text: 'Continue',
                                                verticalPadding: 20,
                                                textColor:
                                                    (emailValidated.value)
                                                        ? textColor
                                                        : disabledTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: proceededToLogin.value,
                                      child: Column(
                                        children: [
                                          MyTextField(
                                            controller: passwordController,
                                            textLength: 40,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            obscureText: true,
                                            hint: 'Password',
                                            onChanged: (input) {
                                              passwordValidated.value =
                                                  ValidateInput.password(input);
                                            },
                                          ),
                                          verticalSpace(height: 20),
                                          SweetButton(
                                            onPressed: () {
                                              onTapLogin(context);
                                            },
                                            child: Container(
                                              decoration:
                                                  rectangularAppBarBoxDecorationWithRadiusElevation(
                                                      40, 4),
                                              child: CustomizedButton(
                                                text: 'Log In',
                                                verticalPadding: 20,
                                                textColor:
                                                    (passwordValidated.value)
                                                        ? textColor
                                                        : disabledTextColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    verticalSpace(height: 40),
                                    !proceededToLogin.value
                                        ? RichText(
                                            text: TextSpan(
                                              text: 'New User? ',
                                              style: regularWhiteText14(
                                                  accentColor),
                                              children: [
                                                TextSpan(
                                                  text: 'Create an account',
                                                  style: boldWhiteText14(
                                                      accentColor),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          Get.toNamed(NamedRoutes
                                                              .routeRegister);
                                                        },
                                                ),
                                              ],
                                            ),
                                          )
                                        : Column(
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  proceededToLogin.value =
                                                      false;
                                                },
                                                child: Text(
                                                  "Go Back",
                                                  style: boldWhiteText14(
                                                      accentColor),
                                                ),
                                              ),
                                              verticalSpace(height: 5),
                                              RichText(
                                                text: TextSpan(
                                                  text: 'Forgot Password?  ',
                                                  style: regularWhiteText14(
                                                      accentColor),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Reset Password',
                                                      style: boldWhiteText14(
                                                          accentColor),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              verticalSpace(height: 20),
                                            ],
                                          ),
                                    verticalSpace(height: 40),
                                  ],
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    left: 0,
                    top: 1,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(NamedRoutes.noLoginScreen);
                      },
                      child: Center(
                        child: Image.asset(
                          'assets/images/ic_back.png',
                          height: 36,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        GenericProgressBar(tag: NamedRoutes.routeLogin)
      ],
    );
  }

  void onTapLogin(BuildContext context) {
    if (passwordValidated.value) {
      apiController.webservice.apiCallLogin({
        'email': emailController.text,
        'password': passwordController.text,
        'ios': true,
      }, apiController.isLoading, context).then((value) =>
          GenericAPIResponse.handleAPIResponse(NamedRoutes.routeLogin, value));
    }
  }
}
