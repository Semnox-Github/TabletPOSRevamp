import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_data/models/login_response.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:messages_data/builder.dart';
import 'package:nfc/nfc.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_content_widgets/holdEntitlements/card_details_container.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/remark_widget.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

import '../../screens/widgets/card_details_widget.dart';
import 'package:widgets_library/utils/size_config.dart';
import '../text_style.dart';

class HoldEntitlementDialog extends StatefulWidget {
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  final LoginResponse? loginResponse;
  const HoldEntitlementDialog(
      {super.key,
      this.loginResponse,
      this.onSuccessShowNotification,
      this.onFailureShowNotification});

  @override
  State<HoldEntitlementDialog> createState() => _HoldEntitlementDialogState();
}

class _HoldEntitlementDialogState extends State<HoldEntitlementDialog> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();
  bool _isNFCAvailable = false;
  bool isEnable = false;


  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    Future.microtask(() async {
      _isNFCAvailable = await NFCManager().isNfcAvailable();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocProvider(
      create: (context) => OtherFunctionBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: Colors.green,
            child: notificationBar,
          ),
        ),
        body: Column(
          children: [
        Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          decoration: BoxDecoration(
              color: theme.backGroundColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(6), topLeft: Radius.circular(6))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  height: SizeConfig.getSize(96),
                  decoration: BoxDecoration(
                    color: theme.button2InnerShadow1,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(SizeConfig.getSize(8)),
                      bottomRight: Radius.circular(SizeConfig.getSize(8)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: SizeConfig.getSize(30)),
                      Center(
                        child: Text(
                          MessagesProvider.get(
                              'Hold Entitlements'),
                          style: theme.headingLight4?.copyWith(
                              color: Colors.white,
                              fontSize: SizeConfig.getFontSize(22)),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Container(
                  height: SizeConfig.getSize(96),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(SizeConfig.getSize(8)),
                    color:  theme.button1BG1,
                  ),
                  child:  BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
                    listener: (context, state) {
                      final otherFunctionBLoc =
                      context.read<OtherFunctionBloc>();
                      if (state is ClearState) {
                        context.read<OtherFunctionBloc>().isApplied = false;
                        context.read<OtherFunctionBloc>().tokenCount.value =
                        0;
                      }
                    },
                    builder: (context, state) {
                      OtherFunctionBloc otherFunctionBloc =
                      context.read<OtherFunctionBloc>();
                      if (state is CardDetailsState ||
                          (otherFunctionBloc.isApplied )) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                const EdgeInsets.symmetric(vertical: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5),
                                color: theme.checkboxLight,
                                child: Column(
                                  children: [
                                    Text(
                                      MessagesProvider.get('Customer Name'),
                                      textAlign: TextAlign.start,
                                      style: theme.description3,
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      otherFunctionBloc.accounts?.data
                                          ?.first.customerName ??
                                          '',
                                      style: KTextStyle.smallBlackText,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  )

                ),
              ),
              const SizedBox(width: 8,),
            ],
          ),
        ),
      ),
            Expanded(
              child: CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.backGroundColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6)),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.6),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Spacer(),
                              BlocBuilder<OtherFunctionBloc,
                                  OtherFunctionState>(
                                builder: (context, state) {
                                  final OtherFunctionBloc otherFunctionBloc =
                                      context.read<OtherFunctionBloc>();
                                  otherFunctionBloc.otherFunctionType =
                                      'hold entitlements';
                                  if (state is CardDetailsState ||
                                      otherFunctionBloc.isApplied) {
                                    return Expanded(
                                      flex: 8,
                                      child: Scroller(
                                        controller: _formScrollController,
                                        child: SingleChildScrollView(
                                          controller: _formScrollController,
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                color: Colors.white,
                                              ),
                                              child: CardDetailsContainer(
                                                  dateFormat: otherFunctionBloc
                                                      .dateTimeFormat,
                                                  data: otherFunctionBloc
                                                      .accounts?.data?.first),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  return Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    children: [
                                      _isNFCAvailable
                                          ? Text(
                                        MessagesProvider.get(
                                            'Tap Card   OR'),
                                        style: theme.heading5?.copyWith(
                                            fontSize:
                                            SizeConfig.getFontSize(
                                                22)),
                                      )
                                          : const SizedBox(),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        height:SizeConfig.getSize(60),
                                        width:SizeConfig.getSize(300),
                                        child: TextFormField(
                                          controller: otherFunctionBloc
                                              .cardController,
                                          onChanged: (value) {
                                            setState(() {
                                              otherFunctionBloc
                                                  .tapStatus.value = '';
                                              otherFunctionBloc.cardController
                                                  .text = value;
                                              otherFunctionBloc.cardController
                                                  .selection =
                                                  TextSelection.fromPosition(
                                                      TextPosition(
                                                          offset:
                                                          otherFunctionBloc
                                                              .cardController
                                                              .text
                                                              .length));
                                              isEnable = value.length == 8
                                                  ? true
                                                  : false;
                                            });
                                          },
                                          style: SizeConfig.isBigDevice()?  theme.description2!.copyWith(fontSize: SizeConfig.getFontSize(20)) : theme.description2!,
                                          decoration: InputDecoration(
                                            hintText: MessagesProvider.get(
                                                'Enter Card No'),
                                            hintStyle: theme
                                                .textFieldHintStyle!
                                                .copyWith(
                                                fontSize:
                                                SizeConfig.getSize(
                                                    20)),
                                            contentPadding: EdgeInsets.only(
                                              top: 0,
                                              bottom: 0,
                                              right: SizeConfig.getSize(10),
                                              left: SizeConfig.getSize(10),
                                            ),
                                            constraints: BoxConstraints(
                                                maxHeight:
                                                SizeConfig.getSize(58),
                                                minHeight:
                                                SizeConfig.getSize(58)),
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color: theme.button1BG1!),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 1,
                                                  color:
                                                  theme.secondaryColor!),
                                            ),
                                          ),
                                        ),
                                      ),

                                      Padding(
                                            padding:  EdgeInsets.all(SizeConfig.getSize(8)),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.all(SizeConfig.getWidth(4)),
                                              tapTargetSize:
                                              MaterialTapTargetSize.shrinkWrap,
                                              maximumSize: Size(SizeConfig.getSize(100),SizeConfig.getSize(68)),
                                              minimumSize:  Size(SizeConfig.getSize(100),SizeConfig.getSize(68)),
                                              shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(
                                                    SizeConfig.getSize(8)), // <-- Radius
                                               ),
                                              backgroundColor: otherFunctionBloc
                                                .cardController
                                                .text
                                                .isNotEmpty
                                                  ? theme.button2InnerShadow1!
                                                  : theme.button1BG1!,
                                              ),
                                            onPressed: ()async{
                                                FocusScope.of(context).unfocus();
                                                otherFunctionBloc.cardController.text.isNotEmpty ?
                                                otherFunctionBloc.add(
                                                  CardDetailEvent(otherFunctionBloc
                                                  .cardController.text),
                                                ):null;
                                            },
                                  child:BlocProvider(
                                    create: (_) =>
                                        OtherFunctionBloc(),
                                    child: BlocBuilder<
                                        OtherFunctionBloc,
                                        OtherFunctionState>(
                                      bloc: otherFunctionBloc,
                                      builder: (context, state) {
                                        if (state
                                        is LoadingState) {
                                          return Container(
                                            width: SizeConfig.getSize(35),
                                            height:SizeConfig.getSize(35),
                                            padding: const EdgeInsets.all(2.0),
                                            child:  CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: SizeConfig.getSize(4),
                                            ),
                                          );
                                        }
                                        return Text(
                                          "APPLY",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: KTextStyle.actionBtnTextStyle(otherFunctionBloc
                                              .cardController
                                              .text
                                              .isNotEmpty
                                              ? theme.light1!
                                              : theme.light2!).copyWith(fontSize: SizeConfig.getFontSize(16)),
                                        );
                                      },
                                    ),
                                  ),
                                  ),
                                  ),

                                    ],
                                  );
                                },
                              ),
                               const Spacer(),
                              const RemarkWidget(),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: BlocConsumer<OtherFunctionBloc,
                                    OtherFunctionState>(
                                  listener: (context, state) {
                                    if (state is SuccessState) {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        widget.onSuccessShowNotification!(
                                            state.message.toString());
                                        notificationBar.showMessage(
                                            state.message.toString(),
                                            KColor
                                                .notificationBGLightBlueColor);
                                      });
                                    } else if (state is BodyLoader) {
                                      Future.microtask(() =>
                                          loader.showLoaderDialog(context));
                                    } else if (state is ErrorState) {
                                      if (state.message == 'Issued Card') {
                                        loader.hideLoaderDialog(context);
                                        notificationBar.showMessage(
                                            MessagesProvider.get(
                                                'Please tap an Issued card...'),
                                            state.color ?? Colors.red);
                                      } else {
                                        notificationBar.showMessage(
                                            state.message,
                                            state.color ?? Colors.red);
                                      }
                                    } else if (state is ClearState) {
                                      context
                                          .read<OtherFunctionBloc>()
                                          .accounts = null;
                                      notificationBar.showMessage(
                                          "", theme.primaryColor!);
                                    } else if (state is ApiErrorState) {
                                      Navigator.of(context).pop();
                                      notificationBar.showMessage(state.message,
                                          state.color ?? Colors.red);
                                    } else if (state is CardDetailsState) {
                                      notificationBar.showMessage(
                                          state.message ?? "",
                                          state.color ?? theme.primaryColor!);
                                    }
                                  },
                                  builder: (context, state) {
                                    final OtherFunctionBloc otherFunctionBloc =
                                        context.read<OtherFunctionBloc>();
                                    if (state is SuccessState) {}
                                    if (state is UpdateDisplayState) {
                                      context
                                          .read<OtherFunctionBloc>()
                                          .display = context
                                              .read<OtherFunctionBloc>()
                                              .accounts
                                              ?.data
                                              ?.first
                                              .totalTicketsBalance ??
                                          0.0;
                                    }
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        OfActionBtns(
                                          onClick: () {
                                            context
                                                .read<OtherFunctionBloc>()
                                                .add(ClearEvent());
                                          },
                                          text: 'CLEAR',
                                          btnColor: theme.button1BG1!,
                                          textColor: theme.primaryOpposite!,
                                        ),
                                        OfActionBtns(
                                          onClick: otherFunctionBloc
                                                      .accounts
                                                      ?.data
                                                      ?.first
                                                      .accountCreditPlusDTOList
                                                      ?.first
                                                      .obligationStatus ==
                                                  null
                                              ? () {}
                                              : () {
                                                  context
                                                      .read<OtherFunctionBloc>()
                                                      .add(CardEntitlement(
                                                          managerId: widget
                                                              .loginResponse
                                                              ?.data
                                                              ?.userPKId));
                                                },
                                          text: otherFunctionBloc
                                                          .accounts
                                                          ?.data
                                                          ?.first
                                                          .accountCreditPlusDTOList
                                                          ?.first
                                                          .obligationStatus ==
                                                      "HELD" ||
                                                  otherFunctionBloc
                                                          .accounts
                                                          ?.data
                                                          ?.first
                                                          .accountDiscountDTOList
                                                          ?.first
                                                          .obligationStatus ==
                                                      "HELD"
                                              ? 'UNHOLD'
                                              : 'HOLD',
                                          btnColor: theme.button2InnerShadow1!,
                                          textColor: theme.light1!,
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
