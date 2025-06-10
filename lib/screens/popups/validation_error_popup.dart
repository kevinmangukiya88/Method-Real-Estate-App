import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/colors.dart';
import '../../utils/decorations.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';
import '../../utils/widgets.dart';

class ValidationErrorPopup extends StatelessWidget {
  final String title, content;
  final bool success;

  const ValidationErrorPopup({
    Key? key,
    required this.content,
    required this.title,
    required this.success,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: rectangularWhiteBoxDecorationWithRadiusElevation(20, 4),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        verticalSpace(height: 40),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Image.asset(
                                success ? 'assets/images/ic_success.png' : 'assets/images/ic_cross_orange.png',
                                height: 56,
                              ),
                              horizontalSpace(),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: boldWhiteText14(errorTextColor),
                                    ),
                                    verticalSpace(height: 5),
                                    Text(
                                      content,
                                      style: regularWhiteText12(errorTextColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        verticalSpace(height: 40),
                      ],
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/images/ic_cross.png',
                              height: 20,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
