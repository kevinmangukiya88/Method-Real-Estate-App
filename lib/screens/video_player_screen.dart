import 'dart:developer';
import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/generic_api_response.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen>
    with WidgetsBindingObserver {
  late APIController apiController;
  late dynamic knowledgebase;

  bool dd = false;

  late VideoPlayerController _videoPlayerController;

  CustomVideoPlayerController? _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
    ]);
    knowledgebase = Get.arguments;

    _videoPlayerController = VideoPlayerController.network(
      knowledgebase.videoSrc,
    )..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );

    apiController = Get.put(APIController(), tag: NamedRoutes.routeVideoPlayer);
    fetchKnowledgebases();

    apiController.baseModel.listen((baseModel) {
      if (baseModel.status == 200) {}
    });

    _customVideoPlayerController!.videoPlayerController.play();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        log("app in inactive");
        break;
      case AppLifecycleState.paused:
        if (_videoPlayerController.value.isInitialized) {
          var playbackSeconds = _customVideoPlayerController!
              .videoPlayerController.value.position.inSeconds;
          var totalDuration = _customVideoPlayerController!
              .videoPlayerController.value.duration.inSeconds;

          var percentage = (playbackSeconds / totalDuration) * 100;

          Get.find<APIController>(tag: NamedRoutes.routeHome)
              .webservice
              .apiCallSaveVideoProgress({
            'progress': '${percentage}',
            'post_id': '${knowledgebase.id}',
            'progress_record_id': null,
          }, RxBool(false));
        }
        log("app in paused");
        break;
      case AppLifecycleState.detached:
        log("app in detached");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MediaQuery.of(context).orientation == Orientation.landscape
        ? Scaffold(
            body: SizedBox(
              height: Get.height,
              width: Get.width,
              child: CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController!,
              ),
            ),
          )
        : MyScaffold(
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
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 20),
      child: Stack(
        children: [
          ListView(
            children: [
              verticalSpace(height: 15),
              Row(
                children: [
                  MyBackButton(),
                  horizontalSpace(),
                  SizedBox(
                    width: 270.sp,
                    child: Text(
                      '/Knowledgebase/${knowledgebase.title ?? ""}',
                      style: regularWhiteText12(accentColor),
                      overflow: TextOverflow.clip,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              verticalSpace(height: 20),
              _videoPlayerController.value.isInitialized
                  ? CustomVideoPlayer(
                      customVideoPlayerController:
                          _customVideoPlayerController!,
                    )
                  : Container(
                      width: size.width,
                      height: 220,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage('${knowledgebase.thumbnail}'),
                      )),
                      child:
                          GenericProgressBar(tag: NamedRoutes.routeVideoPlayer),
                    ),
              verticalSpace(),
              Text(
                knowledgebase.title,
                style: boldWhiteText24(accentColor),
              ),
              verticalSpace(),
              Text(
                'Added ${formatDate(parseDate(knowledgebase.createdAt.toString(), format: "yyyy-MM-dd'T'HH:mm:ss"), format: 'MMM dd, yyyy')}',
                style: regularWhiteText14(accentColor),
              ),
            ],
          ),
          GenericProgressBar(tag: NamedRoutes.knowledgebase)
        ],
      ),
    );
  }

  void fetchKnowledgebases() {
    apiController.webservice.apiCallFetchRecentlyAddedKnowledgeBases(
        {},
        apiController
            .isLoading).then((value) =>
        GenericAPIResponse.handleAPIResponse(NamedRoutes.knowledgebase, value));
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    if (_videoPlayerController.value.isInitialized) {
      var playbackSeconds = _customVideoPlayerController!
          .videoPlayerController.value.position.inSeconds;
      var totalDuration = _customVideoPlayerController!
          .videoPlayerController.value.duration.inSeconds;

      var percentage = (playbackSeconds / totalDuration) * 100;

      Get.find<APIController>(tag: NamedRoutes.routeHome)
          .webservice
          .apiCallSaveVideoProgress({
        'progress': '${percentage}',
        'post_id': '${knowledgebase.id}',
        'progress_record_id': null,
      }, RxBool(false));
    }
    _customVideoPlayerController?.dispose();
    _videoPlayerController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
