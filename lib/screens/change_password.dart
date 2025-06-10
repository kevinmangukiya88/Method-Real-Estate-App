import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/repo/get_advace_search_property_repo.dart';
import 'package:agentapp/screens/propertyDetail/components.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/generic_api_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/validate_input.dart';
import '../utils/widgets.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var curPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  late APIController apiController;

  @override
  void initState() {
    super.initState();
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);

    apiController.baseModel.listen((baseModel) {
      if (baseModel.status == 200) {
        Future.delayed(Duration.zero, () {
          CommonWidget.getSnackBar(context,
              message: 'Password updated Successfully',
              duration: 2,
              colorText: Colors.white,
              color: Colors.black);
          // showToast('Success', 'Password updated successfully', success: true);
        });
        Get.offAllNamed(NamedRoutes.routeHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      appBar: getAppBar(size),
      body: getBody(size),
    );
  }

  getAppBar(Size size) {
    return PreferredSize(
      child: MyAppBar(),
      preferredSize: Size.fromHeight(65),
    );
  }

  getBody(Size size) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 20),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(height: 15),
                  Row(
                    children: [
                      MyBackButton(),
                      horizontalSpace(),
                      Text(
                        '/Settings/Change Password',
                        style: regularWhiteText12(accentColor),
                      )
                    ],
                  ),
                  verticalSpace(height: 20),
                  Text(
                    'Change Password',
                    style: boldWhiteText24(accentColor),
                  ),
                  verticalSpace(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextField(
                          controller: curPasswordController,
                          textLength: 40,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          hint: 'Current Password',
                          onChanged: (input) {},
                        ),
                        verticalSpace(),
                        MyTextField(
                          controller: newPasswordController,
                          textLength: 40,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          hint: 'New Password',
                          onChanged: (input) {},
                        ),
                        verticalSpace(),
                        MyTextField(
                          controller: confirmPasswordController,
                          textLength: 40,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          hint: 'Confirm Password',
                          onChanged: (input) {},
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RectangleButton(
                        text: 'Save Password',
                        onPressed: () {
                          if (validateFields()) {
                            apiController.webservice.apiCallChangePassword({
                              'curr_password': curPasswordController.text,
                              'new_password': newPasswordController.text,
                            }, apiController.isLoading).then((value) {
                              GenericAPIResponse.handleAPIResponse(
                                  NamedRoutes.routeChangePassword, value);
                            });
                          }
                        },
                      ),
                      SizedBox(height: 20.sp),
                      OutlinedButtonWidget(
                        text: 'Cancel',
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GenericProgressBar(tag: NamedRoutes.routeChangePassword)
          ],
        ),
      ),
    );
  }

  bool validateFields() {
    if (isEmpty(curPasswordController.text)) {
      CommonWidget.getSnackBar(context,
          message: 'Please fill current password');
    } else if (isEmpty(newPasswordController.text)) {
      CommonWidget.getSnackBar(context, message: 'Please fill password');
    } else if (!(ValidateInput.password(newPasswordController.text))) {
      CommonWidget.getSnackBar(context,
          message: 'Password must be at least 8 characters long');
    } else if (!(newPasswordController.text ==
        confirmPasswordController.text)) {
      CommonWidget.getSnackBar(context, message: 'Passwords must be same');
      showToast('Error', 'Passwords must be same');
    } else {
      return true;
    }
    return false;
  }
}
