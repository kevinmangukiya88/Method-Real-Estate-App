import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PropertyImageScreen extends StatefulWidget {
  final List<String>? image;
  const PropertyImageScreen({Key? key, this.image}) : super(key: key);

  @override
  State<PropertyImageScreen> createState() => _PropertyImageScreenState();
}

class _PropertyImageScreenState extends State<PropertyImageScreen> {
  var carouselController = CarouselController();
  var activeIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    try {
      widget.image!.forEach((element) {
        precacheImage(NetworkImage(element), context);
      });
    } catch (e) {
      // TODO
    }
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: textBlack,
          body: Stack(
            children: [
              InteractiveViewer(
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: PageView.builder(
                    onPageChanged: (val) {
                      activeIndex.value = val;
                    },
                    itemCount: widget.image!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CachedNetworkImage(
                        imageUrl: '${widget.image![index]}',
                        height: Get.height,
                        width: Get.width,
                        fadeInDuration: Duration(seconds: 0),
                        errorWidget: (_, url, error) => PlaceholderWidget(),
                      );
                    },

                    // options: CarouselOptions(
                    //   aspectRatio: 16 / 12,
                    //   viewportFraction: 1,
                    //   autoPlay: false,
                    //   enableInfiniteScroll: false,
                    //   onPageChanged: (index, reason) {
                    //     activeIndex.value = index;
                    //   },
                    // ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Align(
                  alignment: Alignment.center,
                  child: Obx(() {
                    return AnimatedSmoothIndicator(
                      activeIndex: (activeIndex.value % 12),
                      count: widget.image!.length >= 12
                          ? 12
                          : widget.image!.length,
                      effect: WormEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          dotColor: disabledTextColor,
                          activeDotColor: textColor),
                    );
                  }),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
