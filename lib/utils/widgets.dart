import 'dart:io';
import 'package:agentapp/controllers/uiControllers/home_screen_controller.dart';
import 'package:agentapp/controllers/uiControllers/no_login_controller.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:searchfield/searchfield.dart';
import '../controllers/apiControllers/api_controller.dart';
import 'colors.dart';
import 'decorations.dart';
import 'styles.dart';
import 'utils.dart';

class MyScaffold extends StatelessWidget {
  final Widget? body, drawer, bottomNavigationBar, floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Color backgroundColor;
  final Key? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionLocation;
  final bool extendBodyBehindAppBar, resizeToAvoidBottomInset;

  const MyScaffold({
    Key? key,
    this.body,
    this.drawer,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionLocation,
    this.backgroundColor = Colors.white,
    this.scaffoldKey,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      extendBody: true,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionLocation,
      bottomSheet: Padding(
        padding: EdgeInsets.only(bottom: 0.0),
      ),
    );
  }
}

class CircularAvatar extends StatelessWidget {
  final String imagePath;
  final String isNetworkImage; // network, asset, file
  final double imageSize, imageWidth, imageHeight;
  final bool blendmood;
  final BoxFit? fit;

  const CircularAvatar({
    Key? key,
    required this.imagePath,
    required this.imageSize,
    this.imageWidth = 0.0,
    this.imageHeight = 0.0,
    this.isNetworkImage = 'network',
    this.blendmood = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (imageWidth > 0) ? imageWidth : imageSize,
      height: (imageHeight > 0) ? imageHeight : imageSize,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageSize),
        child: (isNetworkImage == 'network')
            ? GenericCachedNetworkImage(
                imagePath: imagePath,
                blendmood: blendmood,
                fit: fit,
              )
            : (isNetworkImage == 'asset')
                ? Image.asset(imagePath)
                : Image.file(File(imagePath), fit: BoxFit.cover),
      ),
    );
  }
}

class CustomizedTouchEventIconButton extends StatelessWidget {
  final String path;
  final double width;
  final double height;
  final VoidCallback callback;
  var color;

  CustomizedTouchEventIconButton(
      {Key? key,
      required this.path,
      required this.width,
      required this.height,
      this.color = null,
      required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        path,
        width: width,
        height: height,
        color: color,
      ),
      onPressed: callback,
    );
  }
}

class GenericCachedNetworkImage extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit? fit;
  bool? blendmood;

  GenericCachedNetworkImage({
    Key? key,
    required this.imagePath,
    this.width,
    this.height,
    this.blendmood = false,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      colorBlendMode: (blendmood!) ? BlendMode.darken : null,
      color: (blendmood!) ? Colors.black.withOpacity(0.4) : null,
      memCacheWidth: 620,
      memCacheHeight: 620,
      width: width,
      height: height,
      imageUrl: imagePath,
      placeholder: (_, url) => PlaceholderWidget(),
      errorWidget: (_, url, error) => PlaceholderWidget(),
      fit: fit,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/ic_placeholder_widget.png',
      fit: BoxFit.cover,
    );
  }
}

class CustomizedButton extends StatelessWidget {
  final String text;
  final String img;
  final double verticalPadding;
  final Color textColor;

  const CustomizedButton(
      {Key? key,
      required this.text,
      this.verticalPadding = 0,
      this.textColor = Colors.white,
      this.img = ''})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: verticalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isEmpty(img)
                ? Container()
                : Row(
                    children: [
                      Image.asset(
                        img,
                        height: 20,
                        width: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
            Text(
              text,
              style: boldWhiteText14(textColor),
            ),
          ],
        ),
      ),
    );
  }
}

class GenericProgressBar extends StatelessWidget {
  final String tag;

  GenericProgressBar({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    APIController controller = Get.find(tag: tag);
    return Obx(() {
      return (controller.isLoading.value)
          ? AbsorbPointer(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: SpinKitFadingCircle(color: accentColor),
                ),
              ),
            )
          : Container();
    });
  }
}

class MySearchableTextField<T> extends StatelessWidget {
  bool readOnly;
  bool requireDensed;
  TextEditingController? controller;
  TextInputType keyboardType;
  String? hint;
  TextStyle? textStyle;
  double verticalPad, horizontalPad;

  List<TextInputFormatter>? inputFormatters;

  final List<SearchFieldListItem<T>> suggestions;
  final Function(SearchFieldListItem<T>) onItemSelected;

