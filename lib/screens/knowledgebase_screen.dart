import 'package:agentapp/controllers/apiControllers/api_controller.dart';
import 'package:agentapp/models/knowledgebase_model.dart';
import 'package:agentapp/models/responseModel/get_knowledge_response_model.dart';
import 'package:agentapp/models/responseModel/get_knowledge_search_response_model.dart'
    as rs;
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/constants.dart';
import 'package:agentapp/utils/generic_api_response.dart';
import 'package:agentapp/viewModel/get_knowledge_search_view_model.dart';
import 'package:agentapp/viewModel/get_knowledge_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';
import '../utils/decorations.dart';
import '../utils/styles.dart';
import '../utils/utils.dart';
import '../utils/widgets.dart';

class KnowledgebaseScreen extends StatefulWidget {
  const KnowledgebaseScreen({Key? key}) : super(key: key);

  @override
  State<KnowledgebaseScreen> createState() => _KnowledgebaseScreenState();
}

class _KnowledgebaseScreenState extends State<KnowledgebaseScreen> {
  var knowledgebases = <KnowledgebaseModel>[].obs;

  late APIController apiController;
  GetKnowledgeSearchViewModel _getKnowledgeSearchViewModel =
      Get.put(GetKnowledgeSearchViewModel());
  GetKnowledgeBaseViewModel _getKnowledgeBaseViewModel =
      Get.put(GetKnowledgeBaseViewModel());
  bool searchSubmit = false;
  @override
  void initState() {
    super.initState();
    // propertyDetailScreenController = Get.put(PropertyDetailScreenController(), tag: NamedRoutes.routePropertyDetail);
    apiController = Get.put(APIController(), tag: NamedRoutes.knowledgebase);

    // fetchKnowledgebases();

    apiController.baseModel.listen((baseModel) {
      if (baseModel.status == 200) {
        knowledgebases.value = (baseModel.data['recentlyAdded'] as List)
            .map((e) => KnowledgebaseModel.fromMap(e))
            .toList();
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
    return Padding(
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
                    '/Knowledgebase',
                    style: regularWhiteText12(accentColor),
                  )
                ],
              ),
              verticalSpace(height: 20),
              Text(
                'Knowledgebase',
                style: boldWhiteText24(accentColor),
              ),
              verticalSpace(),
              Column(
                children: [
                  Container(
                    decoration:
                        rectangularCustomColorBoxAndBorderDecorationWithRadius(
                            12, lightGreyColor, Colors.transparent),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          Expanded(
                            child: SizedBox(
                              height: 52,
                              child: MyTextField(
                                onChanged: (val) {},
                                onSubmit: (val) {
                                  if (val.isNotEmpty) {
                                    searchSubmit = true;
                                    _getKnowledgeSearchViewModel
                                        .getKnowledgeSearchViewModel(
                                            searchWord: '${val}');
                                  }
                                },
                                requireDensed: true,
                                hint: 'Search Knowledgebase',
                                verticalPad: 16,
                                horizontalPad: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  verticalSpace(),
                  Text(
                    searchSubmit == true ? 'Search Results' : 'Recently Added',
                    style: boldWhiteText24(accentColor),
                  ),
                ],
              ),
              searchSubmit == true
                  ? Expanded(child: GetBuilder<GetKnowledgeSearchViewModel>(
                      builder: (controller) {
                        if (controller.getKnowledgeBaseResponse.status ==
                            Status.LOADING) {
                          return AbsorbPointer(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              child: Center(
                                child: SpinKitFadingCircle(color: accentColor),
                              ),
                            ),
                          );
                        } else if (controller.getKnowledgeBaseResponse.status ==
                            Status.COMPLETE) {
                          rs.GetKnowledgeSearchResponseModel response =
                              controller.getKnowledgeBaseResponse.data;
                          return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 50.sp),
                            itemBuilder: (context, index) {
                              var knowledgebase = response.data![index];
                              return SweetButton(
                                onPressed: () {
                                  // KnowledgebaseModel data =response.data![index];

                                  Get.toNamed(NamedRoutes.routeVideoPlayer,
                                      arguments: response.data![index]);
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          color: Colors.yellow,
                                          width: size.width,
                                          child: Image.network(
                                            '${knowledgebase.thumbnail}',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          child: Container(
                                            height: 50.sp,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration:
                                                rectangularCustomColorBoxDecorationWithRadius(
                                                    0,
                                                    0,
                                                    0,
                                                    0,
                                                    accentColor
                                                        .withOpacity(0.4)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${knowledgebase.title}',
                                                  style: boldWhiteText12(
                                                      textColor),
                                                  maxLines: 1,
                                                ),
                                                verticalSpace(height: 2),
                                                Text(
                                                  'Added ${formatDate(parseDate(knowledgebase.createdAt.toString(), format: "yyyy-MM-dd'T'HH:mm:ss"), format: 'MMM dd, yyyy')}',
                                                  style: regularWhiteText10(
                                                      textColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Visibility(
                                    //   visible:
                                    //   index < (knowledgebases.value.length - 1),
                                    //   child: verticalSpace(),
                                    // )
                                  ],
                                ),
                              );
                            },
                            itemCount: response.data!.length,
                          );
                        } else {
                          return Center(
                            child: Text('Something Went Wrong'),
                          );
                        }
                      },
                    ))
                  : Expanded(
                      child: GetBuilder<GetKnowledgeBaseViewModel>(
                        builder: (controller) {
                          if (controller.getKnowledgeResponse.status ==
                              Status.LOADING) {
                            return AbsorbPointer(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Center(
                                  child:
                                      SpinKitFadingCircle(color: accentColor),
                                ),
                              ),
                            );
                          } else if (controller.getKnowledgeResponse.status ==
                              Status.COMPLETE) {
                            GetKnowledgeResponseModel response =
                                controller.getKnowledgeResponse.data;
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              padding: EdgeInsets.only(top: 50.sp),
                              itemBuilder: (context, index) {
                                var knowledgebase =
                                    response.data!.recentlyAdded![index];
                                return SweetButton(
                                  onPressed: () {
                                    Get.toNamed(NamedRoutes.routeVideoPlayer,
                                        arguments: response
                                            .data!.recentlyAdded![index]);
                                  },
                                  child: Column(
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            color: Colors.yellow,
                                            width: size.width,
                                            child: Image.network(
                                              '${knowledgebase.thumbnail}',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              height: 50.sp,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                              decoration:
                                                  rectangularCustomColorBoxDecorationWithRadius(
                                                      0,
                                                      0,
                                                      0,
                                                      0,
                                                      accentColor
                                                          .withOpacity(0.4)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${knowledgebase.title}',
                                                    style: boldWhiteText12(
                                                        textColor),
                                                    maxLines: 1,
                                                  ),
                                                  verticalSpace(height: 2),
                                                  Text(
                                                    'Added ${formatDate(DateTime.parse(knowledgebase.createdAt.toString()), format: 'MMM dd, yyyy')}',
                                                    style: regularWhiteText10(
                                                        textColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              itemCount: response.data!.recentlyAdded!.length,
                            );
                          } else {
                            return Center(
                              child: Text('Something Went Wrong'),
                            );
                          }
                        },
                      ),
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
}
