import 'package:agentapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/json.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class ProfileSettings extends StatefulWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  State<ProfileSettings> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  void initState() {
    super.initState();
    // propertyDetailScreenController = Get.put(PropertyDetailScreenController(), tag: NamedRoutes.routePropertyDetail);
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(height: 15),
                Row(
                  children: [
                    MyBackButton(),
                    horizontalSpace(),
                    Text(
                      '/Settings',
                      style: regularWhiteText12(accentColor),
                    )
                  ],
                ),
                verticalSpace(height: 20),
                Text(
                  'Settings',
                  style: boldWhiteText24(accentColor),
                ),
              ],
            ),
          ),
          verticalSpace(height: 15),
          ...List.generate(
            profileSettings.length,
            (index) {
              var setting = profileSettings[index];
              return InkWell(
                onTap: (){
                  if (isNotEmpty(setting['route'])) {
                    Get.toNamed(NamedRoutes.routeChangePassword);
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 25),
                      child: Text(
                        setting['title'],
                        style:regularWhiteText24(textBlack),
                      ),
                    ),
                    Divider(
                      color: accentColor,
                    ),
                  ],
                ),
              );
            },
          ),
          verticalSpace(height: 40),
          RectangleButton(
            text: 'SIGN OUT',
            onPressed: () {
              logoutUser();
            },
          ),

          /// Old Sign Out button
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 40),
          //   child: SweetButton(
          //     onPressed: () {},
          //     child: Container(
          //       decoration:
          //           rectangularAppBarBoxDecorationWithRadiusElevation(40, 4),
          //       child: CustomizedButton(
          //         text: 'SIGN OUT',
          //         verticalPadding: 20,
          //         textColor: textColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