  MySearchableTextField({
    Key? key,
    this.controller,
    this.readOnly = false,
    this.keyboardType = TextInputType.text,
    this.requireDensed = false,
    this.hint,
    this.textStyle,
    this.verticalPad = 0.0,
    this.horizontalPad = 0.0,
    this.inputFormatters,
    required this.suggestions,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SearchField<T>(
        suggestions: suggestions,
        searchInputDecoration: densedFieldDecorationWithoutPadding(
          hint: hint,
          verticalPad: verticalPad,
          horizontalPad: horizontalPad,
          requireDensed: requireDensed,
        ),
        marginColor: Colors.transparent,
        suggestionItemDecoration: BoxDecoration(),
        suggestionsDecoration: SuggestionDecoration(
            padding: EdgeInsets.symmetric(horizontal: 10),
            border: Border.all(color: Colors.black)),
        inputFormatters: inputFormatters,
        searchStyle: textStyle,
        suggestionState: Suggestion.hidden,
        maxSuggestionsInViewPort: 3,
        suggestionAction: SuggestionAction.unfocus,
        onSuggestionTap: onItemSelected,
        inputType: keyboardType,
        controller: controller,
        readOnly: readOnly,
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  bool obscureText;
  bool readOnly;
  bool requireDensed;
  TextEditingController? controller;
  int textLength;
  int? minLines;
  int? maxLines;
  TextInputType keyboardType;
  TextAlign textAlign;
  String? hint;
  String? text;
  FocusNode? focus;
  TextStyle? textStyle;
  double verticalPad, horizontalPad;

  List<TextInputFormatter>? inputFormatters;

  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final Function(PointerDownEvent)? onTapOutSide;

  MyTextField({
    Key? key,
    this.controller,
    this.readOnly = false,
    this.obscureText = false,
    this.textLength = 100,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.requireDensed = false,
    this.hint,
    this.text,
    this.focus,
    this.textStyle,
    this.verticalPad = 0.0,
    this.horizontalPad = 0.0,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters,
    this.onChanged,
    this.onSubmit,
    this.onTapOutSide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        initialValue: text,
        onFieldSubmitted: onSubmit,
        onTapOutside: onTapOutSide,
        decoration: densedFieldDecorationWithoutPadding(
          hint: hint,
          verticalPad: verticalPad,
          horizontalPad: horizontalPad,
          requireDensed: requireDensed,
        ),
        inputFormatters: inputFormatters,
        style: textStyle,
        onChanged: onChanged,
        keyboardType: keyboardType,
        obscureText: obscureText,
        textAlign: textAlign,
        maxLength: textLength,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        focusNode: focus,
        readOnly: readOnly,
      ),
    );
  }
}

class FadeIndexedStack extends StatefulWidget {
  final int index;
  final List<Widget> children;
  final Duration duration;

  const FadeIndexedStack({
    Key? key,
    required this.index,
    required this.children,
    this.duration = const Duration(
      milliseconds: 300,
    ),
  }) : super(key: key);

  @override
  _FadeIndexedStackState createState() => _FadeIndexedStackState();
}

class _FadeIndexedStackState extends State<FadeIndexedStack>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void didUpdateWidget(FadeIndexedStack oldWidget) {
    if (widget.index != oldWidget.index) {
      _controller.forward(from: 0.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: IndexedStack(
        index: widget.index,
        children: widget.children,
      ),
    );
  }
}

class HideScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MyCustomScrollBar extends StatelessWidget {
  final Axis axis;
  final ScrollController? controller;
  final Widget child;
  final physics;

  const MyCustomScrollBar({
    Key? key,
    this.axis = Axis.vertical,
    this.physics,
    this.controller,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        scrollDirection: axis,
        controller: controller,
        child: child,
        physics: physics,
      ),
    );
  }
}

class MyBackButton extends StatefulWidget {
  final String asset;
  final bool? noLogin;

  const MyBackButton(
      {Key? key, this.asset = 'assets/images/ic_back.png', this.noLogin})
      : super(key: key);

  @override
  State<MyBackButton> createState() => _MyBackButtonState();
}

class _MyBackButtonState extends State<MyBackButton> {
  NoLoginController noLoginController = Get.put(NoLoginController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.noLogin == true) {
          noLoginController.advanced(false);
        } else {
          Get.back();
        }
      },
      child: Center(
        child: Image.asset(
          widget.asset,
          height: 31,
        ),
      ),
    );
  }
}

class NoDataFound extends StatelessWidget {
  final Color textColor;

  const NoDataFound({Key? key, this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Data Found',
        style: boldWhiteText16(textColor),
      ),
    );
  }
}

class SweetButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const SweetButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: double.minPositive,
      child: child,
    );
  }
}

class RectangleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RectangleButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.sp),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: regularWhiteText22(textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlinedButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const OutlinedButtonWidget(
      {Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.sp),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(side: BorderSide(color: accentColor)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: regularWhiteText22(accentColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetBar extends StatelessWidget {
  const BottomSheetBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 5,
      decoration: rectangularCustomColorBoxDecorationWithRadius(
          40, 40, 40, 40, Colors.grey),
      child: SizedBox(),
    );
  }
}

class PullDownToRefresh extends StatelessWidget {
  final RefreshController controller;
  final VoidCallback onRefresh;
  final Widget child;

  const PullDownToRefresh(
      {Key? key,
      required this.controller,
      required this.onRefresh,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      onRefresh: onRefresh,
      child: child,
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var homeScreenController =
        Get.find<HomeScreenController>(tag: NamedRoutes.routeHome);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 10, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.sp),
              child: SweetButton(
                onPressed: () {
                  Get.toNamed(NamedRoutes.routeMethodMenu);
                },
                child: Image.asset(
                  'assets/images/ic_method_logo.png',
                  height: 35,
                ),
              ),
            ),
            SweetButton(
              onPressed: () {
                Get.toNamed(NamedRoutes.routeProfileSettings);
              },
              child: CircularAvatar(
                  imagePath:
                      '${homeScreenController.userInformation.value.profileImg}',
                  imageSize: 42),
            )
          ],
        ),
      ),
    );
  }
}

class TitleAndDaysCounter extends StatefulWidget {
  final title;
  final Function(int count) onChange;

  const TitleAndDaysCounter({Key? key, this.title = '', required this.onChange})
      : super(key: key);

  @override
  State<TitleAndDaysCounter> createState() => _TitleAndDaysCounterState();
}

class _TitleAndDaysCounterState extends State<TitleAndDaysCounter> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: regularWhiteText14(accentColor),
        ),
        verticalSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkResponse(
              onTap: () {
                if (counter > 0) {
                  setState(() {
                    --counter;
                    widget.onChange(counter);
                  });
                }
              },
              child: Image.asset(
                'assets/images/ic_minus.png',
                height: 3,
              ),
            ),
            horizontalSpace(),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '$counter\n',
                style: boldWhiteText18(accentColor),
                children: [
                  TextSpan(
                    text: 'Days',
                    style: regularWhiteText16(accentColor),
                  )
                ],
              ),
            ),
            horizontalSpace(),
            InkResponse(
              onTap: () {
                if (counter < 100) {
                  setState(() {
                    ++counter;
                    widget.onChange(counter);
                  });
                }
              },
              child: Image.asset(
                'assets/images/ic_plus.png',
                height: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TitleAndAnyCounter extends StatefulWidget {
  final title;
  final Function(int count) onChange;

  const TitleAndAnyCounter({Key? key, this.title = '', required this.onChange})
      : super(key: key);

  @override
  State<TitleAndAnyCounter> createState() => _TitleAndAnyCounterState();
}

class _TitleAndAnyCounterState extends State<TitleAndAnyCounter> {
  int counter = 0;
  // IncrementDecrement incrementDecrement=Get.put(IncrementDecrement());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: boldWhiteText18(accentColor),
        ),
        verticalSpace(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                if (counter > 0) {
                  setState(() {
                    counter--;
                    widget.onChange(counter);
                  });
                }
              },
              icon: Image.asset(
                'assets/images/ic_minus.png',
                height: 3,
              ),
            ),
            Container(
              constraints: BoxConstraints(minWidth: 60),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '${(counter == 0) ? 'ANY' : counter}',
                  style: boldText21(accentColor),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (counter < 100) {
                  setState(() {
                    counter++;
                    widget.onChange(counter);
                  });
                  // widget.onChange(counter);
                }
              },
              icon: Image.asset(
                'assets/images/ic_plus.png',
                height: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class TitleAndDateCounter extends StatefulWidget {
  final Function(int count) onChange;

  const TitleAndDateCounter({Key? key, required this.onChange})
      : super(key: key);

  @override
  State<TitleAndDateCounter> createState() => _TitleAndDateCounterState();
}

class _TitleAndDateCounterState extends State<TitleAndDateCounter> {
  late String date;
  int days = 3;
  int hours = 1;

  @override
  void initState() {
    super.initState();
    date = formatDate(DateTime.now().add(Duration(days: days)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SweetButton(
              onPressed: () {
                setState(() {
                  if (hours == 0) {
                    hours = 23;
                  } else {
                    --hours;
                  }
                });
              },
              child: Image.asset(
                'assets/images/ic_minus.png',
                height: 3,
              ),
            ),
            horizontalSpace(),
            Container(
              child: buildHourlyClock(),
            ),
            horizontalSpace(),
            SweetButton(
              onPressed: () {
                setState(() {
                  setState(() {
                    if (hours == 23) {
                      hours = 0;
                    } else {
                      ++hours;
                    }
                  });
                });
              },
              child: Image.asset(
                'assets/images/ic_plus.png',
                height: 16,
              ),
            ),
            horizontalSpace(width: 20),
            Text(
              'on',
              style: boldWhiteText14(accentColor),
            )
          ],
        ),
        verticalSpace(),
        Row(
          children: [
            SweetButton(
              onPressed: () {
                setState(() {
                  date = formatDate(DateTime.now().add(Duration(days: --days)));
                });
              },
              child: Image.asset(
                'assets/images/ic_minus.png',
                height: 3,
              ),
            ),
            horizontalSpace(),
            Container(
              width: 140,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '${date}',
                  style: boldWhiteText18(accentColor),
                ),
              ),
            ),
            horizontalSpace(),
            SweetButton(
              onPressed: () {
                setState(() {
                  date = formatDate(DateTime.now().add(Duration(days: ++days)));
                });
              },
              child: Image.asset(
                'assets/images/ic_plus.png',
                height: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHourlyClock() {
    logMessage(hours);
    String timeUnit = 'AM';
    int time = hours;
    if (hours > 12) {
      time = hours - 12;
      timeUnit = 'PM';
    } else if (hours == 0) {
      time = hours + 12;
      timeUnit = 'AM';
    } else if (hours == 12) {
      timeUnit = 'PM';
    } else {
      timeUnit = 'AM';
    }
    return Container(
      constraints: BoxConstraints(minWidth: 140),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            text: '$time',
            style: boldWhiteText18(accentColor),
            children: [
              TextSpan(
                text: timeUnit,
                style: boldWhiteText12(accentColor),
              )
            ]),
      ),
    );
  }
}

class CheckboxAndText extends StatefulWidget {
  final bool checked;
  final String text;
  final Function(bool checked) onChange;

  const CheckboxAndText(
      {Key? key,
      this.checked = false,
      required this.onChange,
      required this.text})
      : super(key: key);

  @override
  State<CheckboxAndText> createState() => _CheckboxAndTextState();
}

class _CheckboxAndTextState extends State<CheckboxAndText> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SweetButton(
            onPressed: () {
              setState(() {
                checked = !checked;
                widget.onChange(checked);
              });
            },
            child: Image.asset(
              checked
                  ? 'assets/images/ic_checked.png'
                  : 'assets/images/ic_unchecked.png',
              height: 24,
            ),
          ),
          horizontalSpace(),
          Text(
            widget.text,
            style: regularWhiteText14(accentColor),
          )
        ],
      ),
    );
  }
}

