import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/screens/agentLookup/agent_lookup_detail_screen.dart';
import 'package:agentapp/screens/propertyDetail/components.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/decorations.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class AgentLookUpScreen extends StatefulWidget {
  const AgentLookUpScreen({Key? key}) : super(key: key);

  @override
  State<AgentLookUpScreen> createState() => _AgentLookUpScreenState();
}

class _AgentLookUpScreenState extends State<AgentLookUpScreen> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var licenseNumberController = TextEditingController();

  late APIController apiController;

  @override
  void initState() {
    apiController =
        Get.put(APIController(), tag: NamedRoutes.routeChangePassword);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MyScaffold(
      appBar: getAppBar(size),
      body: SingleChildScrollView(
        child: getBody(size),
      ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(height: 15),
                Row(
                  children: [
                    MyBackButton(),
                    horizontalSpace(),
                    Text(
                      '/Agent/Lookup',
                      style: regularWhiteText12(accentColor),
                    )
                  ],
                ),
                verticalSpace(height: 30),
                Center(
                  child: Text(
                    'Agent Lookup',
                    style: boldWhiteText24(accentColor),
                  ),
                ),
                SizedBox(height: 40.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyTextField(
                        controller: firstNameController,
                        textLength: 40,
                        hint: 'First Name',
                        onChanged: (input) {},
                      ),
                      verticalSpace(),
                      MyTextField(
                        controller: lastNameController,
                        textLength: 40,
                        hint: 'Last Name',
                        onChanged: (input) {},
                      ),
                      SizedBox(height: 30.sp),
                      Center(
                        child: Text(
                          'Or',
                          style: regularWhiteText14(accentColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 30.sp),
                      MyTextField(
                        controller: licenseNumberController,
                        textLength: 40,
                        hint: 'License Number',
                        onChanged: (input) {},
                      ),
                    ],
                  ),
                ),
                verticalSpace(height: 50),
                SweetButton(
                  onPressed: () {
                    if (firstNameController.text.isEmpty &&
                        lastNameController.text.isEmpty &&
                        licenseNumberController.text.isEmpty) {
                      CommonWidget.getSnackBar(context,
                          message: 'Please enter first/last name or license',
                          duration: 2,
                          colorText: Colors.white,
                          color: Colors.black);
                    } else {
                      final url = firstNameController.text.isEmpty &&
                              licenseNumberController.text.isEmpty
                          ? 'MemberLastName:${lastNameController.text.capitalizeFirst}*'
                          : lastNameController.text.isEmpty &&
                                  licenseNumberController.text.isEmpty
                              ? 'MemberFirstName:${firstNameController.text.capitalizeFirst}*'
                              : licenseNumberController.text.isEmpty
                                  ? 'MemberFirstName:${firstNameController.text.capitalizeFirst}* AND MemberLastName:${lastNameController.text.capitalizeFirst}*'
                                  : 'MemberFirstName:${firstNameController.text.capitalizeFirst}* AND MemberLastName:${lastNameController.text.capitalizeFirst}* AND MemberStateLicense:${licenseNumberController.text.capitalizeFirst}';

                      Get.to(AgentLookupDetailScreen(
                        url: url,
                      ));
                      // firstNameController.clear();
                      // lastNameController.clear();
                      // licenseNumberController.clear();
                    }
                  },
                  child: Container(
                    decoration:
                        rectangularAppBarBoxDecorationWithRadiusElevation(
                            40, 4),
                    child: CustomizedButton(
                      text: 'Search Agents',
                      verticalPadding: 15,
                      textColor: textColor,
                    ),
                  ),
                ),
              ],
            ),
            GenericProgressBar(tag: NamedRoutes.routeChangePassword)
          ],
        ),
      ),
    );
  }

  bool validateFields() {
    if (isEmpty(firstNameController.text)) {
      CommonWidget.getSnackBar(context,
          message: 'Please fill first name',
          duration: 2,
          colorText: Colors.white,
          color: Colors.black);
      // showToast('Error', 'Please fill first name');
    } else if (isEmpty(lastNameController.text)) {
      CommonWidget.getSnackBar(context,
          message: 'Please fill last name',
          duration: 2,
          colorText: Colors.white,
          color: Colors.black);
      // showToast('Error', 'Please fill last name');
    } else if (isEmpty(licenseNumberController.text)) {
      CommonWidget.getSnackBar(context,
          message: 'Please fill licence number',
          duration: 2,
          colorText: Colors.white,
          color: Colors.black);
      // showToast('Error', 'Please fill licence number');
    } else {
      return true;
    }

    return false;
  }
}
