import 'dart:async';

import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/controllers/uiControllers/home_screen_controller.dart';
import 'package:agentapp/controllers/uiControllers/no_login_controller.dart';
import 'package:agentapp/screens/advanced_search_screen.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'searchResults/components.dart';

class NoLoginScreen extends StatefulWidget {
  const NoLoginScreen({Key? key}) : super(key: key);

  @override
  State<NoLoginScreen> createState() => _NoLoginScreenState();
}

class _NoLoginScreenState extends State<NoLoginScreen> {
  late APIController apiController;
  var cameraMoving = false.obs;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  late HomeScreenController homeScreenController;

  bool showList = false;
  NoLoginController noLoginController = Get.put(NoLoginController());
  @override
  void initState() {
    apiController = Get.put(APIController(), tag: NamedRoutes.noLoginScreen);

    super.initState();
  }

  bool advancedSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 20, top: 5),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/ic_method_logo.png',
                    height: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(NamedRoutes.routeLogin);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                      decoration:
                          rectangularCustomColorBoxAndBorderDecorationWithRadius(
                              8, Colors.transparent, accentColor,
                              borderWidth: 1.0),
                      child: Text(
                        'Sign In',
                        style: regularWhiteText14(accentColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: GetBuilder<NoLoginController>(
          builder: (controller) {
            return controller.isAdvance == true
                ? AdvancedSearch(
                    noLogin: controller.isAdvance,
                  )
                : Padding(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.advanced(true);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 2),
                            decoration:
                                rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                    8, Colors.transparent, accentColor,
                                    borderWidth: 1.0),
                            child: Text(
                              'ADVANCED SEARCH',
                              style: regularWhiteText12(accentColor,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Nearby Listings',
                              style: boldWhiteText20(textBlack),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.getShowList();
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 3),
                                decoration: BoxDecoration(
                                  color: textBlack,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Center(
                                    child: Text(
                                  controller.showList == false
                                      ? 'View List'
                                      : 'View Map',
                                  style: regularWhiteText14(textColor,
                                      fontWeight: FontWeight.w600),
                                )),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                              child: controller.showList == false
                                  ? GoogleMap(
                                      mapType: MapType.normal,
                                      myLocationButtonEnabled: false,
                                      initialCameraPosition: CameraPosition(
                                        target: LatLng(37.42796133580664,
                                            -122.085749655962),
                                        zoom: 5,
                                      ),
                                      onCameraMoveStarted: () {
                                        cameraMoving.value = true;
                                      },
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        // _controller.complete(controller);
                                      },
                                    )
                                  : SizedBox()
                              // ListingView(showList: controller.showList),
                              ),
                        )
                      ],
                    ),
                  );
          },
        ));
  }
}
