import 'package:agentapp/controllers/uiControllers/property_detail_screen_controller.dart';
import 'package:agentapp/custome/calender/lib/flutter_neat_and_clean_calendar.dart';
import 'package:agentapp/models/responseModel/get_advance_search_property_response_model.dart'
    as rs;
import 'package:agentapp/models/responseModel/listing_history_response_model.dart';
import 'package:agentapp/services/api_service/api_response.dart';
import 'package:agentapp/utils/decorations.dart';
import 'package:agentapp/utils/widgets.dart';
import 'package:agentapp/viewModel/get_client_list_view_model.dart';
import 'package:agentapp/viewModel/listing_history_view_model.dart';
import 'package:agentapp/viewModel/request_offer_view_model.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:cool_dropdown/models/cool_dropdown_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:searchfield/searchfield.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/styles.dart';
import '../../utils/utils.dart';

class PropertyInformation extends StatelessWidget {
  final rs.Doc? docs;
  PropertyInformation({this.docs}) : super();
  ListingHistoryViewModel _listingHistoryViewModel =
      Get.put(ListingHistoryViewModel());
  final DateFormat formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String Function(Match) mathFunc = (Match match) => '${match[1]},';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Private Remarks',
              style:
                  regularWhiteText14(accentColor, fontWeight: FontWeight.w600),
            ),
            ReadMoreText(
              '${docs!.privateRemarks}',
              style: regularWhiteText14(accentColor),
              trimLines: 4,
              colorClickableText: accentColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: 'Read less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        verticalSpace(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Public Remarks',
              style:
                  regularWhiteText14(accentColor, fontWeight: FontWeight.w600),
            ),
            ReadMoreText(
              '${docs!.publicRemarks}',
              style: regularWhiteText14(accentColor),
              trimLines: 4,
              colorClickableText: accentColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Read more',
              trimExpandedText: ' Read less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Basement: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.basement == []
                        ? 'None'
                        : '${docs!.basement.toString().replaceAll('[', '').replaceAll(']', '')}',
                    style: regularWhiteText14(accentColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Bedroom: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.roomBedroomFeatures == []
                        ? 'None'
                        : '${docs!.roomBedroomFeatures.toString().replaceAll('[', '').replaceAll(']', '')}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Pool: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.poolFeatures == []
                        ? 'None'
                        : '${docs!.poolFeatures.toString().replaceAll('[', '').replaceAll(']', '')}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Lot Size: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: '${docs!.lotSizeDimensions}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'County: ',
                    style: regularWhiteText14(accentColor),
                    children: [
                      TextSpan(
                        text: '${docs!.country}',
                        style: regularWhiteText14(disabledTextColor),
                      )
                    ],
                  ),
                ),
                horizontalSpace(),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Tax ID: ',
                      style: regularWhiteText14(accentColor),
                      children: [
                        TextSpan(
                          text: '${docs!.taxParcelLetter}',
                          style: regularWhiteText14(disabledTextColor),
                        )
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            verticalSpace(height: 7),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Annual Taxes: ',
                      style: regularWhiteText14(accentColor),
                      children: [
                        TextSpan(
                          text: docs!.taxAnnualAmount == null
                              ? ''
                              : '\$${docs!.taxAnnualAmount}',
                          style: regularWhiteText14(disabledTextColor),
                        )
                      ],
                    ),
                  ),
                ),
                horizontalSpace(),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Tax Year: ',
                      style: regularWhiteText14(accentColor),
                      children: [
                        TextSpan(
                          text: docs!.taxYear == null ? '' : '${docs!.taxYear}',
                          style: regularWhiteText14(disabledTextColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            verticalSpace(height: 7),
            Row(
              children: [
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'MLS Number: ',
                      style: regularWhiteText14(accentColor),
                      children: [
                        TextSpan(
                          text: '${docs!.listingId}',
                          style: regularWhiteText14(disabledTextColor),
                        )
                      ],
                    ),
                  ),
                ),
                horizontalSpace(),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'Comp: ',
                      style: regularWhiteText14(accentColor),
                      children: [
                        TextSpan(
                          text: '${docs!.buyerAgencyCompensation}%',
                          style: regularWhiteText14(disabledTextColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Subdivision: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: 'Full, Finished',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'HOA: ',
                    style: regularWhiteText14(accentColor),
                    children: [
                      TextSpan(
                        text:
                            docs!.associationYn == true ? 'Mandatory' : 'None',
                        style: regularWhiteText14(disabledTextColor),
                      )
                    ],
                  ),
                ),
                horizontalSpace(),
                RichText(
                  text: TextSpan(
                    text: 'Dues: ',
                    style: regularWhiteText14(accentColor),
                    children: [
                      TextSpan(
                        text: '${docs!.associationFee}',
                        style: regularWhiteText14(disabledTextColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Assoc. Fee Includes: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: '${docs!.associationFeeFrequency}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Rentals Restricted: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.fmlsBuyerOfficePresentOffersYn == true
                        ? 'Yes'
                        : 'No',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Elem: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.elementarySchool == null
                        ? 'None'
                        : '${docs!.elementarySchool}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'Middle: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.middleOrJuniorSchool == null
                        ? 'None'
                        : '${docs!.middleOrJuniorSchool}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
            verticalSpace(height: 7),
            RichText(
              text: TextSpan(
                text: 'High: ',
                style: regularWhiteText14(accentColor),
                children: [
                  TextSpan(
                    text: docs!.highSchool == null
                        ? 'None'
                        : '${docs!.highSchool}',
                    style: regularWhiteText14(disabledTextColor),
                  )
                ],
              ),
            ),
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Listing/Sales History',
              style:
                  regularWhiteText14(accentColor, fontWeight: FontWeight.w600),
            ),
            Divider(
              thickness: 0.5,
              color: accentColor,
            ),
            GetBuilder<ListingHistoryViewModel>(
              builder: (controller) {
                if (controller.getListingHistoryResponse.status ==
                    Status.COMPLETE) {
                  ListingHistoryResponseModel response =
                      controller.getListingHistoryResponse.data;
                  return response.response == null ||
                          response.response!.docs == [] ||
                          response.response!.docs == null
                      ? SizedBox()
                      : Column(
                          children: List.generate(
                            response.response!.docs!.length,
                            (index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: Get.width * 0.28,
                                        child: Text(
                                          '${response.response!.docs![index].mlsStatus}',
                                          style: regularWhiteText14(
                                              disabledTextColor),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        width: Get.width * 0.28,
                                        child: Text(
                                          '\$${response.response!.docs![index].listPrice.toString().split('.').first.toString().replaceAllMapped(reg, mathFunc)}',
                                          style: regularWhiteText14(
                                              disabledTextColor),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        width: Get.width * 0.20,
                                        child: Text(
                                          '${formatter.format(DateTime.parse(response.response!.docs![index].modificationTimestamp.toString()))}',
                                          style: regularWhiteText14(
                                              disabledTextColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 0.5,
                                    color: accentColor,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                } else {
                  return SizedBox();
                }
              },
            )
          ],
        ),
        verticalSpace(height: 40),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Listing Broker Information',
              style:
                  regularWhiteText14(accentColor, fontWeight: FontWeight.w600),
            ),
            verticalSpace(),
            Text(
              '${docs!.listOfficeName} - ${docs!.listOfficeMlsId}',
              style: regularWhiteText14(accentColor),
            ),
          ],
        ),
        verticalSpace(height: 20),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    '${docs!.listAgentFullName}',
                    style: regularWhiteText18(accentColor),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_search.png',
                        height: 44,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Direct: ${docs!.listAgentDirectPhone}',
                    style: regularWhiteText18(accentColor),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          try {
                            FlutterPhoneDirectCaller.callNumber(
                                '${docs!.listAgentDirectPhone}');
                          } catch (e) {}
                        },
                        child: Image.asset(
                          'assets/images/ic_call.png',
                          height: 44,
                        ),
                      ),
                      horizontalSpace(),
                      InkWell(
                        onTap: () {
                          _sendSMS(
                              message: '',
                              recipents: ['${docs!.listAgentDirectPhone}']);
                        },
                        child: Image.asset(
                          'assets/images/ic_chat.png',
                          height: 44,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpace(),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Text(
                    'Office: ${docs!.listOfficePhone}',
                    style: regularWhiteText18(accentColor),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          try {
                            FlutterPhoneDirectCaller.callNumber(
                                '${docs!.listOfficePhone}');
                          } catch (e) {}
                        },
                        child: Image.asset(
                          'assets/images/ic_call.png',
                          height: 44,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
        verticalSpace(height: 20),
        Text(
          'Accuracy of all information deemed reliable but not guaranteed and should be independently verified. ©2022 FMLS',
          style: regularWhiteText14(accentColor),
        ),
      ],
    );
  }

  void _sendSMS({String? message, List<String>? recipents}) async {
    String _result = await sendSMS(message: message!, recipients: recipents!)
        .catchError((onError) {
      print(onError);
    });
    print(_result);
  }
}

class PropertyOfferRequested extends StatefulWidget {
  final rs.Doc? docs;
  const PropertyOfferRequested({this.docs}) : super();

  @override
  State<PropertyOfferRequested> createState() => _PropertyOfferRequestedState();
}

class _PropertyOfferRequestedState extends State<PropertyOfferRequested> {
  PropertyDetailScreenController propertyDetailScreenController =
      Get.put(PropertyDetailScreenController());
  bool isExpand = false;
  GetClientListViewModel _getClientListViewModel =
      Get.put(GetClientListViewModel());
  RequestOfferViewModel _requestOfferViewModel =
      Get.put(RequestOfferViewModel());
  @override
  void initState() {
    super.initState();
    propertyDetailScreenController =
        Get.find(tag: NamedRoutes.routePropertyDetail);
  }

  bool isClosingDateShow = false;
  bool isEndDate = false;
  DateTime? closingDate = DateTime.now();
  DateTime? endDate = DateTime.now();
  var isFileSelected = false.obs;
  var offerRequested = false.obs;
  var attachments = [].obs;

  List<CoolDropdownItem<String>> emHolders = [
    CoolDropdownItem<String>(label: 'Method', value: 'Method'),
    CoolDropdownItem<String>(label: 'Coop', value: 'Coop'),
    CoolDropdownItem<String>(label: 'Attorney', value: 'Attorney'),
  ];
  List<CoolDropdownItem<String>> financingTypes = [
    CoolDropdownItem<String>(label: 'FHA', value: 'FHA'),
    CoolDropdownItem<String>(label: 'VA', value: 'VA'),
    CoolDropdownItem<String>(label: 'CONV', value: 'CONV'),
    CoolDropdownItem<String>(label: 'CASH', value: 'CASH'),
  ];
  late RxList<Map<String, dynamic>> requestedOfferTerms;
  RxBool isex = false.obs;

  List<bool> valll = [];
  @override
  Widget build(BuildContext context) {
    requestedOfferTerms = [
      {
        'title': 'Require Disclosures within 3 days of binding',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.changeSellerProDis(checked);
              },
              text: 'Sellers Property Disclosure',
            ),
            verticalSpace(),
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.ChangeCommAsosDis(checked);
              },
              text: 'Community Assoc Disclosure',
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Buyer Will Cover Appraisal Gap',
        'body': Row(
          children: [
            Text(
              'Up to',
              style: regularWhiteText14(accentColor),
            ),
            horizontalSpace(),
            Expanded(
              child: commonTextFiled(
                  controller: _requestOfferViewModel.appraisalGap),
            ),
            horizontalSpace(width: 20),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Escalation Clause',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Beat Offers By',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(),
                Expanded(
                  child: commonTextFiled(
                      controller:
                          _requestOfferViewModel.escalationBestOffersBy),
                ),
                horizontalSpace(width: 20),
              ],
            ),
            verticalSpace(),
            Row(
              children: [
                Text(
                  'Up to Max Price:',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(),
                Expanded(
                  child: commonTextFiled(
                      controller: _requestOfferViewModel.escalationMaxPrice),
                ),
                horizontalSpace(width: 20),
              ],
            )
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Temporary Occupancy By Seller',
        'body': Column(
          children: [
            Row(
              children: [
                IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 120),
                    child: commonTextFiled(
                        controller: _requestOfferViewModel.dayAfterClosing),
                  ),
                ),
                horizontalSpace(),
                Text(
                  'Days after closing',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(width: 20),
              ],
            ),
            verticalSpace(),
            Row(
              children: [
                Text(
                  'Days after closing',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(),
                IntrinsicWidth(
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 120),
                    child: commonTextFiled(
                        controller:
                            _requestOfferViewModel.dayAfterClosingPerDay),
                  ),
                ),
                horizontalSpace(),
                Text(
                  'Per day',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(width: 20),
              ],
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Seller to pay home warranty',
        'body': Row(
          children: [
            Text(
              'Cost not to exceed:',
              style: regularWhiteText14(accentColor),
            ),
            horizontalSpace(),
            Expanded(
              child: commonTextFiled(
                  controller: _requestOfferViewModel.sellerPayHomeWarranty),
            ),
            horizontalSpace(width: 20),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Seller to pay closing costs',
        'body': Row(
          children: [
            Text(
              'Cost not to exceed:',
              style: regularWhiteText14(accentColor),
            ),
            horizontalSpace(),
            Expanded(
              child: commonTextFiled(
                  controller: _requestOfferViewModel.sellerPayClosingCost),
            ),
            horizontalSpace(width: 20),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Specify Common Items Remain',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.updateWasher(checked);
              },
              text: 'Washer and Dryer',
            ),
            verticalSpace(),
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.updateRegige(checked);
              },
              text: 'Refigerator',
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Make this a backup offer',
        'body': Row(
          children: [
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.updateBackUpOffer(checked);
              },
              text: 'Inc. Backup Exhibit',
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Include Option Fee to Seller',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Amount:',
                  style: regularWhiteText14(accentColor),
                ),
                horizontalSpace(),
                Expanded(
                  child: commonTextFiled(
                      controller:
                          _requestOfferViewModel.optionFeeToSellerAmount),
                ),
                horizontalSpace(width: 20),
              ],
            ),
            TextAndBoolCheckbox(
              onChange: (bool checked) {},
            )
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Require Termite Letter/Bond',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.changSellerLetter(checked);
              },
              text: 'Seller to provide clear termite letter',
            ),
            verticalSpace(),
            CheckboxAndText(
              onChange: (bool checked) {
                _requestOfferViewModel.changeSellerBond(checked);
              },
              text: 'Seller to provide 1 year termite bond',
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Include BBA with offer',
        'body': Row(
          children: [
            Text(
              'Agreement Term',
              style: regularWhiteText14(accentColor),
            ),
            horizontalSpace(),
            IntrinsicWidth(
              child: Container(
                constraints: BoxConstraints(maxWidth: 180),
                child: commonTextFiled(
                    controller: _requestOfferViewModel.agreemTermDay),
              ),
            ),
            horizontalSpace(),
            Text(
              'Days',
              style: regularWhiteText14(accentColor),
            ),
            horizontalSpace(width: 20),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Include Home Sale Contingency',
        'body': Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address of Property to Sell',
                  style: regularWhiteText14(accentColor),
                ),
                verticalSpace(),
                Container(
                  decoration:
                      rectangularCustomColorBoxAndBorderDecorationWithRadius(
                          4, Colors.transparent, accentColor,
                          borderWidth: 1.0),
                  child: MyTextField(
                    requireDensed: true,
                    hint: 'Address of property',
                    horizontalPad: 20,
                    verticalPad: 16,
                  ),
                )
              ],
            ),
            verticalSpace(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contingency End Date',
                  style: regularWhiteText14(accentColor),
                ),
                verticalSpace(),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration:
                            rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                4, Colors.transparent, accentColor,
                                borderWidth: 1.0),
                        child: MyTextField(
                          requireDensed: true,
                          readOnly: true,
                          horizontalPad: 20,
                          verticalPad: 16,
                        ),
                      ),
                    ),
                    horizontalSpace(),
                    InkWell(
                      onTap: () {},
                      child: Image.asset(
                        'assets/images/ic_calendar.png',
                        height: 56,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Attach Proof of Funds/Prequal Letter',
        'body': Row(
          children: [
            Flexible(
              child: MyCustomScrollBar(
                axis: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    children: List.generate(
                      attachments.length,
                      (index) {
                        var path = attachments[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: CircularAvatar(
                            imagePath: path,
                            imageSize: 8,
                            imageWidth: 62,
                            imageHeight: 76,
                            isNetworkImage: 'file',
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ),
            SweetButton(
              onPressed: () {
                uploadFile('photo', (file) {
                  attachments.add(file?.path);
                });
              },
              child: Image.asset(
                'assets/images/ic_attach.png',
                height: 76,
              ),
            )
          ],
        ),
        'isExpanded': false,
      },
      {
        'title': 'Include Time Limit on Offer',
        'body': TitleAndDateCounter(
          onChange: (int count) {},
        ),
        'isExpanded': false,
      },
      {
        'title': 'Notes/Comments',
        'body': TextFormField(
          controller: _requestOfferViewModel.note,
          keyboardType: TextInputType.number,
          style: boldWhiteText18(accentColor),
          // maxLength: 7,
          decoration: InputDecoration(
              counter: Offstage(),
              contentPadding: EdgeInsets.all(10),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              focusedBorder: OutlineInputBorder()),
        ),
        'isExpanded': false,
      }
    ].obs;
    return GetBuilder<RequestOfferViewModel>(
      builder: (controller) {
        return Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GetBuilder<GetClientListViewModel>(
                  builder: (controller1) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Client(s)',
                              style: regularWhiteText14(accentColor),
                            ),
                            verticalSpace(),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    decoration:
                                        rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                            4, Colors.transparent, accentColor,
                                            borderWidth: 1.0),
                                    child: SearchField(
                                      suggestions: controller1.datas
                                          .map((e) => SearchFieldListItem(
                                              e.name.toString(),
                                              child: Text('${e.name}'),
                                              item: e.id))
                                          .toList(),
                                      searchInputDecoration: InputDecoration(
                                        isDense: false,
                                        counterText: '',
                                        border: InputBorder.none,
                                        hintText: '',
                                        hintStyle: regularWhiteText14(
                                            Colors.black.withOpacity(0.5)),
                                      ),
                                      controller: controller.firstClient,
                                      marginColor: Colors.transparent,
                                      suggestionItemDecoration: BoxDecoration(),
                                      suggestionsDecoration:
                                          SuggestionDecoration(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 0.3)),
                                      hint: 'Start Typing Client Name',
                                      offset: Offset(0, 60),
                                      suggestionState: Suggestion.hidden,
                                      maxSuggestionsInViewPort: 3,
                                      suggestionAction:
                                          SuggestionAction.unfocus,
                                      onSuggestionTap: (item) {
                                        print(item.searchKey);
                                        controller.firstClient.text =
                                            item.searchKey;
                                        controller.fubId = item.item.toString();
                                        controller1.changeRead(true);
                                        controller1.changeStatusM(true);
                                      },
                                      readOnly: controller1.read,
                                    ),
                                  ),
                                ),
                                controller1.changeStatus == true
                                    ? SizedBox(
                                        width: 15,
                                      )
                                    : SizedBox(),
                                controller1.changeStatus == true
                                    ? controller1.addFiled == true
                                        ? InkWell(
                                            onTap: () {
                                              controller1.updateFiled(false);
                                            },
                                            child: Icon(
                                              Icons.remove_circle_outline,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              controller1.updateFiled(true);
                                            },
                                            child: Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.black,
                                              size: 30,
                                            ),
                                          )
                                    : SizedBox()
                              ],
                            ),
                          ],
                        ),
                        controller1.addFiled == true
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  verticalSpace(),
                                  Text(
                                    'Select Client(s)',
                                    style: regularWhiteText14(accentColor),
                                  ),
                                  verticalSpace(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15),
                                          decoration:
                                              rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                  4,
                                                  Colors.transparent,
                                                  accentColor,
                                                  borderWidth: 1.0),
                                          child: SearchField(
                                            suggestions: controller1.clientList
                                                .map((e) => SearchFieldListItem(
                                                    e.toString(),
                                                    child: Text('$e')))
                                                .toList(),
                                            searchInputDecoration:
                                                InputDecoration(
                                              isDense: false,
                                              counterText: '',
                                              border: InputBorder.none,
                                              hintText: '',
                                              hintStyle: regularWhiteText14(
                                                  Colors.black
                                                      .withOpacity(0.5)),
                                            ),
                                            controller: controller.secondClient,
                                            marginColor: Colors.transparent,
                                            suggestionItemDecoration:
                                                BoxDecoration(),
                                            suggestionsDecoration:
                                                SuggestionDecoration(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.3)),
                                            hint: 'Start Typing Client Name',
                                            offset: Offset(0, 60),
                                            suggestionState: Suggestion.hidden,
                                            maxSuggestionsInViewPort: 3,
                                            suggestionAction:
                                                SuggestionAction.unfocus,
                                            onSuggestionTap: (item) {
                                              print(item.searchKey);
                                              controller.secondClient.text =
                                                  item.searchKey;
                                              controller1.changeReadTwo(true);
                                              controller1.changeStatusM(true);
                                            },
                                            readOnly: controller1.readTwo,
                                          ),
                                        ),
                                      ),
                                      controller1.changeStatus == true
                                          ? SizedBox(
                                              width: 15,
                                            )
                                          : SizedBox(),
                                      controller1.changeStatus == true
                                          ? controller1.addFiled == true
                                              ? InkWell(
                                                  onTap: () {
                                                    controller1
                                                        .updateFiled(false);
                                                    controller1
                                                        .changeReadTwo(false);
                                                    controller.secondClient
                                                        .clear();
                                                  },
                                                  child: Icon(
                                                    Icons.remove_circle_outline,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    controller1
                                                        .updateFiled(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                )
                                          : SizedBox()
                                    ],
                                  ),
                                ],
                              )
                            : SizedBox()
                      ],
                    );
                  },
                ),
                verticalSpace(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Offer Price:',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          MyTextField(
                            controller: controller.offerPrice,
                            requireDensed: true,
                            textStyle: boldWhiteText18(accentColor),
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Closing Date',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '${DateFormat('MMM dd yy').format(closingDate!)}',
                                style: boldWhiteText18(accentColor),
                              ),
                              horizontalSpace(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isClosingDateShow = !isClosingDateShow;
                                  });
                                },
                                child: Image.asset(
                                  'assets/images/ic_calendar.png',
                                  height: 36,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleAndDaysCounter(
                            title: 'Due Diligence',
                            onChange: (int count) {
                              controller.dueDiligence = count;
                            },
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(),
                    Text(
                      'Or',
                      style: boldWhiteText18(accentColor),
                    ),
                    horizontalSpace(),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleAndDaysCounter(
                            title: 'Right to Req Repairs',
                            onChange: (int count) {
                              controller.rightToReqRepairs = count;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Earnest Money',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          MyTextField(
                            controller: controller.earnestMoney,
                            requireDensed: true,
                            textStyle: boldWhiteText18(accentColor),
                          ),
                        ],
                      ),
                    ),
                    TitleAndDaysCounter(
                      title: 'EM Due Days',
                      onChange: (int count) {
                        controller.emDueDays = count;
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'EM Holder',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          CoolDropdown(
                            isMarquee: true,
                            controller: DropdownController(),
                            dropdownList: emHolders,
                            defaultItem: emHolders[0],
                            resultOptions: ResultOptions(
                              boxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              openBoxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              errorBoxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              padding: EdgeInsets.zero,
                              mainAxisAlignment: MainAxisAlignment.end,
                              space: 0,
                              width: 120,
                              height: 20,
                              icon: null,
                              textStyle: boldWhiteText18(accentColor),
                              render: ResultRender.label,
                            ),
                            dropdownTriangleOptions:
                                DropdownTriangleOptions(width: 0, height: 0),
                            onChange: (item) {
                              controller.emHolder = item;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Financing Type',
                            style: regularWhiteText14(accentColor),
                          ),
                          verticalSpace(),
                          CoolDropdown(
                            isMarquee: true,
                            controller: DropdownController(),
                            dropdownList: financingTypes,
                            defaultItem: financingTypes[0],
                            resultOptions: ResultOptions(
                              boxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              openBoxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              errorBoxDecoration:
                                  BoxDecoration(color: Colors.transparent),
                              padding: EdgeInsets.zero,
                              mainAxisAlignment: MainAxisAlignment.start,
                              space: 0,
                              width: 120,
                              height: 20,
                              icon: null,
                              textStyle: boldWhiteText18(accentColor),
                              render: ResultRender.label,
                            ),
                            dropdownTriangleOptions:
                                DropdownTriangleOptions(width: 0, height: 0),
                            onChange: (item) {
                              controller.financingType = item;
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TitleAndDaysCounter(
                            title: 'Finance\nContingency',
                            onChange: (int count) {
                              controller.financeCounting = count;
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TitleAndDaysCounter(
                            title: 'Apprisal\nContingency',
                            onChange: (int count) {
                              controller.apprisalContingency = count;
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                verticalSpace(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Closing Attorney',
                      style: regularWhiteText14(accentColor),
                    ),
                    verticalSpace(),
                    Container(
                      decoration:
                          rectangularCustomColorBoxAndBorderDecorationWithRadius(
                              4, Colors.transparent, accentColor,
                              borderWidth: 1.0),
                      child: MyTextField(
                        controller: controller.closingAttorny,
                        requireDensed: true,
                        hint: 'Start Typing Closing Attorney Name',
                        horizontalPad: 20,
                        verticalPad: 16,
                      ),
                    )
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    verticalSpace(),
                    Obx(() {
                      return Column(
                        children: [
                          ...List.generate(requestedOfferTerms.length, (index) {
                            var term = requestedOfferTerms[index];
                            return Theme(
                              data: ThemeData()
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                trailing: SizedBox(),
                                childrenPadding: EdgeInsets.all(5),
                                tilePadding: EdgeInsets.all(0),
                                onExpansionChanged: (val) {
                                  term['isExpanded'] = val;
                                  requestedOfferTerms.refresh();
                                },
                                initiallyExpanded: term['isExpanded'],
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 40),
                                    child: index == 11
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Address of Property to Sell',
                                                    style: regularWhiteText14(
                                                        accentColor),
                                                  ),
                                                  verticalSpace(),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10),
                                                      decoration:
                                                          rectangularCustomColorBoxAndBorderDecorationWithRadius(
                                                              4,
                                                              Colors
                                                                  .transparent,
                                                              accentColor,
                                                              borderWidth: 1.0),
                                                      child:
                                                          GooglePlaceAutoCompleteTextField(
                                                        // textEditingController: controller,
                                                        googleAPIKey:
                                                            "AIzaSyBLjgELUHE9X1z5OI0if3tMRDG5nWK2Rt8",
                                                        inputDecoration:
                                                            InputDecoration(
                                                                border:
                                                                    InputBorder
                                                                        .none),
                                                        // optional by default null is set
                                                        isLatLngRequired:
                                                            true, // if you required coordinates from place detail
                                                        getPlaceDetailWithLatLng:
                                                            (Prediction
                                                                prediction) {
                                                          // this method will return latlng with place detail
                                                          print("placeDetails" +
                                                              prediction.lng
                                                                  .toString());
                                                        }, // this callback is called when isLatLngRequired is true
                                                        itmClick: (Prediction
                                                            prediction) {
                                                          _requestOfferViewModel
                                                                  .address
                                                                  .text =
                                                              prediction
                                                                  .description!;
                                                          _requestOfferViewModel
                                                                  .address
                                                                  .selection =
                                                              TextSelection.fromPosition(
                                                                  TextPosition(
                                                                      offset: prediction
                                                                          .description!
                                                                          .length));
                                                        },
                                                        textEditingController:
                                                            _requestOfferViewModel
                                                                .address,
                                                      ))
                                                ],
                                              ),
                                              verticalSpace(),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'Contingency End Date',
                                                    style: regularWhiteText14(
                                                        accentColor),
                                                  ),
                                                  verticalSpace(),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Expanded(
                                                        child: TextFormField(
                                                          readOnly: true,
                                                          controller:
                                                              _requestOfferViewModel
                                                                  .contingencyEndDate,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          style:
                                                              boldWhiteText18(
                                                                  accentColor),
                                                          // maxLength: 7,
                                                          decoration: InputDecoration(
                                                              counter:
                                                                  Offstage(),
                                                              contentPadding:
                                                                  EdgeInsets
                                                                      .all(10),
                                                              border: OutlineInputBorder(
                                                                  borderSide: BorderSide(
                                                                      color: Colors
                                                                          .black,
                                                                      width:
                                                                          5)),
                                                              focusedBorder:
                                                                  OutlineInputBorder()),
                                                        ),
                                                        // commonTextFiled(
                                                        //     controller:
                                                        //         _requestOfferViewModel
                                                        //             .contingencyEndDate),
                                                      ),
                                                      horizontalSpace(),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            isEndDate =
                                                                !isEndDate;
                                                          });
                                                        },
                                                        child: Image.asset(
                                                          'assets/images/ic_calendar.png',
                                                          height: 45,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : term['body'],
                                  ),
                                ],
                                title: Row(
                                  children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Image.asset(
                                      term['isExpanded']
                                          ? 'assets/images/ic_circle_minus.png'
                                          : 'assets/images/ic_circle_plus.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        term['title'],
                                        style: regularWhiteText14(accentColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                          verticalSpace(height: 60),
                        ],
                      );
                    }),
                    verticalSpace(height: 60),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () async {
                          controller.changeLoading(true);

                          await _requestOfferViewModel.apiCall(
                              context: context,
                              listingId: widget.docs!.listingId);
                          // propertyDetailScreenController.offerRequested.value =
                          //     false;
                        },
                        child: Container(
                            height: 55.sp,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.black),
                            child: Center(
                              child: Text(
                                'Request Offer',
                                style: boldWhiteText14(textColor),
                              ),
                            )),
                      ),
                    ),
                    if (controller.isLoading == true)
                      Positioned(
                        bottom: 200,
                        child: Center(
                          child: SpinKitFadingCircle(color: accentColor),
                        ),
                      ),
                  ],
                ),
              ],
            ),
            if (isEndDate)
              Positioned(
                bottom: 330,
                right: 0,
                left: 0,
                child: Container(
                  width: Get.width - 20,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 3,
                        spreadRadius: 1)
                  ]),
                  child: Calendar(
                    weekDays: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                    isExpandable: true,
                    isExpanded: true,
                    datePickerType: DatePickerType.date,
                    dayOfWeekStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    onDateSelected: (Date) {
                      setState(() {
                        isEndDate = false;
                        endDate = Date;
                        _requestOfferViewModel.contingencyEndDate.text =
                            DateFormat('MMM dd yy').format(endDate!).toString();
                      });
                    },
                    selectedColor: Colors.blue,
                    selectedTodayColor: Colors.blue,
                    hideArrows: false,
                    todayButtonText: '',
                  ),
                ),
              ),
            if (isClosingDateShow)
              Positioned(
                top: 80,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width - 20,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        blurRadius: 3,
                        spreadRadius: 1)
                  ]),
                  child: Calendar(
                    weekDays: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
                    isExpandable: true,
                    isExpanded: true,
                    datePickerType: DatePickerType.date,
                    dayOfWeekStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    onDateSelected: (Date) {
                      setState(() {
                        isClosingDateShow = false;
                        closingDate = Date;
                        controller.closingDate = DateFormat('MMM dd yy')
                            .format(closingDate!)
                            .toString();
                      });
                    },
                    selectedColor: Colors.blue,
                    selectedTodayColor: Colors.blue,
                    hideArrows: false,
                    todayButtonText: '',
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

class commonTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  const commonTextFiled({
    super.key,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: boldWhiteText18(accentColor),
      // maxLength: 7,
      decoration: InputDecoration(
          counter: Offstage(),
          contentPadding: EdgeInsets.all(10),
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder()),
    );
  }
}

class CommonWidget {
  static getSnackBar(BuildContext context,
      {required String message,
      Color color = Colors.black,
      Color colorText = Colors.white,
      int duration = 2}) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: regularWhiteText12(Colors.white),
          ),
          backgroundColor: color,
          duration: Duration(seconds: duration),
          behavior: SnackBarBehavior.floating,
          // margin: EdgeInsets.only(bottom: Get.height * 0.90),
        ),
      );
  }
}
