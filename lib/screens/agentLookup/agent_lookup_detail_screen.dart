import 'package:agentapp/models/responseModel/get_agrents_response_model.dart';
import 'package:agentapp/screens/agentLookup/agent_detail.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/colors.dart';
import 'package:agentapp/utils/styles.dart';
import 'package:agentapp/utils/utils.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:agentapp/viewModel/get_agent_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AgentLookupDetailScreen extends StatefulWidget {
  final String? url;

  const AgentLookupDetailScreen({
    Key? key,
    this.url,
  }) : super(key: key);

  @override
  State<AgentLookupDetailScreen> createState() =>
      _AgentLookupDetailScreenState();
}

class _AgentLookupDetailScreenState extends State<AgentLookupDetailScreen> {
  GetAgentViewModel _agentViewModel = Get.put(GetAgentViewModel());
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 0.0);
  @override
  void initState() {
    _agentViewModel.getAgentViewModel(url: widget.url);
    _agentViewModel.OfficeService.clear();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print('----Paginate');
        // _getTransactionsContractsViewModel.getTransactionsContractsViewModel(
        //     type: 'active', isLoadings: false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(() {});
    super.dispose();
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
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return SafeArea(child: GetBuilder<GetAgentViewModel>(
      builder: (controller) {
        if (controller.getAgentResponse.status == Status.LOADING) {
          return AbsorbPointer(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: SpinKitFadingCircle(color: accentColor),
              ),
            ),
          );
        } else if (controller.getAgentResponse.status == Status.COMPLETE) {
          GetAgentsResponseModel response = controller.getAgentResponse.data;
          return Column(
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
                          '/Agent Lookup/Result',
                          style: regularWhiteText12(accentColor),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.sp,
                    ),
                    Center(
                      child: Text(
                        'Agent Lookup',
                        style: boldWhiteText24(accentColor),
                      ),
                    ),
                    SizedBox(height: 10.sp),
                  ],
                ),
              ),
              SizedBox(
                height: 5.sp,
              ),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                    physics: BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(AgentDetailScreen(
                            firstname:
                                '${response.response!.docs![index].memberFirstName}',
                            lastName:
                                '${response.response!.docs![index].memberLastName}',
                            mlsId:
                                '${response.response!.docs![index].memberMlsId}',
                            officeMlsId:
                                '${response.response!.docs![index].officeMlsId}',
                            officeName: '${controller.OfficeService[index]}',
                          ));
                        },
                        dense: true,
                        minVerticalPadding: 0,
                        contentPadding: EdgeInsets.symmetric(horizontal: 30.sp),
                        title: Text(
                          '${response.response!.docs![index].memberFullName}',
                          overflow: TextOverflow.ellipsis,
                          style: regularWhiteText20(accentColor,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${controller.OfficeService[index]} | License Number ${response.response!.docs![index].memberStateLicense}',
                              style: regularWhiteText10(accentColor),
                            ),
                          ],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: accentColor,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.sp),
                          child: Divider(
                            height: 0,
                            color: accentColor,
                          ),
                        ),
                    itemCount: response.response!.docs!.length),
              ),
            ],
          );
        } else if (controller.getAgentResponse.status == Status.ERROR) {
          return Center(
            child: Text('Something Went Wrong'),
          );
        } else {
          return Center(
            child: Text('Something Went Wrong'),
          );
        }
      },
    ));
  }
}
