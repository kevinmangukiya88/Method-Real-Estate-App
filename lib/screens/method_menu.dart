import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/json.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class MethodMenu extends StatefulWidget {
  const MethodMenu({Key? key}) : super(key: key);

  @override
  State<MethodMenu> createState() => _MethodMenuState();
}

class _MethodMenuState extends State<MethodMenu> {
  @override
  void initState() {
    super.initState();
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
          verticalSpace(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                MyBackButton(),
                horizontalSpace(),
                Text(
                  '/Main Menu',
                  style: regularWhiteText12(accentColor),
                )
              ],
            ),
          ),
          verticalSpace(height: 20),
          ...List.generate(
            methodMenu.length,
            (index) {
              var menu = methodMenu[index];
              return InkWell(
                onTap: () {
                  if (index == 0) {
                    Get.back();
                  } else {
                    if (isNotEmpty(menu['route'])) {
                      Get.toNamed(menu['route']);
                    }
                  }
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        menu['title'],
                        style: regularWhiteText24(textBlack),
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
        ],
      ),
    );
  }
}