class TextAndBoolCheckbox extends StatefulWidget {
  final bool checked;
  final Function(bool checked) onChange;

  const TextAndBoolCheckbox(
      {Key? key, this.checked = true, required this.onChange})
      : super(key: key);

  @override
  State<TextAndBoolCheckbox> createState() => _TextAndBoolCheckboxState();
}

class _TextAndBoolCheckboxState extends State<TextAndBoolCheckbox> {
  late bool checked;

  @override
  void initState() {
    super.initState();
    checked = widget.checked;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Text(
            'Applied towards purchase price:',
            style: regularWhiteText14(accentColor),
          ),
          horizontalSpace(),
          SweetButton(
            onPressed: () {
              setState(() {
                checked = !checked;
                widget.onChange(checked);
              });
            },
            child: Text(
              checked ? 'YES' : 'NO',
              style: boldWhiteText18(accentColor),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChoiceChips extends StatefulWidget {
  final List<Map<String, dynamic>> chipsData;
  final Function(Map<String, dynamic> chipSelected) onSelected;

  const CustomChoiceChips(
      {Key? key, required this.chipsData, required this.onSelected})
      : super(key: key);

  @override
  State<CustomChoiceChips> createState() => _CustomChoiceChipsState();
}

class _CustomChoiceChipsState extends State<CustomChoiceChips> {
  late List<Map<String, dynamic>> chipsData;

  @override
  void initState() {
    super.initState();
    chipsData = widget.chipsData;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(chipsData.length, (index) {
          var chip = chipsData[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.sp),
            child: SweetButton(
              onPressed: () {
                chipsData.forEach((chip) {
                  chip['isSelected'] = false;
                });
                setState(() {
                  chip['isSelected'] = true;
                  widget.onSelected(chip);
                });
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                decoration:
                    rectangularCustomColorBoxAndBorderDecorationWithRadius(
                        10,
                        (chip['isSelected']) ? accentColor : Colors.transparent,
                        (chip['isSelected']) ? accentColor : disabledTextColor,
                        borderWidth: 1.0),
                child: Text(
                  chip['title'],
                  style: regularWhiteText14(
                      (chip['isSelected']) ? textColor : disabledTextColor),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
