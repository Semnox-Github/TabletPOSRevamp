import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_ui/loader_dialog.dart' as loader;
import 'package:messages_data/builder.dart';
import 'package:notificationbar_ui/NotificationBar.dart';
import 'package:other_function_ui/bloc/other_function_bloc.dart';
import 'package:other_function_ui/widgets/action_btns.dart';
import 'package:other_function_ui/widgets/colors.dart';
import 'package:other_function_ui/widgets/of_header.dart';
import 'package:other_function_ui/widgets/remark_widget.dart';
import 'package:themes_library/themes_library.dart';
import 'package:widgets_library/scroller.dart';

class OfItemPopUp extends StatefulWidget {
  final OtherFunctionEvent event;
  final String header;
  final Widget contentWidget;
  final bool isHeader;
  final Function? onSuccessShowNotification;
  final Function? onFailureShowNotification;
  const OfItemPopUp(
      {Key? key,
      required this.height,
      required this.width,
      required this.header,
      required this.isHeader,
      required this.event,
      this.onSuccessShowNotification,
      this.onFailureShowNotification,
      required this.contentWidget})
      : super(key: key);

  final double height;
  final double width;

  @override
  State<OfItemPopUp> createState() => _OfItemPopUpState();
}

class _OfItemPopUpState extends State<OfItemPopUp> {
  late NotificationBar notificationBar;
  final ScrollController _formScrollController = ScrollController();

  @override
  void initState() {
    notificationBar = NotificationBar(showHideSideBar: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SemnoxTheme theme = Theme.of(context).extension<SemnoxTheme>()!;
    return BlocProvider(
      create: (context) => OtherFunctionBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: SizedBox(
          width: widget.width,
          child: Container(
            color: Colors.green,
            child: notificationBar,
          ),
        ),
        body: Column(
          children: [
            OfHeader(header: widget.header, isHeader: widget.isHeader),
            Expanded(
              child: CustomScrollView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: true,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: theme.backGroundColor,
                          // borderRadius: const BorderRadius.only(
                          //     bottomLeft: Radius.circular(6),
                          //     bottomRight: Radius.circular(6)),
                        ),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight:
                                  MediaQuery.of(context).size.height * 0.65),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // const Spacer(),
                              Expanded(
                                // flex: 8,
                                child: Scroller(
                                  controller: _formScrollController,
                                  child: SingleChildScrollView(
                                    controller: _formScrollController,
                                    child: Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: theme.backGroundColor,
                                        ),
                                        child: widget.contentWidget,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                  color: theme.backGroundColor, child: const RemarkWidget()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Container(
                color: theme.backGroundColor,
                child: BlocConsumer<OtherFunctionBloc, OtherFunctionState>(
                  listener: (context, state) {
                    final otherFunctionBloc = context.read<OtherFunctionBloc>();
                    if (!(otherFunctionBloc.otherFunctionType ==
                            'loyalty points' ||
                        otherFunctionBloc.otherFunctionType ==
                            'virtual points')) {
                      otherFunctionBloc.otherFunctionType = widget.header;
                    }
                    if (state is SuccessState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          widget.onSuccessShowNotification!("${state.message}");
                          notificationBar.showMessage(state.message ?? '',
                              theme.primaryColor ?? Colors.red);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      );
                    } else if (state is MessageState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) {
                          notificationBar.showMessage(
                              state.message ?? '', state.color ?? Colors.red);
                        },
                      );
                    } else if (state is ErrorState) {
                      if (state.message == 'Issued Card') {
                        otherFunctionBloc.tapStatus.value = '';
                      }
                      notificationBar.showMessage(
                          state.message, state.color ?? Colors.red);
                    } else if (state is ApiErrorState) {
                      Navigator.pop(context);
                      if (state.message == "Redemption value is 0\r\n") {
                        notificationBar.showMessage(
                            "Something went wrong. Please try again. ${state.message}",
                            state.color ?? KColor.notificationBGRedColor);
                      } else {
                        notificationBar.showMessage(state.message,
                            state.color ?? KColor.notificationBGRedColor);
                      }
                    } else if (state is ClearState) {
                      otherFunctionBloc.redeemBonus.value = 0;
                      notificationBar.showMessage("", theme.primaryColor!);
                      otherFunctionBloc.redeemTickets.value = 0.0;
                    } else if (state is CardDetailsState) {
                      notificationBar.showMessage(state.message ?? "",
                          state.color ?? theme.primaryColor!);
                    }
                  },
                  builder: (context, state) {
                    if (state is BodyLoader) {
                      Future.microtask(() => loader.showLoaderDialog(context));
                    }
                    if (state is UpdateDisplayState) {
                      context.read<OtherFunctionBloc>().display = context
                              .read<OtherFunctionBloc>()
                              .accounts
                              ?.data
                              ?.first
                              .totalTicketsBalance ??
                          0.0;
                    }
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OfActionBtns(
                          onClick: () {
                            context
                                .read<OtherFunctionBloc>()
                                .remarkController
                                .clear();
                            context.read<OtherFunctionBloc>().add(ClearEvent());
                          },
                          text: MessagesProvider.get('CLEAR'),
                          btnColor: theme.button1BG1!,
                          textColor: theme.primaryOpposite!,
                        ),
                        OfActionBtns(
                          onClick: () {
                            notificationBar.showMessage('', Colors.white);
                            FocusManager.instance.primaryFocus?.unfocus();
                            context.read<OtherFunctionBloc>().add(widget.event);
                          },
                          text: MessagesProvider.get('CONFIRM'),
                          btnColor: theme.button2InnerShadow1!,
                          textColor: theme.light1!,
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
