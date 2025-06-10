import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/decorations.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class RegisterationScreen extends StatefulWidget {
  const RegisterationScreen({Key? key}) : super(key: key);

  @override
  State<RegisterationScreen> createState() => _RegisterationScreenState();
}

class _RegisterationScreenState extends State<RegisterationScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      body: getBody(size),
    );
  }

  getBody(Size size) {
    return MyCustomScrollBar(
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(left: 20),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/ic_app_logo_variation1.png',
                    ),
                    verticalSpace(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextField(
                            textLength: 40,
                            keyboardType: TextInputType.text,
                            hint: 'Name',
                          ),
                          verticalSpace(),
                          MyTextField(
                            textLength: 40,
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Email Address',
                          ),
                          verticalSpace(),
                          MyTextField(
                            keyboardType: TextInputType.emailAddress,
                            hint: 'Create Password',
                            obscureText: true,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              SweetButton(
                                onPressed: () {
                                  Get.toNamed(NamedRoutes.routeRegister);
                                },
                                child: Container(
                                  decoration:
                                      rectangularAppBarBoxDecorationWithRadiusElevation(
                                          40, 4),
                                  child: CustomizedButton(
                                    text: 'Sign Up',
                                    verticalPadding: 20,
                                  ),
                                ),
                              ),
                              verticalSpace(height: 40),
                              SweetButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Go Back',
                                  style: boldWhiteText14(accentColor),
                                ),
                              ),
                              verticalSpace(height: 20),
                              Text(
                                'View Privacy Policy',
                                style: boldWhiteText14(accentColor),
                              ),
                              verticalSpace(height: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 1,
                child: MyBackButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
